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
local ttarget
local ttclass
function jiekong()
    if (GetSkillGCD("�������") + gcdsj) < dingshenTime() then
        return true
    end
    return false
end

function shengtaiji()
    ---��̫��
    if cdEX("��̫��") then
        return false
    end
    if  not buff("��̫��") then
        Cast("��̫��",true,true)
    end

    return false
end
function pocangqiong()
    ---�Ʋ��
    if cdEX("�Ʋ��") then
        return false
    end
    if  not buff("�Ʋ��") then
        Cast("�Ʋ��",true,true)
    end
    return false
end

function zhenshanhe()
    ---��ɽ��
    if cdEX("��ɽ��") then
        return false
    end
    local wudi  = findPartforHp(30)
    if wudi  then
        CastXYZ("��ɽ��",wudi.nX,wudi.nY,wudi.nZ,true)
    end
    if  life()<=30 and not statep("����") then
        Cast("��ɽ��",true,true)
    end
    if  life()<=20 then
        Cast("��ɽ��",true,true)
    end
    return false
end
function sixianglunhui()
    ---�����ֻ�
    if dis()>25 then
        return false
    end
    if buff("�꼯") then
        return true
    end
    if state("վ��") then
        return true
    end
    return false
end
function liangyihuaxing(weight)
    ---���ǻ���
    if dis()>20 then
        return false
    end
    if qidian()>4 and weight<=10 then
        return true
    end
    return false
end
function taijiwuji()
    ---̫���޼�
    if dis()>20 then
        return false
    end
    if not sixianglunhui() then
        return true
    end
    return false
end
function sancaihuasheng(weight)
    ---���Ż���
    if dis()>8 or cdEX("���Ż���")  then
        return false
    end
    if not tstate("ѣ��|����|����|����") and  not tstatep("���") then
        --print("��ǰĿ����")

        return true
    end
    if weight<=3 then
        return true
    end
    return false
end
function liuheduzun()
    ---���϶���
    if dis()>20 or cdEX("���϶���") or not state("վ��")  then
        return false
    end
    if tstate("ѣ��|����|����|����") and noSkillTime(1.4) then
        return true
    end
    if death(target) and tstate("ѣ��|����|����|����") then
        return true
    end
    return false
end
function qixinggongrui(weight)
    ---���ǹ���
    if  cdEX("���ǹ���") or not state("վ��") then
        return false
    end
    if not tstate("ѣ��|����|����") and not tstatep("���") and ObjCastTime(this_player,369,14) then
        return true
    end
    if dis()<=25 and tmount("�뾭�׵�|�����ľ�|�����|��֪") and  tbuff("����߳��") and not tstatep("���")  then
        return true
    end
    if not tmount("�뾭�׵�|�����ľ�|�����|��֪") and weight <= 10 then
        local diduinaima = FindPlayer(25, "�뾭�׵�|�����ľ�|�����|��֪", "�ж�")
        if diduinaima and not objState(diduinaima,"ѣ��|����|����") and not objStatep(diduinaima,"��Ĭ") and not objStatep(diduinaima,"����")  and not objStatep(diduinaima,"��е")  and not objStatep(diduinaima,"���") then
            CastTo("���ǹ���", diduinaima, true)
        end
    end
    if tmount("�뾭�׵�|�����ľ�|�����|��֪") and weight <= 10 then
        local nosee = findNoSeediren(25)
        if nosee and not objState(nosee,"ѣ��|����|����") and not objStatep(nosee,"���") then
            CastTo("���ǹ���", nosee, true)
        end
    end
    return false
end
function wanshibujie()
    ---��������
    if cdEX(18796) or (not HaveTalent("����") and not state("վ��")) then
        return false
    end
    if not buff("����") then
        return true
    end
    return false
end
function wanshibujieBoom(weight)
    ---��������
    if bufftime("����")<=3 then
        return true
    end
    if weight<=3 then
        return true
    end
    return false
end
function wufangxingjing(weight)
    ---�巽�о�
    if dis()> 20 or cdEX("�巽�о�") then
        return false
    end
    if  not tstate("ѣ��|����|����|����") and  not tstatep("���") then
        return true
    end
    if weight<=7 then
        return true
    end
    return false
end
function jiuzhuanguiyi(weight)
    ---��ת��һ
    if dis()> 8 or cdEX("��ת��һ") then
        return false
    end
    if ttarget ~= nil and IsParty(ttarget) and (ttlife() < 60 or ttlife()< 40)then
        return true
    end
    if life()<= 50 then
        return true
    end
    if needTui(target) then
        return true
    end
    if tmount("�뾭�׵�|�����ľ�|�����|��֪") and  weight<=3 and not  tstate("����|ѣ��|����") then
        return true
    end
    if not tmount("�뾭�׵�|�����ľ�|�����|��֪") and  weight<=3 then
        local diduinaima = FindPlayer(8, "�뾭�׵�|�����ľ�|�����|��֪", "�ж�")
        if diduinaima and not objState(diduinaima,"ѣ��|����|����") and not objStatep(diduinaima,"���") then
            CastTo("��ת��һ", diduinaima, true)
        end
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
    if cdEX2("��������") or buff("��������")  then
        return false
    end
    if qixinggongrui(weight) and seeObjForEnemy(this_player)>0 then
        return true
    end
    if liuheduzun() then
        return true
    end
    if weight<=7 then
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
function baguadongxuan(weight)
    ---���Զ���
    if not HaveTalent("���Զ���") or cdEX("���Զ���") then
        return false
    end
    --���������Ա
        for k, v in ipairs(GetAllPlayer()) do
            if IsPlayer(v.dwID) and IsEnemy(v) and not objState(v, "����") and GetDist(g_player, v) < 20 and IsVisible(g_player, v)   then
                if (objIsota(v) or (tlife() <= 100 and qidian()>4) or (weight <= 5 and qidian()>3)  ) and  (objmount(v, "�����|�뾭�׵�|��֪|�����ľ�") or not IsInArena() ) then
                    --�ȱ��浱ǰ����
                    CastTo("���Զ���", v, true)
                end
                if objIsotaDesc(v,"ƽɳ����|��ˮ��Ӱ") and objmount(v, "Ī��") then
                    --�ȱ��浱ǰ����
                    --print("��Ŀ����")
                    CastTo("���Զ���", v, true)
                end
            end
        end
    if tstate("����|ѣ��|����|����") and not tstatep("�����") then
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
    if ziqidonglai(weight) then
        skillEX3("��������")
    end
    if jiuzhuanguiyi(weight) then
        skillEX("��ת��һ")
    end
    if qixinggongrui(weight) then
        skillEX("���ǹ���")
    end
    if liuheduzun(weight) then
        skillEX("���϶���")
    end
    if wanshibujieBoom(weight) then
        skill(18983)
    end

    if wufangxingjing(weight) then
        skillEX("�巽�о�")
    end
    if sancaihuasheng(weight) then
        skillEX3("���Ż���")
    end
    if liangyihuaxing(weight) then
        skillEX("���ǻ���")
    end
    if taijiwuji() then
        skill("̫���޼�")
    end
    if sixianglunhui() then
        skill("�����ֻ�")
    end
    if not cdEX("������") and not buff("������") then
        Cast("������", true, false)
    end
    if cdEX("��ҡֱ��") == false then
        Cast("��ҡֱ��", true, false)
    end
end
function seurvival(weight)
    ---��������
    if zhenshanhe() then

    end
    if shengtaiji() then

    end
    if pocangqiong() then

    end
    if wanshibujie() then
        skill(18796)
    end
    if zuowangwuwo() then
        skill("��������")
    end
    if pinxuyufeng(weight) then
        skill("ƾ������")
    end
end



function tab(weight)
    if objState(target, "����") or tbuff("������ŭ") or tbuff("�Ϸ�����") or tbuff("��ɽ��") then
        findTargetforRange(30)
        --print("Ŀ������")

    end
    --if target == nil and save_target ~= nil then
    --    SetTarget(save_target)
    --end

    -----�ϴ��л�Ŀ�����5��ŻỻĿ��
    --if weight >= 50 and (GetTickCount() - lastSelectTime) > 5000 then
    --    print("Ŀ����˹���")
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
    if target then
        ttarget, ttclass = GetTarget(target)
    end
    local weight = getWeight(false)
    ---���Զ���
    if baguadongxuan(weight) then
        skillEX("���Զ���")
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

    if target and weight<=5 then
        RemoteCall("����", target.dwID)	--jihuo�൱��ָ��Ǳ���ģ�����Ĳ���û�л��ߴ����ٸ�����
    end
    if GetOption("�Զ��л�") then
        tab(weight)
    end
    seurvival(weight)


    if tbuff("����") or tbuff("��������") or tbuff("������ŭ")  then
        StopAction()
        return
    end
    --if ota("�Ʒ����") then
    --    MoveAction_StopAll()
    --    return
    --end
    --���浱ǰĿ��
    if ota("��������") or objState(target, "����") then
        return
    end



    --if his() > 6 and buff("����") then
    --    Jump()
    ----end
    --if GetHeight(player) > 6 and dis() <= 4 then
    --    Jump()
    --end
    if target and IsParty(target) then
        return
    end
    --TurnTo(target)
    DPS(weight)
end

--end

--����ص��������յ�RemoteCall���͵���Ϣ
--SenderID �����ߵ�ID
--SenderName �����ߵ�����
--tInfo ���ݱ������ǵ���RemoteCall���Ĳ���
function OnRemoteCall(SenderID, SenderName, tInfo)
    if SenderID ~= g_player.dwID then	--��������߲����Լ�
        if tInfo[1] == "����" then	--1��ӦRemoteCall�ĵ�һ������
            SetTarget(tInfo[2])	--2��ӦRemoteCall�ĵڶ�������
        end
    end
end

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