LoadLib("Macro\\��װ����.txt")
AddOption("�Զ�����")
AddOption("Ŀ���л�")
--AddOption("�Զ�����")
--AddOption("�Զ�����")

local target
local tclass
local this_player
local gcdsj = 0.2 --gcdʱ��
local lastSelectTime = 0
local save_target
local isRun = false
local isDanger = false

function jiekong()
    if (GetSkillGCD("�������") + gcdsj) > dingshenTime() then
        return false
    end
    return true
end

function shengtaiji()
    ---��̫��
    if cdEX("��̫��") then
        return false
    end
    if  not buff("��̫��") then
        Cast("��̫��",true,true)
    end
    if target then
        ---��̫��,������
        local npc,count = FindNpc(target, "������̫��", 18, "�Լ�")
        if count==0 then
            skillEX("��̫��")
        end

    end
    return false
end
function zhuanqiankun()
    ---תǬ��
    if cdEX("תǬ��") then
        return false
    end
    if life()<=40 and not statep("����") then
        return true
    end
    return false
end
function tunriyue()
    ---������
    if cdEX("������") then
        return false
    end
    local diduinaima = FindPlayer(20, "�뾭�׵�|�����ľ�|�����|��֪|ؤ��", "�ж�")
    if diduinaima then
        local npc,count = FindNpc(diduinaima, "����������", 10, "�Լ�")
        if count==0 then
            CastTo("������",diduinaima,true)
        end
    end
    if boom()>3 then
        skill("������")
    end
    return false
end
function sanhuantaoyue()
    ---��������
    if dis()>4 or cdEX("��������") or qidian()>=5 then
        return false
    end
    return true
end
function wanjianguizong()
    ---�򽣹���
    local distance = 6
    if HaveTalent("����") then
        distance = 8
    end
    if dis()>distance or cdEX("�򽣹���") then
        return false
    end
    if tlife()<=80 and not tstatep("����") then
        return true
    end

    if findRangeCount(6)>=2 then
        return true
    end
    if findMSRangeCount(6)>=1 then
        return true
    end
    return false
end
function wuwowujian()
    ---�����޽�
    if dis()>4  then
        return false
    end
    if tbuffCS("����")<5 or tbufftime("����")<10 then
        --print("����")
        return true
    end
    if qidian()>=5 then
        return true
    end
    return false
end
function dadaowushu()
    ---�������
    if dis()>8 or cdEX("�������") or tstatep("���")  then
        return false
    end
    if tstatep("����") and jiekong() then
        return true
    end
    if not tstate("����|ѣ��|����") and death(target)  and qidian()>=3 then
        return true
    end
    if not tstate("����|ѣ��|����") and qidian()>=5 then
        return true
    end

    return false
end
function bahuangguiyuan(weight)
    ---�˻Ĺ�Ԫ
    if dis()>12 or cdEX("�˻Ĺ�Ԫ")  then
        return false
    end
    if weight<=10 then
        return true
    end
    return false
end
function renjianheyi()
    ---�˽���һ
    if cdEX("�˽���һ")  then
        return false
    end
    local npc,count
    if target then
     npc,count = FindNpc(target, "������̫��|�����Ʋ��|����������|�������ǳ�|������ɽ��|����������", 6, "�Լ�|����|����")
    if npc and  objDis(npc)<=13 then

        if not tstatep("���") and tstatep("����") and jiekong() then
            return true
        end
        if not tstatep("���") and not tstate("����|ѣ��|����") and tclass ~= NPC and death(target) then
            return true
        end
        if not tstatep("���") and not tstate("����|ѣ��|����") and not cdEX("��̫��") then
            return true
        end
    end
    end
    npc,count = FindNpc(this_player, "������ɽ��", 13, "����")
    if count>0  then
        return true
    end

    return false
end
function jianchongyinyang()
    ---��������
    if dis()>20 or cdEX("��������") or tstatep("���")  then
        return false
    end
    local diduinaima = FindPlayer(20, "�뾭�׵�|�����ľ�|�����|��֪", "�ж�")
    if death(diduinaima) then
        CastTo(diduinaima,true,true)
    end
    if not tstate("����|ѣ��|����")and tclass ~= NPC and death(target)  then
        return true
    end
    if not tstate("����|ѣ��|����") then
        return true
    end

    return false
end
function zuowangwuwo()
    ---��������
    if cdEX("��������") or buff("����")  then
        return false
    end
    return true
end
function ziqidonglai(weight)
    ---��������
    if cdEX("��������")  then
        return false
    end
    if weight<=5 and qidian()<=1 then
        return true
    end
    return false
end
function pinxuyufeng(weight)
    ---ƾ������
    if cdEX("ƾ������")  then
        return false
    end
    if state("����|����") and life()<=70 and not statep("����") then
        return true
    end
    if state("����|����") and weight<=5 then
        return true
    end
    if life()<= 50 and not statep("����") then
        return true
    end
    return false
end

function jianfeijingtian(weight)
    ---���ɾ���
    if not HaveTalent("���ɾ���") or cdEX("���ɾ���") then
        return false
    end
    if objOnHorse(target) and weight<=10 then
        --print("��ǰĿ����")

        return true
    end
    --���������Ա
    for k, v in ipairs(GetAllPlayer()) do
        if IsPlayer(v.dwID) and IsEnemy(v) and not objState(v, "����") and GetDist(g_player, v) < 20 and IsVisible(g_player, v)   then
            if objIsota(v) and (objmount(v, "�����|�뾭�׵�|��֪|�����ľ�") or not IsInArena() ) then
                --�ȱ��浱ǰ����
                --print("��Ŀ����")

                CastTo("���ɾ���", v, true)
            end
            if objIsotaDesc(v,"ƽɳ����|��ˮ��Ӱ") and objmount(v, "Ī��") then
                --�ȱ��浱ǰ����
                --print("��Ŀ����")
                CastTo("���ɾ���", v, true)
            end
        end
    end

    return false
end
function xingtiandao(weight)
    ---�����
    if not HaveTalent("�����") or cdEX("�����") then
        return false
    end
    if death(target) and kongzhi() then
        return true
    end
    if weight<= 10 and kongzhi() then
        return true
    end
    if target then
        local npc,count = FindNpc(target, "������̫��|�����Ʋ��|����������|�������ǳ�|������ɽ��|����������", 20, "�Լ�")
        if weight<= 7 and count>=2 then
            return true
        end
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
    if ziqidonglai(weight) then
        skillEX2("��������")
    end
    if dadaowushu() then
        skillEX("�������")
    end
    if renjianheyi() then
        --print("�˽���һ")
        skillEX("�˽���һ")
    end
    if xingtiandao(weight) then
        skill("�����")
    end
    if jianchongyinyang() then
        skillEX("��������")
    end
    if bahuangguiyuan(weight) then
        skillEX("�˻Ĺ�Ԫ")
    end
    --print("����ǰ")
    if wuwowujian() then
        --print("�����޽�")

        skill("�����޽�")
    end
    if wanjianguizong() then
        --print("�򽣹���")

        skillEX2("�򽣹���")
    end
    if sanhuantaoyue() then
        skill("��������")
    end
    if not cdEX("���ǳ�")  then
        skillEX("���ǳ�")
    end
    if target and shuyunzhuyue() then
        CastTo("��������", target, false)
    end

    if cdEX("��ҡֱ��") == false then
        Cast("��ҡֱ��", true, true)
    end
end
function seurvival(weight)
    ---��������
    if shengtaiji() then

    end
    if zhuanqiankun() then
        skill("תǬ��")
    end
    if tunriyue() then

    end
    if zuowangwuwo() then
        skill("��������")
    end
    if pinxuyufeng(weight) then
        skill("ƾ������")
    end
end



function tab(weight)
    if objState(target, "����") or tbuff("������ŭ") then
        findTargetforRange(30)
        --print("Ŀ������")

    end
    if target == nil and save_target ~= nil then
        SetTarget(save_target)
    end

    -----�ϴ��л�Ŀ�����5��ŻỻĿ��
    if weight >= 50 and (GetTickCount() - lastSelectTime) > 5000 then
        print("Ŀ����˹���")
        lastSelectTime = GetTickCount()
        findTarget(true)
    end

    if tlife() > 20 and not tmount("�뾭�׵�|�����ľ�|�����|��֪") then
        findTargetforHp(20)
    end
end

--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    this_player = player
    target,tclass = setAll(player)
    local weight = getWeight(false)
    if jianfeijingtian(weight) then
        skillEX("���ɾ���")
    end
    if weight>3 and femgche(player, "�ж�") then
        if target then
            if femgche(target, "�ж�") then
                BackTo(target)
            else
                --skill("������Ӱ")
            end
        end
        --if GetOption("�Զ�����") then
            MoveForwardStart()
        --end
        if state("ѣ��|����|����") then
            --Cast("������ɢ", true, true)
        end
        Cast("��ҡֱ��", true, true)
        Jump()
        Cast("��������", true, true)

        --Cast(3973, true, true)
    end

    --print("weight:",weight)
    if GetOption("�Զ��л�") then
        tab(weight)
    end
    seurvival(weight)
    if GetOption("�Զ�����") then
        if  target and  femgche(target, "�ж�") then
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
                toBack()
            else
                if isRun then
                    MoveAction_StopAll()
                    isRun=false
                end
            end

        end
    end

    if tbuff("����") or tbuff("��������") or tbuff("������ŭ") then
        StopAction()
        return
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
        return
    end
    DPS(weight)
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

    --print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --����ͷ���Ϣ
end


--��ʼ�����ص��������������ʼ����ʱ����
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end