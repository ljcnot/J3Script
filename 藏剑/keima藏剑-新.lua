LoadLib("Macro\\��װ����.lua")
local target
local this_player
local gcdsj = 0.1 --gcdʱ��
local lastSelectTime = 0
local save_target
local isRun = false
local ttarget
local ttclass
function tinglei()
    ---����
    if dis() > 4 then
        return false
    end
    if buff("����") and this_player.nCurrentRage >= 10 then
        return false
    end
    return true
end
function jiekong()
    if (GetSkillGCD("����") + gcdsj) > dingshenTime() then
        return false
    end
    if (GetSkillGCD("����") + gcdsj) > yunxuanTime() then
        return false
    end
    return true
end

function hupao()
    ---��Ȫ����
    if statep("���") or cdEX("��Ȫ����") then
        return false
    end
    if rseeme(25) > 0 then
        return true
    end
    if dis() > 4 then
        return true
    end
    return false
end
function yuyue()
    ---��Ȫ��Ծ
    if dis() > 15 then
        return true
    end
    if statep("���") or buff("��Ȫ����") then
        return false
    end
    if cdEX("��Ȫ����") and (rseeme(25) > 0 or dis() > 8) then
        return true
    end
    return false
end
function yuhongguanri()

    ---������
    if dis() < 5 or dis() > 24 or cdEX("������") or tstate("���") then
        return false
    end
    if tota("�γ۳�") then
        return true
    end
    if dis()>15 then
        return true
    end
    return false
end

function pinghuduanyue()
    ---ƽ������
    if dis() > 8 or cdEX("ƽ������") or tstate("���") then
        return false
    end
    if dis() >= 4 then
        return true
    end
    --if totatype("right") or totatype("left") then
    --	return true
    --end
    return false
end
function huanglongtucui()
    ---�����´�
    if dis() > 6 or cdEX("�����´�") then
        return false
    end
    --if tstatep("���")==false then
    --	return true
    --end
    return true
end
function zuiyue()
    ---����
    if dis() > 6 or cdEX("����") or this_player.nCurrentRage < 10 or haveMiankong() or tstatep("���") or tstatep("����") or (mount("ɽ�ӽ���") and HaveTalent("����") and cdEX("����") == false) then
        return false
    end
    if tnostate("���") and tstate("ѣ��|����") and death(target) and seeObj(target)>0 and jiekong()  then
        return true
    end
    if tnostate("���") and not tstatep("���") and  not tstate("����|ѣ��|����") then
        return true
    end
    return false
end

function xiaori(weight)
    ---Х��
    if cdEX2("Х��") or lastSkill(14910,1) or lastSkill(18322,2) or lastSkill(18322,1) or lastSkill(1580,1) or lastSkill(1589,1)  then
        return false
    end
    if mount("��ˮ��") then
        if state("����|ѣ��|����|����") and (weight <= 8 or life() <= 70) then
            --print("state(����|ѣ��|����|����|��ֱ)")
            return true
        end
        if dis() <= 4  and weight<=4 and (GetSkillCN("ݺ����")>0 or this_player.nCurrentRage >50) then
            return true
        end
        if buff("��Ȫ����") or buff("��Ȫ��Ծ") then
            return false
        end
        if rseeme(25) > 0 and statep("���") == false and GetSkillSCD("��Ȫ����")>0.5 and GetSkillSCD("��Ȫ��Ծ")>0.5 then
            --print("rseeme(25)>0 ")
            return true
        end

        if this_player.nCurrentRage >= 90 and statep("���") == false and GetSkillSCD("��Ȫ����")>0.5 and dis() <= 4 then
            --print("this_player.nCurrentRage>=90")
            return true
        end

        return false
    else
        if rseeme(25) > 0 and buff("Х��") == false then
            return true
        end
        if dis() > 8 and GetSkillSCD("������ϼ")>0.5 and GetSkillSCD("�׹��ɽ")>0.5 and GetCastTime(this_player,14910)> 1 and GetCastTime(this_player,18322)> 1  then
            return true
        end
        ---ɽ�ӽ���
        if this_player.nCurrentRage < 15 and not yingmingliu(weight) then
            return true
        end
        return false
    end
end
function yunfeiyuhuang(weight)
    ---�Ʒ����
    if this_player.nCurrentRage < 20 or cdEX("�Ʒ����") then
        return false
    end
    if dis() <= 23 and buff("�ƾ�") then
        return true
    end
    if dis() > 8 then
        return false
    end
    if buff("ҹ��") and (weight < 10 or bufftime("ҹ��") < 2) then
        return true
    end
    if dis() <= 4 and  kongzhiTimeEX(1) then
        return true
    end
    if dis() <= 4 and  tstate("վ��") then
        return true
    end
    return false
end
function xizhaoleifeng()
    ---Ϧ���׷�
    if dis() > 8 or this_player.nCurrentRage < 15 then
        return false
    end
    if dis() <= 4 and buff("��Ȥ") and (GetSkillSCD("�Ʒ����")<2 or bufftime("��Ȥ")<5) then
        return true
    end
    if dis() <= 4 and buff("����") then
        return true
    end
    if dis() > 4 then
        return true
    end
    return false
end
function heguigushan()
    ---�׹��ɽ
    if dis() > 21 or cdEX("�׹��ɽ") or not cdEX("������ϼ") or this_player.nCurrentRage < 20 or tstate("���") then
        return false
    end
    if isPositive() and dis2() >= 6 and dis2() <= 20 then
        return true
    end
    --if life()<40 then
    --	return true
    --end
    return false
end
function fenglaiwushan(weight)
    ---������ɽ
    if  this_player.nCurrentRage < 50 or cdEX("������ɽ") then
        return false
    end
    if HaveTalent("����") and dis()<=6 and life() <= 80 and kongzhi() then
        return true
    end
    if dis() <=8 and ((death(target) and kongzhi() )or tota("ǧ������")) and life() <= 50 then
        return true
    end
    if  dis() <=4 and target ~= nil and target.nRunSpeed < 22 and not cdEX("����ƾ�")  and weight <= 5 then
        return true
    end
    if HaveTalent("����") == false and dis() <=4 and life() <= 50 and not tstatep("���") then
        return true
    end
    return false
end
function fengchayunjing(weight)
    ---����ƾ�
    if dis() > 6 or this_player.nCurrentRage < 10 or cdEX("����ƾ�") or tstatep("����") then
        return false
    end
    if ttarget ~= nil and IsParty(ttarget) and (ttlife() < 60 or ttlife()< 40)then
        return true
    end
    if needTui(target) then
        return true
    end
    ---������ɽ
    local npc,count = FindNpc(this_player, "57739", 10, "�Լ�")
    if count>0 and objIsZhengmian(npc) and GetDist(this_player,npc)<=6 and objIsZhengmian(target) then
        return true
    end
    local npc,count = FindNpc(this_player, "57739", 10, "����")
    if count>0 and objIsZhengmian(npc) and GetDist(this_player,npc)<=6 and objIsZhengmian(target) then
        return true
    end
    local npc,count = FindNpc(this_player, "57739", 10, "�ж�")
    if count>0 and GetFace(npc)>=0 and GetFace(npc)<=80 and GetDist(this_player,npc)<=6 then
        return true
    end
    if cdEX("�Ʒ����") or weight > 8 or tstate("ѣ��|����|����")  or lastSkill(1647,1) or lastSkill(1649,1) then
        return false
    end
    --if weight >= 6 and weight <= 8 and buff("����")  and (tstatep("���") or (tmount("ɽ�ӽ���") and (cdEX("����") or HaveTalent("����")) and cdEX("����")) or (tmount("��ˮ��") and cdEX("����")) ) then
    --    return true
    --end
    if weight <= 2 and (tstatep("���") or ((tmount("ɽ�ӽ���") and (cdEX("����") or HaveTalent("����")) and cdEX("����")) or (tmount("��ˮ��") and cdEX("����")))) then
        return true
    end
    return false
end
function yingmingliu(weight)
    ---ݺ����
    if buff("ݺ��") or dis() > 4 or cdEX2("ݺ����")  then
        return false
    end
    if this_player.nCurrentRage < 10 and weight<=8 and mount("ɽ�ӽ���") then
        return true
    end
    if weight <= 6 and mount("ɽ�ӽ���") then
        print("ݺ��", weight)
        return true
    end
    if life() < 10 then
        return true
    end
    return false
end
--[[֧���жϵļ��ϣ�
����ء���ء��ޱ������б����������ˡ������ˡ��޳�Ĭ���г�Ĭ
�޼��ˡ��м��ˡ������ܡ������ܡ��޼��ơ��м��ơ��޼��١��м���
�޷��ڡ��з��ڡ��޷��Ṧ���з��Ṧ���ɿ��ơ����ж����Ǳ���
������ڣ�������ڣ������ƣ������ƣ���������������
--]]
function quanningyue()
    ---Ȫ����
    if buff("��Ȫ����") then
        return true
    end
    -----Ȫ����
    if rseeme(25) == 0 then
        return false
    end
    --if life()<80 then
    --	return true
    --end
    return true
end
function yunxisong()
    ---��ϡ��
    if rseeme(25) < 1 or statep("������") or statep("����") or statep("��������") then
        return false
    end
    if life() <= 50 then
        return true
    end
    return false
end
function fengchuihe()
    ---�紵��
    if HaveTalent("�紵��") == false or cdEX("�紵��") or dis() > 6 or tmount("�����|�뾭�׵�|��֪|�����ľ�") then
        return false
    end
    if ttarget ~= nil and IsParty(ttarget) and ttlife() < 80 and ttstatep("����") then
        return true
    end
    if ttlife() <= 60 then
        return true
    end
    if life() < 70 then
        return true
    end
    return false
end
function jingtao()
    ---����
    if HaveTalent("����") == false or this_player.nCurrentRage < 10 or cdEX("����") or dis() > 8 or haveMiankong() or tstatep("���") or tstatep("����") then
        return false
    end
    if tnostate("���") and tstate("����|����") and death(target)  and seeObj(target)>0 and jiekong()then
        --print("����1111")
        return true
    end
    if tnostate("���") and tstatep("���") == false and tstate("����|����|ѣ��|����") == false then
        --print("����2222")
        return true
    end
    --print(tstate("����|����|ѣ��|����"))
    return false
end
function xieliubaoshi(weight)
    ---ϼ����ʯ
    if HaveTalent("ϼ����ʯ") == false or cdEX("ϼ����ʯ") or dis() > 5 or tstate("���") or tstatep("���е") then
        --print("ϼ����ʯ")
        return false
    end
    -- �ڹ��б�"ϴ�辭","�׽","��ϼ��","̫�齣��","������","�뾭�׵�","��Ѫս��","������","�����ľ�","���ľ�","��ˮ��","ɽ�ӽ���","����","�����","�����","���޹��","��Ӱʥ��","����������","������","��ɽ��","Ц����","Ī��","��֪","������"
    if ttarget ~= nil and IsParty(ttarget) and ttlife() < 60 then
        return true
    end
    if weight <= 10 and tmount("�����|�뾭�׵�|��֪|�����ľ�") and kongzhi() then
        return true
    end
    if tlife() <= 70 then
        return true
    end
    return false
end
function tanmei()
    ---̽÷
    if HaveTalent("̽÷") == false or dis() > 15 or (ttarget ~= nil and IsParty(ttarget) and ttdis() > 15) then
        return false
    end
    if target ~= nil and IsParty(target) then
        return true
    end
    if ttarget ~= nil and IsParty(ttarget) and ttlife() < 80 and ttstate("ѣ��|����") then
        return true
    end
    return false
end
function jiuximiyan()
    ---��Ϫ����
    if dis() > 4 then
        return false
    end
    return true
end
function songshewenxia(weight)
    ---������ϼ
    if HaveTalent("������ϼ") == false or dis() > 20 or cdEX("������ϼ") or tstate("���") then
        return false
    end
    -- �ڹ��б�"ϴ�辭","�׽","��ϼ��","̫�齣��","������","�뾭�׵�","��Ѫս��","������","�����ľ�","���ľ�","��ˮ��","ɽ�ӽ���","����","�����","�����","���޹��","��Ӱʥ��","����������","������","��ɽ��","Ц����","Ī��","��֪","������"
    --print("tmount")
    --if tmount("�����|���޹��|Ī��|��֪|�躣��")then
    --	--if buff("����") then
    --	--	return true
    --	--end
    --
    --else
    --
    --	if dis()>8 then
    --		return true
    --	end
    --
    --	if weight<8 then
    --		return true
    --	end
    --end

    if his() > 8 and tstatep("���") == false  then
        return true
    end
    --if buff("����") then
    --    return true
    --end
    if dis() > 8 then
        return true
    end
    if weight <= 5 then
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

function wenshui(weight)
    ---��ˮ��
    --kotabreak(5, 24, "������")
    --print("��ˮ")
    ---����
    if zuiyue() then
        CastTo("����", target, true)
        --return 1
    end

    ---��Ȫ����
    if hupao() then
        --print("����")
        skillEX("��Ȫ����")
    end
    ---��Ȫ��Ծ
    if yuyue() then
        Cast("��Ȫ��Ծ", true)
    end
    ---Х��
    if xiaori(weight) then
        Cast("Х��", true,true)
    end
    if tinglei() then
        skill("����")
    end
    ---������
    if yuhongguanri() then
        skill("������")
    end
    ---ƽ������
    if pinghuduanyue() then
        skill("ƽ������")
    end
    if huanglongtucui() then
        skill("�����´�")
    end
    -----��Ϫ����
    --if jiuximiyan() then
    --	skill("��Ϫ����")
    --end
    ---����


end
function shanjujianyi(weight)
    ---ɽ�ӽ���
    if xieliubaoshi(weight) then
        --print("ϼ����ʯ")
        skillEX2("ϼ����ʯ")
        return
    end
    if zuiyue() then
        CastTo("����", target, true)
    end
    if jingtao() then
        --print("����")
        CastTo("����", target, true)
        --return

        --return 1
    end


    if fengchayunjing(weight) then
        --print("����ƾ�")
        skillEX2("����ƾ�")
        --return
    end
    ---������ɽ
    if fenglaiwushan(weight) then
        --print("������ɽ")
        skillEX2("������ɽ")
        return 1
    end
    if yunfeiyuhuang(weight) then
        --print("�Ʒ����")
        CastTo("�Ʒ����", target, false)
        return 1
    end
    ---�׹��ɽ
    if heguigushan() then
        --print("�׹��ɽ")
        CastTo("�׹��ɽ", target, false)
        --return 1
    end
    ---������ϼ
    if songshewenxia(weight) then
        --print("������ϼ")
        skillEX("������ϼ")
        --return 1
    end

    ---Ϧ���׷�
    if xizhaoleifeng() then
        --print("Ϧ���׷�")
        skillEX("Ϧ���׷�")
    end
    ---Х��
    if xiaori(weight) then
        --print("Х��")
        Cast("Х��", true,false)
    end


    ---����
    if tinglei() then
        --print("����")
        skill("����")
    end
end

function DPS(weight)
    ---ݺ����
    if yingmingliu(weight) then
        Cast("ݺ����", true, true)
    end



    --print("�ж��ķ�")
    if mount("��ˮ��") then
        wenshui(weight)
    else
        --print("ɽ��")
        shanjujianyi(weight)
    end
    if shuyunzhuyue() then
        CastTo("��������", target, false)
    end

    if cdEX("��ҡֱ��") == false then
        Cast("��ҡֱ��", true, true)
    end
end


function tab(weight)
    if objState(target, "����")  then
        findTargetforRange(30)
        print("Ŀ������")

    end
    if  target and  IsParty(target) then
        if target ~=nil then
            SetTarget(save_target)
        end
    else
        if target ~=nil then
            save_target = target
        end
    end
    --if  target == nil and save_target~=nil then
    --    save_target = target
    --end
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
    if HaveTalent("̽÷") and cdEX("̽÷") == false then
        ---���̽÷ûCD ����Ŀ���ǵж�
        local target
        --���������Ա
        for k, v in ipairs(GetAllMember()) do
            if IsPlayer(v.dwID) and IsParty(v) and objState(v, "����")==false and GetDist(this_player, v) < 15 and IsVisible(this_player, v) and v~=this_player  and objNotWudi(v) then
                local tate = GetState(v)
                if (string.find("ѣ��|����", tate)~=nil and objLife(v) <= 80) or objLife(v) <= 60 then
                    --�ȱ��浱ǰ����
                    if ota("������ɽ") then
                        CastTo("̽÷", v, true)
                    else
                        CastTo("̽÷", v, false)
                    end
                    --return 1
                end
            end
        end
    end
    if HaveTalent("������ϼ") and cdEX("������ϼ") == false  then
        ---���̽÷ûCD ����Ŀ���ǵж�
        local target
        --���������Ա
        for k, v in ipairs(GetAllMember()) do
            if IsPlayer(v.dwID) and IsEnemy(v.dwID) and GetDist(this_player, v) < 20 and objState(v, "����")==false and GetHeight(v)>8 and IsVisible(this_player, v)  and objNotWudi(v) then
                local tate = GetState(v)
                if (string.find("���", tate) ==nil and not state("����")) or (state("����") and string.find("���", tate) ==nil and IsBack(v) ) then
                    --�ȱ��浱ǰ����
                    if ota("������ɽ") then
                        CastTo("������ϼ", v, true)
                    else
                        CastTo("������ϼ", v, false)
                    end
                    print("������ϼ")
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
    if weight>=50 and (GetTickCount() - lastSelectTime)>5000 then
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
function seurvival(weight)
    ---��������
   if xiaori(weight) then
    Cast("Х��", true,true)
    end
    ---Ȫ����
    if quanningyue() then
        Cast("Ȫ����", true, false)
    end
    ---��ϡ��
    if yunxisong() then
        Cast("������", true, true)
    end
    ---̽÷
    if tanmei() then
        skillEX("̽÷")
    end
    if fengchuihe() then
        skill("�紵��")
    end


end
--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    this_player = player
    InteractNpc("��ʧ�Ļ���")
    target = setAll(player)
    if target then
        ttarget, ttclass = GetTarget(target)
    end
    local weight = getWeight(true)
    if weight>3 and femgche(player, "�ж�") then
            if target then
                if femgche(target, "�ж�") then
                    BackTo(target)
                end
            end
        MoveForwardStart()
        if state("ѣ��|����|����") then
            Cast("Х��", true, true)
        end
        Cast("��ҡֱ��", true, true)
        Jump()
        Cast("��������", true, true)
        Cast("��Ȫ��Ծ", true,true)
        Cast("�׹��ɽ",true,true)

        --Cast(3973, true, true)
    end


    --print("weight:",weight)
    tab(weight)

    --wuminghunsuo(weight)
    seurvival(weight)
    if target and  femgche(target, "�ж�") then
        if isRun then
            MoveAction_StopAll()
            isRun=false
        end
        return
    else
        isRun= true
        TurnTo(target)
        MoveForwardStart()
        ---������ɽ
        local npc,count = FindNpc(this_player, "57739", 10, "�Լ�")
        if count>0 then
            toRao()
        else
            StrafeLeftStop()
            toBack()
        end
    end
    if tbuff("����") or tbuff("��������") then
        StopAction()
        return
    end
    if ota("�Ʒ����") then
        if dis()>8 then
            StopAction()
            return
        end
        MoveAction_StopAll()
        return
    end
    --���浱ǰĿ��




    if his() > 6 and buff("����") then
        Jump()
    end
    if GetHeight(player) > 6 and dis() <= 4 then
        Jump()
    end




        --if GetHeight(player)>0 then
        --	Jump()
        --end

    if ota("������ɽ") then
        --����糵�Ͳ�ִ�к����
        return
    end
    if target and IsParty(target) then
        return
    end
    if target==nil then
        return
    end
        DPS(weight)
    --else
    --    if save_target~=nil then
    --        SetTarget(save_target)
    --    end
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