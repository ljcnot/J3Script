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
local isQiaqinlong = false
local isShiziqiang = false
function jiekong()
    if (GetSkillGCD("��������") + gcdsj) < dingshenTime() then
        return true
    end
    return false
end
function shiziqiang(weight)
        if dis()>6  or this_player.nCurrentSunEnergy<25 or cdEX3("��Ԩ��ɷ") or cdEX("�����Ұ") or  cdEX("���Ӻ���") then
            return false
        end
        if weight <=10 and tstate("����|ѣ��|����|����") then
            return true
        end

        if weight<=7 then
            return true
        end
        return false
    end
    function longxianghubu(weight)
        ---��������
        local distance = 6
        if buff("����") then
            distance=12
        end
        if dis()>distance or shiziqiang(weight) or xiangwangjiding(weight) then
            return false
        end
        return true
    end
    function tayanyangqi(weight)
        ---̤������
        if dis()>6 or cdEX3("̤������") or tstatep("���") or shiziqiang(weight) then
            return false
        end
        if tstate("����|ѣ��|����") and seeObjForPart(target)>0 and jiekong() then
            return true
        end
        if not tstate("����|ѣ��|����") then
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
    function qusan(obj)

        return GetBuffType(obj,"��Ԫ������")>0 or GetBuffType(obj,"��������")>0
                or GetBuffType(obj,"��������")>0 or GetBuffType(obj,"��������")>0
    end
    function leizoufengqie()
        ---���߷���
        if dis()>6 or cdEX3("���߷���") or tstatep("����") or tstatep("�����")  then
            return false
        end
        local tbuffList = GetBuff(target)
        if qusan(tbuffList) then
            return true
        end
        if not tmount("�뾭�׵�|�����ľ�|�����|��֪") then
            local diduinaima = FindPlayer(6, "�뾭�׵�|�����ľ�|�����|��֪", "�ж�")
            if diduinaima ~= nil and objIsota(diduinaima) then
                CastXYZ("���߷���",diduinaima.nX,diduinaima.nY,diduinaima.nZ,false)
            end
        end
        return false
    end
    function xichubeige(weight)
        ---��������
        if  cdEX("��������") then
            return false
        end
        local distance = 6
        if HaveTalent("���") then
            distance = 12
        end
        local feitian = FindPlayer(distance, "�躣��", "�ж�")
        if feitian ~= nil and GetCastTime(feitian,19828)>0 and GetCastTime(feitian,19828)<20 then
            return true
        end
        if life()<=60 and not statep("����") then
            return true
        end
        if weight<=5 then
            return true
        end
        return false
    end
    function xiangwangjiding(weight)
        ---��������
        if  this_player.nCurrentRage<5 then
            return false
        end
        if not statep("���") and seeObjForEnemy(this_player)>0  then
            return true
        end
        if dis()>6 or shangjiangjunying(weight) then
            return false
        end
        --if findRangeCount(6)>=2 then
        --    return true
        --end
        return true
    end

    function pofuchenzhou(weight)
        ---�Ƹ�����
        if dis()>8 or this_player.nCurrentRage<10 then
            return false
        end
        if HaveTalent("���") and tstate("����|ѣ��|����") and weight<=10 then
            return true
        end
        if weight<=7 then
            return true
        end
        if findRangeCountAndFace(8,90)>=2 then
            return true
        end
        return false
    end
    function shangjiangjunying(weight)
        ---�Ͻ���ӡ
        local xiaohao = 10
        if HaveTalent("�麨") then
            xiaohao = 5
        end
        if dis()>10 or cdEX("�Ͻ���ӡ") or this_player.nCurrentRage<xiaohao then
            return false
        end
        if life()<=70 and not statep("����") then
            return true
        end
        --if weight<=7 then
        --    return true
        --end
        --if findRangeCountAndFace(8,90)>=2 then
        --    return true
        --end
        return false
    end
    function shangjiangjunliu()
        ---�Ͻ���ӡ
        local xiaohao = 10
        if HaveTalent("�麨") then
            xiaohao = 5
        end
        if dis()>10 or not HaveTalent("�ֽ�") or  cdEX("�Ͻ���ӡ") or this_player.nCurrentRage<xiaohao then
            return false
        end
        if tstate("����|ѣ��|����|����") then
            return true
        end
        if life()<=70 and not statep("����") then
            return true
        end
        --if weight<=7 then
        --    return true
        --end
        if findRangeCountAndFace(8,90)>=2 then
            return true
        end
        return false
    end
    function gejuqinggong()
        ---����ع�
        if dis()>6 or cdEX3("����ع�") or tstatep("���") or this_player.nCurrentRage<10  then
            return false
        end
        --if tstate("����|ѣ��|����") and seeObjForPart(target)>0 and jiekong() then
        --    return true
        --end
        if not tstate("����|ѣ��|����") then
            return true
        end
        return false
    end
    function qinglongliuzhan()
        ---������ն
        if dis()>15 or cdEX("������ն") then
            return false
        end
        if dis()>6 and not tstatep("���") then
            isQiaqinlong = false
            return true
        end
        if this_player.nCurrentRage<50 then
            isQiaqinlong = false
            return true
        end
        if dis()> 6 and tstatep("���") then
            isQiaqinlong = true
            save_target = target
            --SetTarget(this_player)
            --local func = function(a)
            --    SetTarget(save_target)
            --end
            --DelayCall(500, func, 123)
            return true
        end

        --if dis>10 and seeObjForEnemy(this_player)>0 then
        --    isQiaqinlong
        --end
        return false
    end
    function naoxumi()
        ---������
        if dis()>15 or cdEX("������") or this_player.nCurrentEnergy<10 then
            return false
        end
        if not tbuff("������") then
            return true
        end
        return false
    end
    function suijiangtian()
        ---�齭��
        if dis()>8 or not buff("�齭��") or this_player.nCurrentEnergy<5 then
            return false
        end
        if not tstatep("����") then
            return true
        end
        if life()<=70 and not buff("��Ӱ") then
            return true
        end
        return false
    end
    function sanliuxia(weight)
        ---ɢ��ϼ
        if buff("ɢ��ϼ") or cdEX3("ɢ��ϼ") or ObjCastTime(this_player,16608,2) then
            return false
        end
        if boom() >= 3 and life() <= 90 and not statep("����") then
            return true
        end
        if boom() >= 2 and life() <= 70 and not statep("����") then
            return true
        end
        if state("ѣ��|����|��ֱ|����") and (life()<80 or weight<=8) then
            return true
        end
        if life()<=50  then
            return true
        end
        return false
    end
    function daoxiaofengyin()
        ---��Х����
        if dis()>22 or this_player.nCurrentSunEnergy<5 or shiziqiang(10) or seeObjForEnemy(this_player)>0  then
            return false
        end
        if dis()>20 and kongzhi() then
            return true
        end
        if dis()<=20 and not zuizhanbaishe() then
            return true
        end
        return false
    end
    function zuizhanbaishe()
        ---��ն����
        if dis()>22 or this_player.nCurrentSunEnergy<10 or shiziqiang(10) or seeObjForEnemy(this_player)>0   then
            return false
        end
        if tmount("�뾭�׵�|Ц����") then
            return true
        end
        if  this_player.nCurrentRage>50 then
            return true
        end
        if dis()>20 then
            return true
        end
        return false
    end
    function linyuantahe()
        ---��Ԩ����
        if cdEX("��Ԩ����") then
            return false
        end
        if life()<= 60 and not statep("����") then
            return true
        end
        return false
    end

    function xiumingchenshen(weight)
        ---��������
        if xuexujinping(weight) or songyanzhuwu(weight) then
            return false
        end
        if xiangwangjiding(weight) then
            return true
        end
        if  shangjiangjunliu() then
            return true
        end
        if dis()>6 then
            return false
        end

        if this_player.nCurrentRage >=50 then
            return true
        end
        if gejuqinggong() or xichubeige(weight) or shangjiangjunying(weight) then
            return true
        end
        return false
    end

    function songyanzhuwu(weight)
        ---��������
        if sanliuxia(weight)  then
            return true
        end
        if dis()>15 or xuexujinping(weight) then
            return false
        end
        if suijiangtian() or naoxumi() then
            return true
        end
        if this_player.nCurrentRage<10 then
            return true
        end
        if ObjCastTime(this_player,16870,5) and not statep("���") then
            return true
        end
        if dis()>6 and qinglongliuzhan() then
            return true
        end

        return false
    end
    function xuexujinping(weight)
        ---ѩ������
        if dis()>22  then
            return false
        end
        if shiziqiang(weight) then
            return true
        end
        if linyuantahe() then
            return true
        end
        if  not qinglongliuzhan() and not naoxumi() and not suijiangtian() and dis()>6 and not (seeObjForEnemy(this_player)>0) then
            return true
        end
        return false
    end
function fengyuanzhensha(weight)
    ---��Ԩ��ɷ
    if not HaveTalent("��Ԩ��ɷ") or cdEX3("��Ԩ��ɷ") then
        return false
    end
    if state("ѣ��|����|����") and (life()<80 or weight<=8) then
        return true
    end
    return false
end

    function daoqiao(weight)
        ---������̬
        if shiziqiang(weight) and GetSkillGCD("�����Ұ")==0 then
            isShiziqiang= true
            MoveAction_StopAll()
            skillEX2("���Ӻ���")
            skillEX2("�����Ұ")
            CastAngle("��Ԩ��ɷ",-50)
        end
        if daoxiaofengyin() then
            skill("��Х����")
        end
        if zuizhanbaishe() then
            skill("��ն����")
        end

    end
    function shuangdao(weight)
        ---˫����̬
        --if sanliuxia(weight) then
        --    skill("ɢ��ϼ")
        --end
        if suijiangtian() then
            skillEX("�齭��")
        end
        if naoxumi() then
            skill("������")
        end
        if qinglongliuzhan() then
            skill(16870)
        end
    end
    function dadao(weight)
        ---����̬

        if gejuqinggong() then
            skill("����ع�")
        end
        if pofuchenzhou(weight) then
            skillEX2("�Ƹ�����")
        end
        if shangjiangjunliu() then
            skillEX2("�Ͻ���ӡ")
            return
        end
        if xiangwangjiding(weight) then
            skillEX2("��������")
            return
        end
        if shangjiangjunying(weight) then
            skillEX2("�Ͻ���ӡ")
        end




    end
    function DPS(weight)
        if xiumingchenshen(weight) then
            skill("��������")
        end
        if songyanzhuwu(weight) then
            skill("��������")
        end
        if xuexujinping(weight) then
            skill("ѩ������")
        end
        if leizoufengqie() then
            skill("���߷���")
        end
        if tayanyangqi(weight) then
            skillEX("̤������")
        end

        if buff("��������") then
            dadao(weight)
        end
        if buff("��������") then
            shuangdao(weight)
        end
        if buff("ѩ������") then
            daoqiao(weight)
        end
        if longxianghubu(weight) then
            skill("��������")
        end
        if target and shuyunzhuyue() then
            CastTo("��������", target, false)
        end

        if cdEX("��ҡֱ��") == false and not shiziqiang(weight) then
            Cast("��ҡֱ��", true, true)
        end
    end
    function seurvival(weight)
        -----��������
        if xiumingchenshen(weight) then
            skill("��������")
        end
        if songyanzhuwu(weight) then
            skill("��������")
        end
        if xuexujinping(weight) then
            skill("ѩ������")
        end
        if linyuantahe() then
            skill("��Ԩ����")
        end
        if sanliuxia(weight) then
            skill("ɢ��ϼ")
        end
        if fengyuanzhensha(weight) then
            skill("��Ԩ��ɷ")
        end
        if xichubeige(weight) then
            skill("��������")
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
        if isShiziqiang then
            skillEX2("���Ӻ���")
            skillEX2("�����Ұ")
            --CastAngle("��Ԩ��ɷ",-60)
            return
        end
        this_player = player
        InteractNpc("��ʧ�Ļ���")
        InteractNpc("̾Ϣ�籮")
        if life()<=50 then
            Use("��ҩ")
        end
        target,tclass = setAll(player)
        local weight = getWeight(false)
        if tstatep("���") then
            skill(16871)
            skill(16872)
            skill(16873)
            skill(16874)
            skill(16875)
        end



        if target and weight<=5 then
            RemoteCall("����", target.dwID)	--jihuo�൱��ָ��Ǳ���ģ�����Ĳ���û�л��ߴ����ٸ�����
        end
        if GetOption("Ŀ���л�") then
            tab(weight)
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

    if tbuff("����") or tbuff("��������") or tbuff("������ŭ") or objState(target, "����") or buff("ɢ��ϼ")  then
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
    if  tIDnX == g_player.dwID and dwSkillID==16621 then  --������˿�ʼ����123���ܣ�Ŀ�����Լ�
        --print(string.find(duobi,dwSkillID))
        isShiziqiang = false
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