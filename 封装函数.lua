AddOption("�Զ��Ʊ�")
AddOption("�Զ�����")
AddOption("�Զ�����")
local save_target
local target
local tclass
local this_player
local mbuff
local tbuffList
local ttarget
local ttclass
local ttbuffList
local gcdsj = 0.1 --gcdʱ��
local help = false
local lastSelectTime = 0
local isprint = true
local isGensui= GetOption("�Զ�����")
local isRaobei= GetOption("�Զ��Ʊ�")
local isMianxiang= GetOption("�Զ�����")
--szScriptDesc = "���ߣ�keima\n˵�����ű�˵��\n��Ѩ��[�����â][��������][��ԭ�һ�][�Ʒ�����][��Ѫ��â][��������][�ƶ�����][��Ȼ����][�������][��Ӱ����][��������][ڤ�¶���]"
function ota(desc)
    local mota, motatime, motaratio = GetPrepare()
    return string.find(desc, mota)~=nil
end
function tota(desc)
    local mota, motatime, motaratio = GetPrepare(target)
    return string.find(desc, mota)~=nil
end
function tIsota()
    local mota, motatime, motaratio = GetPrepare(target)
    return motatime>0
end
function objIsota(obj)
    local mota, motatime, motaratio = GetPrepare(obj)
    return motatime>0
end
function objLife(obj)
    if obj == nil then
        return 999
    end
    local bfb = (obj.nCurrentLife / obj.nMaxLife) * 100
    return bfb
end
function lastSkill(skill,time)
    local time123 = GetCastTime(this_player, skill)
    --5���ڷŹ�ָ�����ܣ�ע��Ҫ�жϴ��ڵ���0
    return time123 >= 0 and time123 < time
end
function life()
    if this_player == nil then
        return 999
    end
    local bfb = (this_player.nCurrentLife / this_player.nMaxLife) * 100
    return bfb
end
function tlife()
    if target == nil then
        return 999
    end
    local bfb = (target.nCurrentLife / target.nMaxLife) * 100
    return bfb
end
function ttlife()
    if ttarget == nil then
        return 999
    end
    local bfb = (ttarget.nCurrentLife / ttarget.nMaxLife) * 100
    return bfb
end
function face()
    if target == nil then
        return 999
    end
    return GetFace(target)
end
function isPositive()
    return face() >= 0 and face() <= 15
end
function buff(list)
    mbuff = GetBuff(this_player)
    return GetBuffTime(mbuff, list) > 0
end
function tbuff(list)
    if target==nil then
        return false
    end
    tbuffList = GetBuff(target)
    return GetBuffTime(tbuffList, list) > 0
end
function bufftime(id)
    mbuff = GetBuff(this_player)
    return GetBuffTime(mbuff, id)
end
function skill(skillid)
    --print(skillid)
    Cast(skillid, false, false)
end
function skillEX(skillid)
    ---��ϵ�ǰ����
    CastTo(skillid, target, true)
end
function skillEX2(skillid)
    ---��ϵ�ǰ����
    Cast(skillid, true, true)
end
function dis()
    if not target then
        return 999
    end
    return GetPreciseDecimal(GetDist(target),2)
end
function his()
    if target == nil or tclass == NPC then
        return 0
    end
    return GetHeight(target)
end
function haveMiankong()
    if target == nil then
        return false
    end
    local talent = GetTalentInfo(target)
    if talent["����"]~=nil and tbuff("Ů洲���") then
        return true
    end
    return false
end
function dis2()
    return GetPreciseDecimal(GetDist2D(target),2)
end
function isyueda()
    return (GetCastTime(this_player,18629)>0 and GetCastTime(this_player,18629)<10)
end
function isguangmingxiang()
    return (GetCastTime(this_player,3969)>0 and GetCastTime(this_player,3969)<1)

end
--function qusan(obj)
--
--    return GetBuffType(obj,"��Ԫ������")>0 or GetBuffType(obj,"��������")>0
--            or GetBuffType(obj,"��Ԫ�Բ���Ч��")>0 or GetBuffType(obj,"���Բ���Ч��")>0 or
--            GetBuffType(obj,"��Ѩ����Ч��")>0
--end
function GetPreciseDecimal(nNum, n)
    if type(nNum) ~= "number" then
        return nNum;
    end
    n = n or 0;
    n = math.floor(n)
    if n < 0 then
        n = 0;
    end
    local nDecimal = 10 ^ n
    local nTemp = math.floor(nNum * nDecimal);
    local nRet = nTemp / nDecimal;
    return nRet;
end
function ttdis()
    return GetDist(this_player, ttarget)
end

function rseeme(seeme)
    local seemecount, seemet = GetSeeMe(20)
    return seemecount
end

function state(desc)
    local tate = GetState(this_player)
    return string.find(desc, tate)~=nil
end
function tstate(desc)
    if target == nil then
        return false
    end
    local tstate = GetState(target)
    return string.find(desc, tstate)~=nil
end
function mount(desc)
    local school = GetMount(this_player)
    --print(school)
    return string.find(desc, school)~=nil
end
function objmount(obj,desc)
    if obj == NPC or obj==nil then
        return false
    end
    local school = GetMount(obj)
    --print(school)
    return string.find(desc, school)~=nil
end
function tmount(desc)
    if tclass == NPC or target==nil then
        return false
    end

    local school = GetMount(target)
    --print(school)
    if school == nil then
        return false
    end
    return string.find(desc, school)~=nil
end

function statep(desc)
    --print(desc)
    return GetTypeTime(mbuff, desc) > 0
end

function ttstatep(desc)
    if ttarget == nil then
        return false
    end
    return GetTypeTime(ttbuffList, desc) > 0
end

function tstatep(desc)
    if target == nil then
        return false
    end
    tbuffList = GetBuff(target)
    return GetTypeTime(tbuffList, desc) > 0
end
function tstate(desc)
    if target == nil then
        return false
    end
    local tstate = GetState(target)
    return string.find(desc, tstate) ~= nil
end
function objState(obj, desc)
    if obj == nil then
        return false
    end
    local tstate = GetState(obj)
    return string.find(desc, tstate) ~= nil
end
function ttstate (desc)
    if ttarget == nil then
        return false
    end
    local tstate = GetState(ttarget)
    return string.find(desc, tstate) ~= nil
end
function tnostate(desc)
    if target == nil then
        return false
    end
    local tstate = GetState(target)
    return string.find(desc, tstate) == nil
end
function CastTime(skillid, time)
    if target == nil then
        return false
    end
    return GetCastTime(target, skillid) > 0 and GetCastTime(target, skillid) <= time
end
function objNotWudi(obj)
    local wudi = { 203, 9695, 10212, 9934, 377 }
    for k, v in ipairs(wudi) do
        if obj.IsHaveBuff(v, 0) then
            return false
        end

    end
    return true
end
function zhanyi()
    return this_player.nCurrentRage
end
function isManri()
    ---�ж��Ƿ�����
    return this_player.nSunPowerValue>0
end
function isManyue()
    ---�ж��Ƿ�����
    return this_player.nMoonPowerValue>0
end
function getSun()
    ---��ȡ����
    return (this_player.nCurrentSunEnergy/100)
end
function getMoon()
    ---��ȡ����
    return (this_player.nCurrentMoonEnergy/100)
end
---Ȩ�ؼ���
function getWeight(isOut)
    ---isOut  ������⹦���ж��Ƿ���������
    local weight = 10
    --OutputinGame("---------------------------------")
    --if GetBuffTime(tbuffList, wudi) > 0 then
    --    weight = weight + 100
    --end
    if tstatep("�޵�") then
        --���Ŀ��ɿ���
        weight = weight + 100
    end
    if tstatep("����") then
        --���Ŀ��ɿ���
        weight = weight + 100
    end
    if tstatep("����90") then
        weight = weight+9
    end
    if tstatep("����80") then
        weight = weight+8
    end
    if tstatep("����70") then
        weight = weight+7
    end
    if tstatep("����60") then
        weight = weight+6
    end
    if tstatep("����50") then
        weight = weight+5
    end
    if tstatep("����40") then
        weight = weight+4
    end
    if isOut then
        if tstatep("����30") then
            weight = weight+3
        end
        if tstatep("����100") then
            weight = weight+100
        end
        if tstatep("����70") then
            weight = weight+7
        end
        if tstatep("����60") then
            weight = weight+6
        end
        if tstatep("����50") then
            weight = weight+5
        end
        if tstatep("����40") then
            weight = weight+4
        end
        if tstatep("����30") then
            weight = weight+3
        end
        if tstatep("����20") then
            weight = weight+3
        end

    end
    --if tstatep("��Ĭ") then
    --    --���Ŀ��ɿ���
    --    weight = weight - 2
    --end
    --if tstatep("��е") then
    --    --���Ŀ��ɿ���
    --    weight = weight - 2
    --end
    --if tstatep("����") then
    --    --���Ŀ��ɿ���
    --    weight = weight - 2
    --end
    --if tstatep("����") then
    --    --���Ŀ��ɿ���
    --    weight = weight - 2
    --end
    ----if tstatep("����") then
    ----    --���Ŀ��ɿ���
    ----    weight = weight - 1
    ----end
    ----if tstatep("ѣ��") then
    ----    --���Ŀ��ɿ���
    ----    weight = weight - 1
    ----end
    --if tstatep("����") then
    --    --���Ŀ��ɿ���
    --    weight = weight - 1
    --end
    --if GetBuffTime(tbuffList,chenmo) then
    --	weight = weight -3
    --	--OutputinGame("shanbi10")
    --end
    if tlife() < 10 then
        weight = weight - 10
    end
    if tlife() >= 10 and tlife() < 20 then
        weight = weight - 9
    end
    -- Output("5")
    if tlife() >= 20 and tlife() < 30 then
        weight = weight - 8
    end
    -- Output("6")
    if tlife() >= 30 and tlife() < 40 then
        weight = weight - 7
    end
    -- Output("7")
    if tlife() >= 40 and tlife() < 50 then
        weight = weight - 6
    end
    -- Output("8")
    if tlife() >= 50 and tlife() < 60 then
        weight = weight - 5
    end
    if tlife() >= 60 and tlife() < 70 then
        weight = weight - 4
    end
    if tlife() >= 70 and tlife() < 80 then
        weight = weight - 3
    end
    if tlife() >= 80 and tlife() < 90 then
        weight = weight - 2
    end
    if tlife() >= 90 and tlife() < 100 then
        weight = weight - 1
    end

    return weight
end





--function duobi()
--	local jineng= {"������" , "������" , "����" , "ǧ��׹" , "��" , "���ǹ���" , "��Ծ��Ԩ" , "��ս��Ұ" , "����ͷ" , "����" , "ͻ" , "��������" , "��Ԩ��ɷ" , "������ʽ" , "����ع�" , "�ϻ��" , "����" , "����"}
--	for key, value in ipairs(jineng)
--	do
--		if rlast(value, "�ж�", 1) then
--			return true
--		end
--		if isme() and tlast(value, 1) then			--���Ŀ���Ŀ������
--			return true
--		end
--	end
--	return false
--end
function boom()
    local count = 0
    if bufftime("����ع��")>10 then
        count = count+1
    end
    if bufftime("��������")>10 then
        count = count+1
    end
    if bufftime("����ָ")>10 then
        count = count+1
    end
    return count
end
function bufftime(id)
    mbuff = GetBuff(this_player)
    return GetBuffTime(mbuff, id)
end
---��еʱ��
function jiaoxieTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "��е")
    if time then
        return time
    end
    return 0
end
---ѣ��ʱ��
function yunxuanTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "ѣ��")
    if time then
        return time
    end
    return 0
end
---����ʱ��
function dingshenTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "����")
    if time then
        return time
    end
    return 0
end
---����ʱ��
function suozuTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "����")
    if time then
        return time
    end
    return 0
end
---����ʱ��
function jidaoTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "����")
    if time then
        return time
    end
    return 0
end
---����ʱ��
function jianliaoTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "����")
    if time then
        return time
    end
    return 0
end
---����ʱ��
function fengneiTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "����")
    if time then
        return time
    end
    return 0
end
---��Ĭʱ��
function chenmoTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "��Ĭ")
    if time then
        return time
    end
    return 0
end
function onHorse()
    return this_player.bOnHorse
end
function cdEX(skill)
    ---ͨ���Ѿ��ͷŵļ���ʱ�����жϼ����Ƿ�cd
    --if skill()
    --print(skill)
    return GetSkillSCD(skill) > 0
end
function cdEX2(skill)
    ---���ܼ����ж�
    return GetSkillCN(skill) == 0
end

function kongzhiTimeEX(time)
    --print(time)
    return dingshenTime() >= time or yunxuanTime() >= time or jidaoTime() >= time
end
function kongzhi()
    --print(time)
    return dingshenTime() > 0 or yunxuanTime() >0 or jidaoTime() >0
end
function jiekongTimeEX(time)
    return (dingshenTime() > 0 and dingshenTime() < time) or (yunxuanTime() > 0 and yunxuanTime() < time) or (jidaoTime() > 0 and jidaoTime() < time)
end
function jiekongTimeEX2(time)
    ---�ӿ�ʱ�䲻������
    return (dingshenTime() > 0 and dingshenTime() < time) or (yunxuanTime() > 0 and yunxuanTime() < time)
end
function jiekongTimeEX3(time)
    ---�ӿ�ʱ��ֻ�ж���
    return (dingshenTime() > 0 and dingshenTime() < time)
end
---���ܶ����ܵ�ʱ��
function noSkillTime(time)
    return  fengneiTime() > time or  chenmoTime() > time or  jiaoxieTime() > time
end

function seeObj(obj)
    local count = 0
    if obj ==nil then
        return 0
    end
    --���������Ա
    for k, v in ipairs(GetAllMember()) do
        if IsPlayer(v.dwID) and IsParty(v) and objState(v, "����")==false  then
            local z_target, z_tclass = GetTarget(v)
            if z_target and obj.dwID == z_target.dwID then
                count = count+1
            end
        end
    end
    return count
end
function findNoSeediren()
    ---Ѱ��û�˿���Ŀ��
    local seeObjList = {}
    --���������Ա
    for k, v in ipairs(GetAllMember()) do
        if IsPlayer(v.dwID) and IsParty(v) and objState(v, "����")==false  then
            local z_target, z_tclass = GetTarget(v)
            seeObjList[k] = z_target
        end
    end
    for k, v in ipairs(GetAllMember()) do
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "����")==false and  GetDist(this_player, v) < 8 and IsVisible(this_player, v)  then
            local nosee = true
            for see_k, see_v in ipairs(seeObjList) do
                if v ==see_v then
                    nosee = false
                end
            end
            if nosee then
                return v
            end
        end
    end
end
function nojiekong(obj,skill,chixu,time)
    return GetCastTime(obj,skill)>chixu and GetCastTime(obj,skill)<time
end
function death(obj)
    ---ץ��   ����2228
    ---�����
    if nojiekong(obj,412,3,50) then
        return true
    end
    ---�ѳ��׼�    Ů洲���
    if objmount(obj,"�����") and  nojiekong(obj,2226,4,30) and nojiekong(obj,2230,20,54) then
        return true
    end
    ---�͹Ǿ�
    if nojiekong(obj,257,8,35) then
        return true
    end
    ---��Ū��   ȵ̤֦
    if objmount(obj,"���ľ�|�����ľ�") and GetCastCount(obj,574,75)>2 and GetCastCount(obj,550,75)>2 then
        return true
    end
    ---��¥  ̫��ָ
    if objmount(obj,"������|�뾭�׵�") and  nojiekong(obj,100,4,18) and GetCastCount(obj,228,22)>2 then
        return true
    end
    ---ɢ��ϼ
    if objmount(obj,"������") and  GetCastCount(obj,16608,40)>3 then
        return true
    end
    return false
end
function needTui(obj)
    ---��Ҫ��
    if target ==nil then
        return false
    end
    if tbuff("����߳��")then
        return true
    end
    ---�׼�
    local npc,count = FindNpc(target, "59171", 8, "�ж�")
    if count>0 then
        return true
    end
    ---��̫��,������
    npc,count = FindNpc(target, "������̫��|����������", 18, "�ж�")
    if count>0 then
        return true
    end
    return false
end
function toBack()
    ---�Զ��Ʊ�
    if target and  GetDist(target) <=4 then
        if IsBack(target) then
            MoveForwardStop()
        else
            MoveForwardStart()
        end
    end
end
function toFor()
    ---�Զ��Ʊ�
    if GetDist(target) <=3 then
        if IsBack(target) then
            StrafeLeftStop()
        else
            StrafeLeftStart()
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
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "����")==false and IsDangerArea(v, "�ж�") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objNotWudi(v) then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and  objmount(v,"�躣��")==false and objState(v, "����")==false and IsDangerArea(v, "�ж�") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objLife(v) < hp and objNotWudi(v) then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "����")==false and IsDangerArea(v, "�ж�") == false and GetDist(this_player, v) < range and IsVisible(this_player, v) and objNotWudi(v) then
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

function setAll(player)
    this_player = player
    --print("111")
    mbuff = GetBuff(player)
    target, tclass = GetTarget(player)
    if target ~= nil then
        tbuffList = GetBuff(target)
        ttarget, ttclass = GetTarget(target)
        if ttarget ~= nil then
            ttbuffList = GetBuff(ttarget)
        end
    return target
    end
end