LoadLib("Macro\\��װ����.lua")
local target
local tclass
local this_player
local gcdsj = 0.1 --gcdʱ��
local lastSelectTime = 0
local save_target
local isRun = false
local isDanger = false

function jiekong()
    if (GetSkillGCD("������") + gcdsj) > dingshenTime() then
        return false
    end
    if (GetSkillGCD("������") + gcdsj) > yunxuanTime() then
        return false
    end
    return true
end
function chirilun()
    ---������
    if dis() > 4 or isManri() then
        return false
    end
    return true
end

function lierizhan()
    ---����ն
    if dis() > 4 or cdEX("����ն") or isManri() or getSun() >= 80 then
        return false
    end

    return true
end
function youyuelun()
    ---������
    if dis() > 4 or isManyue() then
        return false
    end
    return true
end

function yinyuezhan()
    ---����ն
    if dis() > 12 or cdEX("����ն") or isManyue() or ( getMoon() >= 80  and dis()<=4 )then
        return false
    end
    return true
end
function shengsijie()
    ---������
    if dis() > 6 or GetCastCount(this_player, 3966, 10) >= 2 or (isManyue() == false and isManri() == false) or HaveTalent("��������") then
        return false
    end
    if haveMiankong() then
        return false
    end
    if death(target) and tnostate("���") and tstate("����|ѣ��|����") == false and tstatep("���") == false then
        return true
    end
    if death(target) and tnostate("���") and tstate("ѣ��|����") and seeObj(target) > 0 and jiekong() and tstatep("���") == false then
        return true
    end

    return false
end
function shengsijieJianliao()
    ---�����ټ���
    if dis() > 6 or (isManyue() == false and isManri() == false) then
        return false
    end
    if not tstatep("����") or tbufftime("�½�")<2 then
        return true
    end
    return false
end
function jingshipomoji()
    ---������ħ��
    if dis() > 15 or (isManyue() == false and isManri() == false) then
        return false
    end
    if isManri() and (not shengsijie() or HaveTalent("�ƶ�����")==false) then
        return true
    end
    if isManyue() then
        return true
    end
    return false
end
function quyeduanchou()
    ---��ҹ�ϳ�
    if dis() > 6 or cdEX("��ҹ�ϳ�") or isManyue() or isManri() then
        return false
    end
    if buff("������ɢ") or buff("����") then
        return true
    end
    return false
end
function buweianxing(weight)
    ---��η����
    if tclass==NPC or dis() > 6  or  noSkillTime(0.2) or cdEX("��η����") or tstatep("���е") or tstatep("�����") then
        return false
    end
    --if weight<=8 and  kongzhiTimeEX(1) then
    --    if cdEX("��η����") and cdEX("�������")==false then
    --        skillEX2("������ɢ")
    --        skill("������Ӱ")
    --        skillEX2("�������")
    --        --print("����")
    --        return true
    --    end
    --    --print("��е1")
    --    return true
    --end
    if tbuff("�������") or tbuff("��������") then
        return true
    end

    if tlife() <= 50 then
        --if cdEX("��η����") and cdEX("�������") == false then
        --    skillEX2("������ɢ")
        --    skill("������Ӱ")
        --    skill("��ҹ�ϳ�")
        --    skillEX2("�������")
        --    --print("����")
        --    return true
        --end
        return true
    end
    if tlife() <= 100 and (not IsInArena() or objOnHorse(target) or tmount("�����|�뾭�׵�|��֪|�����ľ�|�躣��")) then
        return true
    end

    return false
end
function shengmieyuduo()
    ---�������
    if cdEX("�������") or noSkillTime(0.2) then
        return false
    end
    if tlife() <= 50 and cdEX("��η����") then
        return true
    end
    return false
end
function guangmingxiang(weight)
    ---������
    if cdEX("������") or buff("���ɳ��") or dis() > 15 or isyueda() then
        return false
    end

    if weight <= 7 and (isManri() or isManyue()) then
        return true
    end
    if weight<=10 and quyeduanchou() and not cdEX("��ҹ�ϳ�") then
        return true
    end
    return false
end
function fumingzhongsheng(weight)
    ---��������
    if not HaveTalent("��������") or buff("���ɳ��") or cdEX("��������") or getSun() < 60 or dis() > 6 then
        return false
    end
    if weight <= 10  then
        return true
    end
    --if weight <= 7 then
    --    return true
    --end
    return false
end
function mingyueduxin(weight)
    ---ڤ�¶���
    if not HaveTalent("ڤ�¶���") or buff("���ɳ��") or isguangmingxiang() or cdEX("ڤ�¶���") or getMoon() < 60 or dis() > 12 or buff("������") then
        return false
    end
    if weight <= 10 then
        return true
    end
    return false
end
function hanyueyao()
    ---����ҫ
    if not HaveTalent("����ҫ") or cdEX("����ҫ") or dis() > 20 or tstatep("�����") or tstatep("����") then
        return false
    end
    if tIsota() then
        return true
    end
    if not tmount("�뾭�׵�|�����ľ�|�����|��֪") then
        local diduinaima = FindPlayer(20, "�뾭�׵�|�����ľ�|�����|��֪", "�ж�")
        if diduinaima ~= nil and objIsota(diduinaima) then
            CastTo("����ҫ", diduinaima)
        end
    end
    return false
end
function liuguangqiuying(weight)
    ---������Ӱ
    if cdEX2("������Ӱ") or dis() > 20 or jileyin(weight) or tstate("���") or GetSkillGCD("������") > 0 or (GetCastTime(this_player, 18629) > 0 and GetCastTime(this_player, 18629) < 1) then
        --or (statep("���") and not buff("������ɢ"))
        return false
    end
    if dis() > 4 and (statep("����") or state("��ֱ")) then
        return true
    end
    if dis() > 4 and dis() <= 15 and jingshipomoji() then
        return false
    end
    if dis() > 4 and dis() <= 12 and yinyuezhan() then
        return false
    end
    if dis() > 4 and dis() <= 6 and shengsijieJianliao() then
        return false
    end
    if dis() > 4 and dis() <= 6 and quyeduanchou() then
        return false
    end
    if dis() > 6 and dis() <= 12 and isyueda() and buff("������ɢ") then
        return true
    end
    if dis() > 12 and his() <= 12 then
        return true
    end
    if dis() > 4 and his() <= 12  and not buff("�һ�")  then
        return true
    end
    if dis() > 8 and his() <= 12  and  buff("�һ�")  then
        return true
    end
    if seeObjEX(this_player)>=1 and not statep("���") then
        return true
    end

    return false
end
function huanguangbu(weight)
    ---�ùⲽ
    if cdEX("�ùⲽ") or dis() > 20 or tstate("���") or isyueda() or statep("���") then
        return false
    end

    if dis() > 4 and dis() <= 12 and isyueda() then
        return false
    end
    if HaveTalent("��Ӱ����") and  statep("��е") or statep("��Ĭ") or statep("����") then
        return true
    end
    if HaveTalent("��Ӱ����") and  state("ѣ��|����") then
        return true
    end
    if dis() > 4 and dis() <= 15 and jingshipomoji() then
        return false
    end
    --if dis()>4 and (isManri()==false and isManyue()==false and dis()<15) and cdEX2("������Ӱ") then
    --    return true
    --end
    if dis() > 4 and cdEX2("������Ӱ") and weight <= 5 then
        return true
    end

    return false
end
function jileyin(weight)
    ---������
    if not HaveTalent("������") or cdEX("������") or tstate("���") or dis() > 14 then
        return false
    end
    if not tstatep("���Ṧ") and weight<=4 then
        return true
    end
    if femgche(this_player, "����") and target and not femgche(target, "����") then
        return true
    end
    if femgche(this_player, "����") and findRangeCount(14)>=2 then
        return true
    end
    if his() > 4 and weight<=5 then
        return true
    end
    if dis() > 6 and weight<=4 and not yinyuezhan() and not quyeduanchou() and not jingshipomoji() then
        return true
    end
    return false
end
function tanmoti()
    ---̰ħ��
    if cdEX2("̰ħ��") or buff("������ɢ") or (GetCastTime(this_player, 18629) > 0 and GetCastTime(this_player, 18629) < 10) or buff("������ɢ") or buff("����") then
        return false
    end
    if boom() >= 3 and life() <= 90 and statep("����") == false then
        return true
    end
    if boom() >= 2 and life() <= 70 and statep("����") == false then
        return true
    end
    local naima = FindPlayer(30, "�뾭�׵�|�����ľ�|�����|��֪", "����")
    if life() < 60 and naima and statep("����") == false then
        return true
    end
    if life() < 30 then
        return true
    end
    return false
end
function anchenmisan(weight)
    ---������ɢ
    if cdEX("������ɢ") then
        return false
    end
    if life() < 40 then
        return true
    end
    if isyueda() or statep("���") then
        return false
    end
    if dis() > 4 and dis() <= 12 and isyueda() then
        return false
    end
    --if dis()<4 and weight<=3 and cdEX("ڤ�¶���") and getSun()<60 and getMoon()<60 then
    --    return true
    --end
    if (statep("��е") or statep("��Ĭ") or statep("����")) and cdEX("�ùⲽ") then
        return true
    end
    --if dis()>4 and (isManri()==false and isManyue()==false and dis()<15) and cdEX2("������Ӱ") then
    --    return true
    if state("ѣ��|����") and cdEX("�ùⲽ") then
        return true
    end
    if state("����") then
        return true
    end
    return false
end
function wuminghunsuo(weight)
    if cdEX("��������") then
        return false
    end
    if dis()<=8 and tmount("�뾭�׵�|�����ľ�|�����|��֪") and  tbuff("����߳��") and not tstatep("���")  then
        return true
    end
    if dis()<=8 and tmount("�뾭�׵�|�����ľ�|�����|��֪") and  femgche(target, "�ж�") and  not tstatep("���")  then
        return true
    end
    if dis()>4 and  his()>=4 and  dis()<=8 and not tstatep("���") and not yinyuezhan() and not quyeduanchou() and not jingshipomoji()  then
        CastTo("��������", target, true)
    end

    if not tmount("�뾭�׵�|�����ľ�|�����|��֪") and weight <= 10 then
        local diduinaima = FindPlayer(8, "�뾭�׵�|�����ľ�|�����|��֪", "�ж�")
        if diduinaima then
            CastTo("��������", diduinaima, true)
        end
    end
    if tmount("�뾭�׵�|�����ľ�|�����|��֪") and weight <= 10 then
        local nosee = findNoSeediren()
        if nosee then
            CastTo("��������", nosee, true)
        end
    end
end

function riling()
    ---������
    if lierizhan() then
        skill("����ն")
    end
    if chirilun() then
        skill("������")
    end
end

function yueling()
    ---������
    if yinyuezhan() then
        skill("����ն")
    end
    if youyuelun() then
        skill("������")
    end
end
function manri()
    ---�������
    --
    if  HaveTalent("�ƶ�����") and shengsijieJianliao() then
        skillEX("������")
    end
    if jingshipomoji() then
        skillEX("������ħ��")
    end
    if HaveTalent("�ƶ�����") and shengsijie() then
        skillEX("������")
    end
end
function manyue()

    if shengsijieJianliao() then
        skillEX("������")
    end
    if jingshipomoji() then
        skillEX("������ħ��")
    end
    ---�������
    if shengsijie() then
        skillEX("������")
    end
end
function yinshen()
    ---�������
end
function DPS(weight)
    --���Ѫ�������˾�ȡ��̰ħ��
    --if buff("̰ħ��") and life()> 60 and weight<=3 and (getMoon()>=60 or getSun()>=60) then
    --    CancelBuff(mbuff, "̰ħ��")
    --end

    if jileyin(weight) then
        skillEX2("������")
    end

    if target and  not femgche(target, "�ж�") and liuguangqiuying(weight) then
        skill("������Ӱ")
    end

    if buweianxing(weight) then
        skillEX("��η����")
    end

    if shengmieyuduo() then
        skillEX2("������ɢ")
        skill("������Ӱ")
        skill("��ҹ�ϳ�")
        skillEX2("�������")
    end
    if guangmingxiang(weight) then
        Cast("������", true, true)
    end
    if hanyueyao() then
        skill("����ҫ")
    end

    if fumingzhongsheng(weight) then
        skill("��������")
    end
    if mingyueduxin(weight) then
        skill("ڤ�¶���")
    end

    if isManyue() then
        manyue()
    else
        if isManri() then
            manri()
        end
    end
    if quyeduanchou() then
        skillEX("��ҹ�ϳ�")
    end
    if (cdEX("����ն") and getSun() < 80) or dis()>4 then
        yueling()
    else
        riling()
    end
    if cdEX("��ҡֱ��") == false then
        Cast("��ҡֱ��", true, true)
    end
end
function seurvival(weight)
    ---��������
    if tanmoti() then
        Cast(3973, true, true)
    end
    if anchenmisan(weight) then
        Cast("������ɢ", true, true)
    end
    if target and  not femgche(target, "�ж�") and  huanguangbu(weight) then
        skill("�ùⲽ")
    end


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
    if HaveTalent("����ҫ") and cdEX("����ҫ") == false then
        ---���̽÷ûCD ����Ŀ���ǵж�
        local target
        --���������Ա
        for k, v in ipairs(GetAllMember()) do
            if IsPlayer(v.dwID) and IsEnemy(v.dwID) and objState(v, "����") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and v ~= this_player and objNotWudi(v) then
                if objIsota(v) and (objmount(v, "�����|�뾭�׵�|��֪|�����ľ�") or not IsInArena() ) then
                    --�ȱ��浱ǰ����
                    CastTo("����ҫ", v, true)
                    --return 1
                end
            end
        end
    end
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
    if weight >= 50 and (GetTickCount() - lastSelectTime) > 5000 then
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
    if player.bFightState == false then
        Cast("������ɢ", true, true)
    end
    InteractNpc("��ʧ�Ļ���")
    target,tclass = setAll(player)
    local weight = getWeight(false)

    if weight>3 and femgche(player, "�ж�") then
        if target then
            if femgche(target, "�ж�") then
                BackTo(target)
            else
                skill("������Ӱ")
            end
        end
        MoveForwardStart()
        if state("ѣ��|����|����") then
            Cast("������ɢ", true, true)
        end
        Cast("��ҡֱ��", true, true)
        Jump()
        Cast("��������", true, true)

        --Cast(3973, true, true)
    end

    --print("weight:",weight)
    tab(weight)
    seurvival(weight)
    if wuminghunsuo(weight) then
        skillEX("��������")
    end
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
            toBack()
        else
            if isRun then
                MoveAction_StopAll()
                isRun=false
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