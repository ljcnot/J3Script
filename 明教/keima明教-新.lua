LoadLib("Macro\\��װ����.txt")
local target
local this_player
local gcdsj = 0.1 --gcdʱ��
local lastSelectTime = 0
local save_target
local isRun = false

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
    if dis() > 4 or cdEX("����ն") or isManyue() or getMoon() >= 80 then
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
    if tnostate("���") and tstate("����|ѣ��|����") == false and tstatep("���") == false then
        return true
    end
    if tnostate("���") and tstate("ѣ��|����") and seeObj(target) > 0 and jiekong() and tstatep("���") == false then
        return true
    end

    return false
end
function shengsijieJianliao()
    ---�����ټ���
    if dis() > 6 or (isManyue() == false and isManri() == false) then
        return false
    end
    if not tstatep("����") then
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
    if dis() > 6 or noSkillTime(0.2) or (HaveTalent("�������") == false and cdEX("��η����")) or (HaveTalent("�������") and cdEX("��η����") and cdEX("�������")) or tstatep("���е") or tstatep("�����") then
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

    if tlife() <= 40 then
        if cdEX("��η����") and cdEX("�������") == false then
            skillEX2("������ɢ")
            skill("������Ӱ")
            skill("��ҹ�ϳ�")
            skillEX2("�������")
            --print("����")
            return true
        end
        return true
    end
    if weight <= 10 and (tmount("�����|�뾭�׵�|��֪|�����ľ�") or not IsInArena()) then
        return true
    end
    return false
end
--function shengmieyuduo()
--    ---�������
--    if cdEX("�������") then
--        return false
--    end
--    if
--end
function guangmingxiang(weight)
    ---������
    if cdEX("������") or cdEX("ڤ�¶���") or buff("���ɳ��") or dis() > 4 or isyueda() then
        return false
    end
    if weight <= 8 and (isManri() or isManyue()) then
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
function liuguangqiuying()
    ---������Ӱ
    if cdEX2("������Ӱ") or dis() > 20 or tstate("���") or GetSkillGCD("������") > 0 or (GetCastTime(this_player, 18629) > 0 and GetCastTime(this_player, 18629) < 1) then
        --or (statep("���") and not buff("������ɢ"))
        return false
    end
    if dis() > 6 and dis() <= 12 and isyueda() and buff("������ɢ") then
        return true
    end
    if dis() > 4 and dis() <= 15 and jingshipomoji() then
        return false
    end
    if dis() > 4 and his() < 4 then
        return true
    end
    if dis() > 4 and (statep("����") or state("��ֱ")) then
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
    if statep("��е") or statep("��Ĭ") or statep("����") then
        return true
    end
    if state("ѣ��|����") then
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
    if life() < 60 and statep("����") == false then
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
    if dis()>4 and dis()<=8 and not tstatep("���") and not yinyuezhan() and not quyeduanchou() and not jingshipomoji()  then
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
function findNoSeediren()
    ---Ѱ��û�˿���Ŀ��
    local seeObjList = {}
    --���������Ա
    for k, v in ipairs(GetAllMember()) do
        if IsPlayer(v.dwID) and IsParty(v) and objState(v, "����") == false then
            local z_target, z_tclass = GetTarget(v)
            if z_target then
                seeObjList[k] = z_target
            end
        end
    end
    for k, v in ipairs(GetAllMember()) do
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "����") == false and GetDist(this_player, v) < 8 and IsVisible(this_player, v) then
            local nosee = true
            for see_k, see_v in ipairs(seeObjList) do
                if v.dwID == see_v.dwID then
                    nosee = false
                end
            end
            if nosee then
                return v
            end
        end
    end
end
--function seeObj(obj)
--    local count = 0
--    --���������Ա
--    for k, v in ipairs(GetAllMember()) do
--        if IsPlayer(v.dwID) and IsParty(v) and objState(v, "����") == false then
--            local z_target, z_tclass = GetTarget(v)
--            if z_target and obj.dwID == z_target.dwID then
--                count = count + 1
--            end
--        end
--    end
--    return count
--end

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

    if  HaveTalent("�ƶ�����") and shengsijieJianliao() then
        skillEX("������")
    end
    if jingshipomoji() then
        skillEX("������ħ��")
    end
    --if HaveTalent("�ƶ�����") and shengsijie() then
    --    skillEX("������")
    --end
end
function manyue()

    if shengsijieJianliao() then
        skillEX("������")
    end
    if jingshipomoji() then
        skillEX("������ħ��")
    end
    ---�������
    --if shengsijie() then
    --    skillEX("������")
    --end
end
function yinshen()
    ---�������
end
function DPS(weight)
    --���Ѫ�������˾�ȡ��̰ħ��
    --if buff("̰ħ��") and life()> 60 and weight<=3 and (getMoon()>=60 or getSun()>=60) then
    --    CancelBuff(mbuff, "̰ħ��")
    --end
    if liuguangqiuying() then
        skill("������Ӱ")
    end
    if buweianxing(weight) then
        skill("��η����")
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
    if cdEX("����ն") and getSun() < 80 then
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
    if huanguangbu(weight) then
        skill("�ùⲽ")
    end


end
function toBack()
    ---�Զ��Ʊ�
    if target and GetDist(target) <= 3 then
        if IsBack(target) then
            MoveForwardStop()
        else
            MoveForwardStart()
        end
    end
end

function findTarget(outTarger)
    ---�Ƿ��ų���ǰĿ��
    ---Ѱ���ʺϵ�Ŀ��
    local players = GetAllPlayer()
    local lastTar = nil
    local lastWeight = 100
    for k, v in ipairs(players) do
        --v����Ҷ���
        local weight = 10
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "����") == false and IsDangerArea(v, "�ж�") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objNotWudi(v) then
            --���������
            if outTarger == false or v ~= target then
                ---�����Ҫ�ų���ǰĿ��
                if objLife(v) == 0 or objState(v, "����") then
                    weight = weight + 100
                end
                if objLife(v) > 80 and objLife(v) <= 90 then
                    weight = weight - 1
                end
                if objLife(v) > 70 and objLife(v) <= 80 then
                    weight = weight - 2
                end
                if objLife(v) > 60 and objLife(v) <= 70 then
                    weight = weight - 3
                end
                if objLife(v) > 50 and objLife(v) <= 60 then
                    weight = weight - 4
                end
                if objLife(v) > 40 and objLife(v) <= 50 then
                    weight = weight - 5
                end
                if objLife(v) > 30 and objLife(v) <= 40 then
                    weight = weight - 6
                end
                if objLife(v) > 20 and objLife(v) <= 30 then
                    weight = weight - 7
                end
                if objLife(v) > 10 and objLife(v) <= 20 then
                    weight = weight - 8
                end
                if objLife(v) > 0 and objLife(v) <= 10 then
                    weight = weight - 9
                end
                if objState(v, "ѣ��|����|��ֱ|����") then
                    weight = weight - 3
                end
                if lastWeight > weight then
                    lastWeight = weight
                    lastTar = v
                end
            end
        end
    end
    ---���������Ŀ�겻����nil
    if lastTar ~= nil then
        SetTarget(lastTar)
    end
end
function findTargetforHp(hp)
    ---��ȡָ��Ѫ���ĵж�Ŀ��

    ---Ѱ���ʺϵ�Ŀ��
    local players = GetAllPlayer()
    local lastTar = nil
    local lastWeight = 100
    for k, v in ipairs(players) do
        --v����Ҷ���
        local weight = 10
        if IsPlayer(v.dwID) and IsEnemy(v) and objmount(v, "�躣��") == false and objState(v, "����") == false and IsDangerArea(v, "�ж�") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objLife(v) < hp and objNotWudi(v) then
            --���������
            if objLife(v) == 0 or objState(v, "����") then
                weight = weight + 100
            end
            if objLife(v) > 80 and objLife(v) <= 90 then
                weight = weight - 1
            end
            if objLife(v) > 70 and objLife(v) <= 80 then
                weight = weight - 2
            end
            if objLife(v) > 60 and objLife(v) <= 70 then
                weight = weight - 3
            end
            if objLife(v) > 50 and objLife(v) <= 60 then
                weight = weight - 4
            end
            if objLife(v) > 40 and objLife(v) <= 50 then
                weight = weight - 5
            end
            if objLife(v) > 30 and objLife(v) <= 40 then
                weight = weight - 6
            end
            if objLife(v) > 20 and objLife(v) <= 30 then
                weight = weight - 7
            end
            if objLife(v) > 10 and objLife(v) <= 20 then
                weight = weight - 8
            end
            if objLife(v) > 0 and objLife(v) <= 10 then
                weight = weight - 9
            end
            if objState(v, "ѣ��|����|��ֱ|����") then
                weight = weight - 3
            end
            if lastWeight > weight then
                lastWeight = weight
                lastTar = v
            end
        end
    end
    ---���������Ŀ�겻����nil
    if lastTar ~= nil then
        print("ѡ��40%Ѫ��Ŀ��")
        SetTarget(lastTar)
    end
end

function findTargetforRange(range)
    ---��ȡָ����Χ�ڵĵж�Ŀ��
    ---range  ��Χ
    if range == nil then
        return nil
    end
    ---Ѱ���ʺϵ�Ŀ��
    local players = GetAllPlayer()
    local lastTar = nil
    local lastWeight = 100
    for k, v in ipairs(players) do
        --v����Ҷ���
        local weight = 10
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "����") == false and IsDangerArea(v, "�ж�") == false and GetDist(this_player, v) < range and IsVisible(this_player, v) and objNotWudi(v) then
            --���������
            if objLife(v) == 0 or objState(v, "����") then
                weight = weight + 100
            end
            if objLife(v) > 80 and objLife(v) <= 90 then
                weight = weight - 1
            end
            if objLife(v) > 70 and objLife(v) <= 80 then
                weight = weight - 2
            end
            if objLife(v) > 60 and objLife(v) <= 70 then
                weight = weight - 3
            end
            if objLife(v) > 50 and objLife(v) <= 60 then
                weight = weight - 4
            end
            if objLife(v) > 40 and objLife(v) <= 50 then
                weight = weight - 5
            end
            if objLife(v) > 30 and objLife(v) <= 40 then
                weight = weight - 6
            end
            if objLife(v) > 20 and objLife(v) <= 30 then
                weight = weight - 7
            end
            if objLife(v) > 10 and objLife(v) <= 20 then
                weight = weight - 8
            end
            if objLife(v) > 0 and objLife(v) <= 10 then
                weight = weight - 9
            end
            if objState(v, "ѣ��|����|��ֱ|����") then
                weight = weight - 3
            end
            if lastWeight > weight then
                lastWeight = weight
                lastTar = v
            end
        end
    end
    ---���������Ŀ�겻����nil
    if lastTar ~= nil then
        SetTarget(lastTar)
    end
end

function tab(weight)
    if objState(target, "����") then
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
                local tate = GetState(v)
                if string.find("���", tate) == nil and objIsota(v) and objmount(v, "�����|�뾭�׵�|��֪|�����ľ�") then
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
    target = setAll(player)
    if IsDangerArea(player, "�ж�") then
        if target then
            BackTo(target)
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

    local weight = getWeight(false)
    --print("weight:",weight)
    tab(weight)

    wuminghunsuo(weight)
    seurvival(weight)
    if target and  IsDangerArea(target, "�ж�") then
        if isRun then
            MoveAction_StopAll()
            isRun=false
        end
        return
    else
        isRun= true
        TurnTo(target)
        MoveForwardStart()
        toBack()
    end
    if tbuff("����") or tbuff("��������") then
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