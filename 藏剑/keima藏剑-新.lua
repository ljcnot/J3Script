AddOption("������ɽ")
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
local gcdsj = 0.2 --gcdʱ��
local help = false
local lastSelectTime = 0
local isprint = true
local isGensui= GetOption("�Զ�����")
local isRaobei= GetOption("�Զ��Ʊ�")
local isMianxiang= GetOption("�Զ�����")
local isFengche= GetOption("������ɽ")
--local youxian3 ={}

function ota(desc)
    local mota, motatime, motaratio = GetPrepare()
    return string.find(desc, mota)~=nil
end
function tota(desc)
    local mota, motatime, motaratio = GetPrepare(target)
    return string.find(desc, mota)~=nil
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
    return face()>=0 and face()<=15
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
    CastTo(skillid,target,true)
end
function skillEX2(skillid)
    ---��ϵ�ǰ����
    Cast(skillid,true,true)
end
function dis()
    return GetDist(target)
end
function haveMiankong()
    if target == nil then
        return false
    end
    --local talent = GetTalentInfo(target)
    if  tbuff("Ů洲���") then
        return true
    end
    return false
end
function his()
    if target == nil or  tclass == NPC then
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
function tmount(desc)
    if tclass == NPC then
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
    local wudi = {203,9695,10212,9934,377}
    for k, v in ipairs(wudi) do
        if obj.IsHaveBuff(v, 0) then
            return false
        end

    end
    return true
end
function lastSkill(skill,time)
    local time123 = GetCastTime(this_player, skill)
    --5���ڷŹ�ָ�����ܣ�ע��Ҫ�жϴ��ڵ���0
    return time123 >= 0 and time123 < time
end
---Ȩ�ؼ���
function getWeight()
    --��ȡ�Լ���buff����
    --local mbuff = GetBuff(player)
    --��ȡĿ���buff����
    --local tbuffList = GetBuff(target)

    local wudi = "��ɽ��|ƽɳ����|������|ɢ��ϼ|����|�Ϸ�����|Ц����|Х�绢|ԡ��|����|ʴ�Ĺ�"
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
    local miankong = "������|����|ͻ|����|Ц����|��Ԩ|������|��Ծ��Ԩ|�Ƴ��׼�|�̵��׼�|�����׼�|����|����|�������|��Ӱ|����|����|��¥��Ӱ|�麨|����|��Ȼ|���|����֮��|����|Х��|��¥��Ӱ|תǬ��|תǬ��|ʥ��|�������|��Ұ|����|ǧ��׹|����|������|����|������|������|�γ۳�|��̫��|��̫��|�����|�Ƴ��|����������miankong|�����޳�|�����޳�|����|ʯ����|����|����|����Χ|����|̽÷|����|��Ӱ|����|����|�ٻ�|��������|��ǽ|������Ⱥ|ǧ������|����|ǧ��|�޾�|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|����|����|��������|����|���|ˮ���޼�|�۹�|ʴ�Ĺ�|��Ȫ��Ծ|��Ӱ|�ɹ�|���߿���|��������|��Ӱ"
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
    --if GetBuffTime(tbuffList, wudi) > 0 then
    --    weight = weight + 100
    --end
    if tstatep("�޵�") then		--���Ŀ��ɿ���
        weight= weight +100
    end
    if tstatep("����") then		--���Ŀ��ɿ���
        weight= weight +100
    end
    --if GetBuffTime(tbuffList, wudi) > 0 then
    --    weight = weight + 100
    --end
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
    if tstatep("��Ĭ") then		--���Ŀ��ɿ���
        weight= weight -3
    end
    if tstatep("��е") then		--���Ŀ��ɿ���
        weight= weight -3
    end
    if tstatep("����") then		--���Ŀ��ɿ���
        weight= weight -3
    end
    if tstatep("����") then		--���Ŀ��ɿ���
        weight= weight -3
    end
    if tstatep("����") then		--���Ŀ��ɿ���
        weight= weight -1
    end
    if tstatep("ѣ��") then		--���Ŀ��ɿ���
        weight= weight -1
    end
    if tstatep("����") then		--���Ŀ��ɿ���
        weight= weight -2
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
    --print(skill)
    return GetSkillSCD(skill) > 0
end

function cdEX2(skill)
    ---���ܼ����ж�
    return GetSkillCN(skill)==0
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
function jiekong()
    if (GetSkillGCD("����") + gcdsj) > dingshenTime() then
        return false
    end
    if (GetSkillGCD("����") + gcdsj) > yunxuanTime() then
        return false
    end
    return true
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
            if obj.dwID == z_target.dwID then
                count = count+1
            end
        end
    end
    return count
end
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
    if dis() > 6 or cdEX("����") or this_player.nCurrentRage < 10 or haveMiankong() or tstatep("���") or tstatep("����") or (mount("ɽ�ӽ���") and (HaveTalent("����") ==false or cdEX("����") == false)) then
        return false
    end
    if tnostate("���") and tstate("ѣ��|����") and seeObj(target)>0 and jiekong() then
        return true
    end
    if tnostate("���") and tstatep("���") == false and tstate("����|ѣ��|����") == false then
        return true
    end
    return false
end

function xiaori(weight)
    ---Х��
    if cdEX2("Х��") or lastSkill(14910,1) or lastSkill(18322,1) or lastSkill(18322,1) or lastSkill(1580,1) or lastSkill(1589,1)  then
        return false
    end
    if mount("��ˮ��") then
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
        if state("����|ѣ��|����|����") and (weight <= 8 or life() <= 70) then
            --print("state(����|ѣ��|����|����|��ֱ)")
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
        if this_player.nCurrentRage < 10 and GetSkillCN("ݺ����")==0 then
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
    return false
end
function xizhaoleifeng()
    ---Ϧ���׷�
    if dis() > 8 or this_player.nCurrentRage < 15 then
        return false
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
    if dis() > 21 or cdEX("�׹��ɽ") or this_player.nCurrentRage < 20 or tstate("���") then
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
    if dis() <=8 and (kongzhiTimeEX(1.5) or noSkillTime(1.5) or tota("ǧ������")) and weight <= 5 then
        return true
    end
    if HaveTalent("����") and dis() <=4 and target ~= nil and target.nRunSpeed < 22 and weight <= 5 and kongzhiTimeEX(1) then
        return true
    end
    if HaveTalent("����") and dis() <=4 and target ~= nil and target.nRunSpeed < 22 and weight <= 3 then
        return true
    end
    if HaveTalent("����") == false and dis() <=4 and weight <= 5 then
        return true
    end
    return false
end
function fengchayunjing(weight)
    ---����ƾ�
    if dis() > 6 or this_player.nCurrentRage < 10 or cdEX("����ƾ�") or tstatep("����") then
        return false
    end
    if target ~= nil and CastTime(2226, 4) then

        return true
    end
    if ttarget ~= nil and IsParty(ttarget) and (ttlife() < 60 or ttlife()< 40)then
        return true
    end
    if tbuff("����|ҷ��") then
        return true
    end
    if cdEX("�Ʒ����") or weight > 8 or tstate("ѣ��|����|����")  or lastSkill(1647,1) or lastSkill(1649,1) then
        return false
    end
    if weight >= 6 and weight <= 8 and buff("����")  and (tstatep("���") or (tmount("ɽ�ӽ���") and cdEX("����") and cdEX("����")) or (tmount("��ˮ��") and cdEX("����")) ) then
        return true
    end
    if weight <= 2 and (tstatep("���") or ((tmount("ɽ�ӽ���") and cdEX("����") and cdEX("����")) or (tmount("��ˮ��") and cdEX("����")))) then
        return true
    end
    return false
end
function yingmingliu(weight)
    ---ݺ����
    if buff("ݺ��") or dis() > 4 then
        return false
    end
    if this_player.nCurrentRage < 10 and mount("ɽ�ӽ���") then
        return true
    end
    if weight <= 5 and mount("ɽ�ӽ���") then
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
    if tnostate("���") and tstate("����|����") and seeObj(target)>0 and jiekong()then
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
    -- �ڹ��б���"ϴ�辭","�׽","��ϼ��","̫�齣��","������","�뾭�׵�","��Ѫս��","������","�����ľ�","���ľ�","��ˮ��","ɽ�ӽ���","����","�����","�����","���޹��","��Ӱʥ��","����������","������","��ɽ��","Ц����","Ī��","��֪","������"
    if ttarget ~= nil and IsParty(ttarget) and ttlife() < 60 then
        return true
    end
    if weight <= 10 and tmount("�����|�뾭�׵�|��֪|�����ľ�") and kongzhiTimeEX(1) then
        return true
    end
    if weight <= 7 and kongzhiTimeEX(1) then
        return true
    end
    if weight <= 5 then
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
    -- �ڹ��б���"ϴ�辭","�׽","��ϼ��","̫�齣��","������","�뾭�׵�","��Ѫս��","������","�����ľ�","���ľ�","��ˮ��","ɽ�ӽ���","����","�����","�����","���޹��","��Ӱʥ��","����������","������","��ɽ��","Ц����","Ī��","��֪","������"
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
        Cast("Х��", true)
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
    if tinglei() then
        skill("����")
    end

end
function shanjujianyi(weight)
    ---ɽ�ӽ���
    if xieliubaoshi(weight) then
        --print("ϼ����ʯ")
        skillEX2("ϼ����ʯ")
        --return
    end
    if zuiyue() then
        --print("����")

        CastTo("����", target, true)
        --return
        --return 1
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
    if isFengche and fenglaiwushan(weight) then
        --print("������ɽ")
        skillEX2("������ɽ")
        return 1
    end
    if yunfeiyuhuang(weight) then
        --print("�Ʒ����")
        CastTo("�Ʒ����", target, false)
        --return 1
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
        Cast("ݺ����", true, false)
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
    if shuyunzhuyue() then
        CastTo("��������", target, false)
    end
    --print("�ж��ķ�")
    if mount("��ˮ��") then
        wenshui(weight)
    else
        --print("ɽ��")
        shanjujianyi(weight)
    end

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
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "����")==false and IsDangerArea(v, "�ж�") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objLife(v) < hp and objNotWudi(v) then
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

function tab(weight)
    if objState(target, "����")  then
        findTargetforRange(30)
        print("Ŀ������")

    end
    --if IsParty(target) then
    --    if target ~=nil then
    --        SetTarget(save_target)
    --    end
    --else
    --    if target ~=nil then
    --        save_target = target
    --    end
    --end
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
                    print("��̽÷")
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
            if IsEnemy(v.dwID) and GetDist(this_player, v) < 20 and objState(v, "����")==false and GetHeight(v)>8 and IsVisible(this_player, v) and v~=this_player  and objNotWudi(v) then
                local tate = GetState(v)
                if string.find("���", tate) ==nil then
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
    if tlife() > 20 then
        findTargetforHp(20)
    end
end

--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    local fNpc,count = FindNpc(player, "������ɽ", 10, "�ж�")
    if count>0 then
        skill("��ҡֱ��")
        skill("��������")
        skill("�׹��ɽ")
        return
    end
    this_player = player
    mbuff = GetBuff(player)
    target, tclass = GetTarget(player)
    if target ~= nil then
        --���浱ǰĿ��
        if save_target ==nil then
            save_target = target
        end
        if isGensui and IsDangerArea(target, "�ж�") then
            MoveAction_StopAll()
        else
            if isMianxiang then
                TurnTo(target)
            end
            if isGensui then
                MoveForwardStart()
            end
            if isRaobei then
                toBack()
            end
        end
        ----------------------------------

        tbuffList = GetBuff(target)
        ttarget, ttclass = GetTarget(target)
        if ttarget ~= nil then
            ttbuffList = GetBuff(ttarget)
        end
        local weight = getWeight()
        --print("weight:",weight)
        tab(weight)
        if tbuff("����") then
            StopAction()
            return
        end
        if ota("�Ʒ����") then
            MoveAction_StopAll()
            return
        end



        --if GetHeight(player)>0 then
        --	Jump()
        --end

        if ota("������ɽ") then
            --����糵�Ͳ�ִ�к����
            return
        end
        if IsParty(target) then
            return
        end
        DPS(weight)
    --else
    --    if save_target~=nil then
    --        SetTarget(save_target)
    --    end
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