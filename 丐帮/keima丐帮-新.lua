LoadLib("Macro\\��װ����.txt")
local target
local tclass
local this_player
local gcdsj = 0.1 --gcdʱ��
local lastSelectTime = 0
local save_target
local isRun = false
local isDanger = false
local isdutiao=false
local laststate

function bogouchaotian()
    ---��������
    if dis()>5 or mana()>30 then
        return false
    end
    return true
end
function kanglong(weight)
    ---�����л�
    local distans = 4
    if HaveTalent("���") then
        distans = 8
    end
    if dis()>distans or mana()<30 or target==nil or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if weight<= 10 or not tstatep("���") then
        return true
    end
    return false
end
function tianxiawugou(weight)
    ---�����޹�
    if dis()>8 or mana()>30 or cdEX("�����޹�") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    return true
end
function bangdagoutou(weight)
    ---����ͷ
    if dis()>20 or cdEX("����ͷ") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if not tstate("���") and not tstatep("���") and mana()<30 and cdEX("�����޹�") then
        return true
    end
    if not tstate("���") and  his()>8 and buff("��ϼ") and mana()<10   then
        return true
    end
    if not tstate("���") and  his()>8 and not buff("��ϼ") and mana()>=10   then
        return true
    end
    if not tstate("���") and buff("��ϼ") and mana()<10   then
        return true
    end
    if not tstate("���") and weight<=4 and dis()>5 then
        return true
    end
    if not tstate("���") and not tstatep("���") and dis()>5 then
        return true
    end
    return false
end
function shuquanxiaori(weight)
    ---��Ȯ����
    if dis()>8 or cdEX("��Ȯ����") or mana()>=10 or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if not tstatep("���") then
        return true
    end
    return false
end
function equanlanlu(weight)
    ---��Ȯ��·
    if dis()>10 or cdEX("��Ȯ��·") or tstatep("���Ṧ") or jiuzhongxian(weight) or xiaozuikuang() then
    return false
    end
    if kongzhiTimeEX(1.5) then
    return true
    end
    return false
end
function longzhanyuye(weight)
    ---��ս��Ұ
    if dis()>15 or cdEX("��ս��Ұ")  or mana()<20  or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if not tstate("���") and not buff("�����л�") and weight>=4 then
        return true
    end
    if not tstate("���") and dis()>5 and not longyueyuyuan(weight) and not bangdagoutou(weight)  then
        return true
    end
    return false
end
function longyueyuyuan(weight)
    ---��Ծ��Ԩ
    if dis()>20 or cdEX("��Ծ��Ԩ") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if not tstate("���") and target and  objOnHorse(target) then
        return true
    end
    if not tstate("���") and not tbuff("�����л�") then
        return true
    end
    if not tstate("���") and dis()>5 and not bangdagoutou(weight)  then
        return true
    end
    return false
end
function longyueyuyuanjiekong(weight)
    ---��Ծ��Ԩ
    if dis()>20 or cdEX("��Ծ��Ԩ") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if state("ѣ��|����|����|��ֱ") then
        return true
    end
    return false
end
function jiaolongfanjaing(weight)
    ---��������
    if dis()>5 or mana()<10 or kanglong(weight) or jiuzhongxian(weight) or xiaozuikuang()  then
        return false
    end
    if mana()>30 then
        return true
    end
    return false
end
function longxiaojiutian(weight)
    ---��Х����
    if  (not HaveTalent("�޾�") and mana()<30 ) or cdEX("��Х����") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if life()<70 and not  statep("����") then
        return true
    end
    if dis()<=6 and weight<=3 then
        return true
    end
    return false
end
function chenglongxishui(weight)
    ---����Ϸˮ
    if   cdEX("����Ϸˮ") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if boom() >= 3 and life() <= 90 and statep("����") == false then
        return true
    end
    if boom() >= 2 and life() <= 70 and statep("����") == false then
        return true
    end
    if life() < 50 then
        return true
    end
    return false
end
function jiuzhongxian(weight)
    ---������
    if cdEX("������") or weight<=3 then
        return false
    end
    if not HaveTalent("��Ұ") and statep("���") then
        return true
    end
    if HaveTalent("��Ұ") then
        return true
    end
    return false
end
function yanyuxing(weight)
    ---������
    if cdEX2("������") or buff("��ϼ") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if not  kanglong(weight) and cdEX("����ͷ") and cdEX("�����޹�") and mana()<30 then
        return true
    end
    return false
end
function yanyuxingzhuiren(weight)
    ---������
    if cdEX2("������")  or jiuzhongxian(weight) or xiaozuikuang()  then
        return false
    end
    if dis()>18 and bangdagoutou(weight) and target and objIsZhengmian(target) then
        return true
    end
    if dis()>10 and bangdagoutou(weight) and longyueyuyuan(weight) and target and objIsZhengmian(target) then
        return true
    end
    if state("����|��ֱ") then
        return true
    end
    return false
end
function xiaozuikuang()
    ---Ц���
    if cdEX("Ц���") then
        return false
    end
    if life() < 30 and not statep("����") then
        return true
    end
    if life() < 20 then
        return true
    end
    return false
end
function shuyunzhuyue()
    ---��������
    if cdEX("��������") then
        return false
    end
    if dis() > 16 then
        return true
    end
    return false
end
function DPS(weight)

    skill("Ȯ������")

    if kanglong(weight) then
        skill("����ң")
        skill("�����л�")
    else
        if equanlanlu(weight) then
            skillEX("��Ȯ��·")
        end
        if bangdagoutou(weight) then
            skill("����ͷ")
        end
        if bogouchaotian(weight)then
            skill("��������")
        end
        if tianxiawugou(weight) then
            skill("�����޹�")
        end

        if shuquanxiaori(weight) then
            skill("��Ȯ����")
        end
        if longzhanyuye(weight) then
            skill("��ս��Ұ")
        end
        if longyueyuyuan(weight) then
            skill("��Ծ��Ԩ")
        end
        if jiaolongfanjaing(weight) then
            skill("��������")
        end

        if yanyuxing(weight) then
            skill(5508)
        end
        if yanyuxingzhuiren(weight)then
            skillEX(5269)
        end
    end

    --if target and shuyunzhuyue() then
    --    CastTo("��������", target, false)
    --end
    --if cdEX("��ҡֱ��") == false then
    --    Cast("��ҡֱ��", true, false)
    --end
end
function seurvival(weight)
    if longyueyuyuanjiekong (weight) then
        skill("��Ծ��Ԩ")
    end

    if longxiaojiutian(weight) then
        Cast("��Х����",true,false)
    end
    if chenglongxishui(weight) then
        Cast("����Ϸˮ",true,false)
    end

end

function dutiao(weight)
    if (GetCastTime(g_player,5268)>0 and GetCastTime(g_player,5268)<2) or (GetCastTime(g_player,5270)>0 and GetCastTime(g_player,5270)<2 )  then
        isdutiao = false
        return
    end
    if jiuzhongxian(weight) then
        if dis()<=5 then
            skill(5508)--������
        end
        isdutiao = true
        SheildMoveKey(true)
        if state("վ��") then
            Cast("������",true)
        else
            MoveAction_StopAll()
        end

        return true
    end
    if xiaozuikuang() then
        isdutiao = true
        SheildMoveKey(true)
        if state("վ��") then
            Cast("Ц���",true,false)
        else
            MoveAction_StopAll()
        end
        return true
    end
    return false
end

function tab(weight)
    if objState(target, "����") or tbuff("������ŭ") then
        findTargetforRange(30)
        --print("Ŀ������")

    end
    --if target and IsParty(target) then
    --    if target ~= nil then
    --        SetTarget(save_target)
    --    end
    --else
    --    if target ~= nil then
    --        save_target = target
    --    end
    --end
    if target == nil and save_target ~= nil then
        SetTarget(save_target)
    end
    --if life() <=40 then
    --	local naima = FindPlayer(40, "�뾭�׵�|�����ľ�|�����|��֪", "����")
    --	if naima and GetDist(naima)>6 then
    --		SetTarget(naima)
    --		help = true
    --	else
    --		if help then
    --			findTargetforRange(8)
    --			help = false
    --		end
    --	end
    --end

    --print("��ǰĿ���Ƿ��Ƕ���",IsParty(target))
    --if cdEX("̽÷") and IsParty(target) and life() >40 then
    --	if save_target ~= nil then
    --		--���ر����Ŀ��
    --		SetTarget(save_target)
    --		print("̽÷����,�л�ԭ��Ŀ��")
    --
    --		return 1
    --	else
    --		findTarget(false)
    --	end
    --	print("̽÷����")
    --end
    -----�ϴ��л�Ŀ�����5��ŻỻĿ��
    if tbuff("��ɽ��") and (GetTickCount() - lastSelectTime) > 5000 then
        print("Ŀ����˹���")
        lastSelectTime = GetTickCount()
        findTarget(true)
    end
    --
    --if IsDangerArea(target, "�ж�") and (GetTickCount() - lastSelectTime) > 5000 then
    --    print("Σ�������л�Ŀ��")
    --    lastSelectTime = GetTickCount()
    --    findTarget(true)
    --end
    if tlife() > 20 and not tmount("�뾭�׵�|�����ľ�|�����|��֪") then
        findTargetforHp(20)
    end
end

--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    this_player = player
    target,tclass = setAll(player)
    local weight = getWeight(true)


    if dutiao(weight) then
        return 1
    end
    if isdutiao or objIsota(player) then
        return 1
    end
    SheildMoveKey(false)
    if weight>3 and femgche(player, "�ж�") then
        if target then
            if femgche(target, "�ж�") then
                BackTo(target)
            else
                skill(5269)
            end
        end
        MoveForwardStart()
        if state("ѣ��|����|����") then
            skill(5269)
        end
        Cast("��ҡֱ��", true, true)
        Jump()
        Cast("��������", true, true)

        --Cast(3973, true, true)
    end

    tab(weight)
    seurvival(weight)
    if target and  femgche(target, "�ж�") then
        TurnTo(target)
        isDanger = true
        if isRun then
            MoveAction_StopAll()
            isRun=false
        end
    else
        isDanger = false
        if target then
            TurnTo(target)
            isRun= true
            MoveForwardStart()
            --toBack()
        else
            if isRun then
                MoveAction_StopAll()
                isRun=false
            end
        end

    end
    if tbuff("����") or tbuff("��������") or tbuff("������ŭ") then
        return 1
    end
    --if ota("�Ʒ����") then
    --    MoveAction_StopAll()
    --    return
    --end
    --���浱ǰĿ��




    if his() > 6 and buff("����") then
        Jump()
    end
    if GetHeight(player) > 6 and dis() <= 4 then
        Jump()
    end
    if target and IsParty(target) then
        return 1
    end
    DPS(weight)
    return 2
end

--end


--�ͷż��ܻص���������������ͷż���ʱ����
function OnCast(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)
    --CasterID �ͷż��ܵĽ�ɫID
    --dwSkillID ����ID
    --dwLevel ���ܵȼ�
    --nPastFrame �ӷ���˷����������ѹ�ȥ��֡��
    --tClass �����ͷŵ�Ŀ������(COORD, NPC, PLAYER)������ͼ��������й�
    --tIDnX �������ҪĿ��ļ��ܣ�����Ǽ��ܵ�Ŀ��ID���������Ҫһ��λ���ͷŵļ��ܣ������x����
    --nY y���꣬�����������͵ļ�����Ч
    --nZ z���꣬�����������͵ļ�����Ч
    --�����и�����123�����ƺ���֮��ļ��ܣ���ʵ�Ǹ����μ��ܣ����������֮��Ż����ѣ��
    --�����������8֡��0.5�룩�������������ܣ����ƣ�����ʲô�ģ�
    --local myid = GetMyID()
    --local skillList =
    --if dwSkillID == 123 and tIDnX == myid then  --����Ƕ����ͷţ�����������׶εļ���ID
    --	--�����ȥ��֡��С��4���ܹ�8֡������4˵������̫��Ѿ��㲻����
    --	--������Ϊ4ֻ����ʾ��ʵս��Ҫ�Լ�����
    --	if nPastFrame < 4 then
    --		Cast(9007)  --����
    --	end
    --end
    if  tIDnX == g_player.dwID then  --������˿�ʼ����123���ܣ�Ŀ�����Լ�
        --print(string.find(duobi,dwSkillID))
        --print("����id:",dwSkillID)
        --if dwSkillID==5268 or dwSkillID==5270 then
        --    isdutiao=false
        --end
        --print(string.find(duobi,dwSkillID)~=nil)
        --if string.find(duobi,dwSkillID)~=nil then
        --print("���")
        --    Cast("������ʤ",true,true)
        --    CastTo("������Ӱ", CasterID, true)  --���������
        --Cast(9007)  --����
        --    Cast(3973)
        --end
    end


    --print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --����ͷ���Ϣ
end


--��ʼ�����ص��������������ʼ����ʱ����
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end