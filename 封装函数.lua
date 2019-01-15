local save_target
local target
local tclass
local this_player
local mbuff
local tbuffList
local ttarget
local ttclass
local ttbuffList
local gcdsj=0.2 --gcdʱ��
function ota(desc)
    local mota, motatime, motaratio = GetPrepare()
    return string.find(desc, mota)
end
function tota(desc)
    local mota, motatime, motaratio = GetPrepare(target)
    return string.find(desc, mota)
end
function objLife(obj)
    if obj == nil then
        return 999
    end
    local bfb = (obj.nCurrentLife / obj.nMaxLife) * 100
    return bfb
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
    return GetDist(target)
end
function his()
    if target == nil or tclass == NPC then
        return 0
    end
    return GetHeight(target)
end
function dis2()
    return GetDist2D(target)
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
    return string.find(desc, tate)
end
function tstate(desc)
    if target == nil then
        return false
    end
    local tstate = GetState(target)
    return string.find(desc, tstate)
end
function mount(desc)
    local school = GetMount(this_player)
    --print(school)
    return string.find(desc, school)
end
function tmount(desc)
    if tclass == NPC then
        return false
    end

    local school = GetMount(target)
    --print(school)
    if school == nil then
        return false
    end
    return string.find(desc, school)
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
    --print(desc)
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
function getWeight()
    --��ȡ�Լ���buff����
    --local mbuff = GetBuff(player)
    --��ȡĿ���buff����
    --local tbuffList = GetBuff(target)

    local wudi = "��ɽ��|ƽɳ����|����|ɢ��ϼ|����|����|�Ϸ�����|Ц���|̫��|�������|Х�绢|ԡ��|����|ʴ�Ĺ�"
    local jianshang80 = "9696|7119|368|10307"
    --���Ӱ�� �ֻ� ����ɽ Ц������
    local jianshang70 = "8421|10493|1802|384"
    --���� ����� ���� תǬ��
    local jianshang60 = "6264|11319|8300|13044|9836|9206|6200"
    --���໤�� ��Ԩ���� ��ǽ ����� Ħ�� ����֮��  ��Х����
    local jianshang50 = "9810|6315|10014|8427|9803|6306|2983|1412|3068"
    --���� ���� ���� �ٻ� ����� ������ ���� �������� ����
    local jianshang40 = "9873|2953|1187|399|9693|6279|11920|8839|6637|6636|6257|5744|6163|9874|9293|12530|122|6240|12656|9208|8495|6248"
    --ҷ�� ʥ��֯�� ���� ����� ���Ӱ�� ̰ħ�� ���໤�� ʥ��֯�� ʥ��֯�� ʥ��֯�� ���໤�� ̰ħ�� ����ɽ ɢӰ ��Ӱ ����Ϸˮ ���໤�� ��ˮ�� ˮ鿻�ӯ ����֮�� ���� �ݲй�
    local jianshang30 = "9510|11457|9895|9745|9896|8302|12286|2177|10051|9510|5641|6262|6160|5806|5705|2813|6247"
    --�������� ��ˮ ־�� ��ʥ ���� ���� ������ת ���� ��ˮ��Ӱ �������� ��� ���� ���� ���� ���� ��� ��Ӱ
    local jianshang20 = "2983|7790|7171|6378|6209|5746"
    --���� ��ս �ƻ� ѱ�� ����� ������Ӱ
    local jianshang10 = "11272|9904|9763|11344|6333|6610|5750|10024|12411|8424|6540|6337|6237|5770|4479|6113"
    --���� ��Ȫ ���� ���� �Ͻ���ӡ �ݺ� ��ȥ�� ��ŵ� ���� ����Ϸˮ �ᶨ ��ɽ �껤 ʥӿ �ҽ� �۳� ǧ������
    local miankong = "������|����|ͻ|����|Ц���|��Ԩ|������|��Ծ��Ԩ|�Ƴ��׼�|�̵��׼�|�����׼�|����|����|�������|��Ӱ|����|����|��¥��Ӱ|�麨|����|��Ȼ|���|����֮��|����|Х��|��¥��Ӱ|תǬ��|תǬ��|ʥ��|�������|��Ұ|����|ǧ��׹|����|������|����|������|������|�γ۳�|��̫��|��̫��|�����|�Ƴ��|��������miankong|�����޳�|�����޳�|����|ʯ����|����|����|����Χ|����|̽÷|����|��Ӱ|����|����|�ٻ�|��������|��ǽ|������Ⱥ|ǧ������|����|ǧ��|�޾�|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|����|����|��������|����|���|ˮ���޼�|�۹�|ʴ�Ĺ�|��Ȫ��Ծ|��Ӱ|�ɹ�|���߿���|��������|��Ӱ"
    local shanbi80 = "10619|9846|9783"
    --����|�������� ȵ̤֦
    local shanbi60 = "6434|9783|5668|9736"
    --����ң ȵ̤֦ �紵�� �ȱ�Ը

    local shanbi50 = "2065|6299|8866|677"
    --��ϡ�� ������� ȵ̤֦ ȵ̤֦
    local shanbi40 = "6174|4028|10618"
    --���� ʥ���� ����
    local shanbi30 = "4931|6146"
    --���� ����
    local shanbi20 = "4710|6142|3310|948"
    --���� ���� ���� �����������
    local shanbi10 = "857|10465|6289|10617"
    --���� ����̿� �ȱ� ����

    local fengnei = { "���Զ���|����ʽ|����ָ|����ҫ|������Х|÷����|����|�Х����|�Х�ݲ�|�Х����|�Х����|����|�������|��Ĭ|������ŭ" }
    local chenmo = "����|���ɾ���|��������|��Ĭ|���ɾ���|ֹϢ|����|��Ĭ|����|����ͨ��|����"
    local jianliao = "���|����|Ϣ��|���Ӱ��|��һ|�ܻ�|������|����|��������|������|����|Ы��|��ӽ�ɳ|��Ϣ|�̳�|�������|����ݲ�|��������|����|���Ӱ��"
    local jidao = { "����ع�|̤������|����" }
    local suozu = { "����|����|����ع�|���Ǽ�|����|����|����|Ӱ��|����ع��|������|����|��|�巽�о�|���|����|̫��ָ|����|��ҹ����|������Ӱ|����|ʥЫ�׼�|���|��צ|��ȸ��|����|�����׼�|Ӱ��|�������|����ݲ�|��������|�巽�о�|���Ż���|�¹�����|����|ֹˮ|Ӱ��|����" }
    local dingshen = { "����|���|����|����|����|����|�������|��Ӱ|�������|��ҹ����|˿ǣ|�ù�|筴�����|����|ͬ��|����|̫��ָ|���|��������|��������|ܽ�ز���|���ǹ���|����|�ù�|����|��������|�������" }
    local yunxuan = { "ѣ��|ǧ��׹|�ù�|����ع�|����|����|��ľ����|��������|����|����|����|����ң|������ħ��|�ùⲽ|����|���|�ƻ�|��ħ|��ҹ����|����|������|��Ӱ|��������|����|Ы�Ķ���|Ы�Ŀݲ�|Ы������|�ϻ��|����|�׹��ɽ|Σ¥|����|��ͷһ��|��ע|�Ƽ���|Ы����|����|��ʨ�Ӻ�|���̽Կ�|ͻ|ս��ѣ��|׷��|�ս�|����ƾ�|��" }
    local jiaoxie = "����|ϼ��|��η����|��е"
    local youxian3 = { "�����", "������", "��֪" }
    local youxian2 = { "Ī��", "��Ӱʥ��", "�����", "���޹��", "��Ѫս��", "��ϼ��", "Ц����" }
    local youxian1 = { "�뾭�׵�", "�����ľ�", "̫�齣��", "���ľ�" }

    local weight = 10
    --OutputinGame("---------------------------------")
    if GetBuffTime(tbuffList, wudi) > 0 then
        weight = weight + 100
    end
    if tstatep("�޵�") then
        --���Ŀ��ɿ���
        weight = weight + 100
    end
    if tstatep("����") then
        --���Ŀ��ɿ���
        weight = weight + 100
    end
    if GetBuffTime(tbuffList, wudi) > 0 then
        weight = weight + 100
    end
    if GetBuffTime(tbuffList, jianshang80) > 0 then
        weight = weight + 8
        --OutputinGame("jianshang80")
    end
    if GetBuffTime(tbuffList, jianshang70) > 0 then
        weight = weight + 7
        --OutputinGame("jianshang70")
    end
    if GetBuffTime(tbuffList, jianshang60) > 0 then
        weight = weight + 6
        --OutputinGame("jianshang60")

    end
    if GetBuffTime(tbuffList, jianshang50) > 0 then
        weight = weight + 5
        --OutputinGame("jianshang50")
    end
    if GetBuffTime(tbuffList, jianshang40) > 0 then
        weight = weight + 4
        --OutputinGame("jianshang40")
    end
    if GetBuffTime(tbuffList, jianshang30) > 0 then
        weight = weight + 3
        --OutputinGame("jianshang30")
    end
    if GetBuffTime(tbuffList, jianshang20) > 0 then
        weight = weight + 2
        --OutputinGame("jianshang20")
    end
    if GetBuffTime(tbuffList, jianshang10) > 0 then
        weight = weight + 1
        --OutputinGame("jianshang10")
    end
    --if GetBuffTime(tbuffList, shanbi80) > 0 then
    --    weight = weight + 8
    --    --OutputinGame("shanbi80")
    --end
    --if GetBuffTime(tbuffList, shanbi60) > 0 then
    --    weight = weight + 6
    --    --OutputinGame("shanbi60")
    --end
    --if GetBuffTime(tbuffList, shanbi50) > 0 then
    --    weight = weight + 5
    --    --OutputinGame("shanbi50")
    --end
    --if GetBuffTime(tbuffList, shanbi40) > 0 then
    --    weight = weight + 4
    --    --OutputinGame("shanbi40")
    --end
    --if GetBuffTime(tbuffList, shanbi30) > 0 then
    --    weight = weight + 3
    --    --OutputinGame("shanbi30")
    --end
    --if GetBuffTime(tbuffList, shanbi20) > 0 then
    --    weight = weight + 2
    --    --OutputinGame("shanbi20")
    --end
    --if GetBuffTime(tbuffList, shanbi10) > 0 then
    --    weight = weight + 1
    --    --OutputinGame("shanbi10")
    --end

    if GetBuffTime(tbuffList, jianliao) > 0 then
        weight = weight - 3
        --OutputinGame("shanbi10")
    end
    if tstatep("��Ĭ") then
        --���Ŀ��ɿ���
        weight = weight - 3
    end
    if tstatep("��е") then
        --���Ŀ��ɿ���
        weight = weight - 3
    end
    if tstatep("����") then
        --���Ŀ��ɿ���
        weight = weight - 3
    end
    if tstatep("����") then
        --���Ŀ��ɿ���
        weight = weight - 3
    end
    if tstatep("����") then
        --���Ŀ��ɿ���
        weight = weight - 1
    end
    if tstatep("ѣ��") then
        --���Ŀ��ɿ���
        weight = weight - 1
    end
    if tstatep("����") then
        --���Ŀ��ɿ���
        weight = weight - 2
    end
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

function cdEX(skill)
    ---ͨ���Ѿ��ͷŵļ���ʱ�����жϼ����Ƿ�cd
    --if skill()
    print(skill)
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
    return (fengneiTime() > 0 and fengneiTime() > time) or (chenmoTime() > 0 and chenmoTime() > time) or (jiaoxieTime() > 0 and jiaoxieTime() > time)
end
function toBack()
    ---�Զ��Ʊ�
    if GetDist(target) < 2 then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "�ж�") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and v.IsHaveBuff(9695, 0) == false and v.IsHaveBuff(10212, 0) == false then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "�ж�") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objLife(v) < hp and v.IsHaveBuff(203, 0) == false and v.IsHaveBuff(9695, 0) == false and v.IsHaveBuff(10212, 0) == false then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "�ж�") == false and GetDist(this_player, v) < range and IsVisible(this_player, v) and v.IsHaveBuff(9695, 0) == false and v.IsHaveBuff(10212, 0) == false then
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

--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    this_player = player
    mbuff = GetBuff(player)
    target, tclass = GetTarget(player)
    if target ~= nil then
        tbuffList = GetBuff(target)
        ttarget, ttclass = GetTarget(target)
        if ttarget ~= nil then
            ttbuffList = GetBuff(ttarget)
        end
        local weight=getWeight()
        --print("weight:",weight)
        tab(weight)
        --���浱ǰĿ��
        FollowTarget()
        toBack()
        TurnTo(target)
        --if GetHeight(player)>0 then
        --	Jump()
        --end
        DPS(weight)
    end
end