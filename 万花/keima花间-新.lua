
AddOption("�Զ�����")
szScriptDesc = "���ߣ�keima\n˵�����ű�˵��\n��Ѩ��[��ϼ][�Ÿ�][��紹¶][����ָ][����][����][����][����][��Ϣ][����][���][�Ϸ�����]"

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


local isMianxiang= GetOption("�Զ�����")

local shangyangbuff ={}
local yangmingbuff ={}

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
function mana()
    if this_player == nil then
        return 999
    end
    local bfb = (this_player.nCurrentMana / this_player.nMaxMana) * 100
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
function buffcs(list)
    mbuff = GetBuff(this_player)
    return GetBuffStack(mbuff, list)
end
function tbuff(list)
    tbuffList = GetBuff(target)
    return GetBuffTime(tbuffList, list) > 0
end
function tbuffisme(list)
    tbuffList = GetBuff(target)
    return GetBuffTime(tbuffList, list,true) > 0
end
function tbufftime(list,time)
    tbuffList = GetBuff(target)
    return GetBuffTime(tbuffList, list,true) > 0 and GetBuffTime(tbuffList, list,true) <= time
end
function gettbufftime(list)
    tbuffList = GetBuff(target)
    return GetBuffTime(tbuffList, list,true)
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
    print(skillid)
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

function rseeme()
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
function qusan(obj)

   return GetBuffType(obj,"���Բ���Ч��")>0 or GetBuffType(obj,"���Բ���Ч��")>0
           or GetBuffType(obj,"��Ԫ�Բ���Ч��")>0 or GetBuffType(obj,"���Բ���Ч��")>0 or
           GetBuffType(obj,"��Ѩ����Ч��")>0
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
    if tstatep("�޵�") then		--���Ŀ��ɿ���
        weight= weight +100
    end
    if tstatep("����") then		--���Ŀ��ɿ���
        weight= weight +100
    end
    if GetBuffTime(tbuffList, wudi) > 0 then
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
    if tstatep("����30") then
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
    if (GetSkillGCD("ܽ�ز���") + gcdsj) > dingshenTime() then
        return false
    end
    if (GetSkillGCD("ܽ�ز���") + gcdsj) > yunxuanTime() then
        return false
    end
    return true
end
function death()
    local deathskill = {100,}
                       --��¥
end

function boom()
    local count = 0
    if gettbufftime("����ع��")>10 then
        count = count+1
    end
    if gettbufftime("��������")>10 then
        count = count+1
    end
    if gettbufftime("����ָ")>10 then
        count = count+1
    end
    return count
end
function chunnihuhua()
    ---���໤��
    if cdEX("���໤��")  or statep("����") or statep("��������") then
        return false
    end
    if life()< 60 then
        return true
    end
    return false
end
function yushijufen(weight)
    ---��ʯ���
    if dis()>20 or cdEX("��ʯ���") then
        return false
    end
    if weight<=8 and boom()>=3 then
        return true
    end
    if weight<=2 and boom()>=2 then
        return true
    end
    return false
end
function furongbingdi(weight)
---ܽ�ز���
    if dis()>20 or cdEX("ܽ�ز���") then
        return false
    end
    if (tbufftime("����ع��",13) or tbufftime("��������",13) or tbufftime("����ָ",13)) and cdEX("��ʯ���")==false and weight<=8 then
        return true
    end
    if tbufftime("����ع��",13) or tbufftime("��������",13) then
        if tnostate("���") and tstatep("���")==false and tstate("����") and jiekong()then
            return true
        end
        if tnostate("���") and tstatep("���") == false and tstate("����|����|ѣ��|����") == false then
            return true
        end
    end

    return false
end
function lancuiyuzhe()
    ---��������
    if dis()>20 or cdEX("��������") then
        return false
    end
    if (not tbuffisme("��������") or tbufftime("��������",8)) and (buff("����") or buff(412) or buff(8458))  then
        return true
    end
    if state("վ��") and not tbuffisme("��������") or tbufftime("��������",8) then
        return true
    end
    return false
end
function zhonglingminxiu()
    ---����ع��
    if dis()>20 or cdEX("����ع��")  or lastSkill(189,4) then
        return false
    end
    if  tbufftime("����ع��",10) and (state("վ��") or buff(412) or buff(8458))  then
        return true
    end
    return false
end
function luansaqinghe(weight)
    ---�������
    if dis()>20 or cdEX("�������") then
        return false
    end
    if weight<=5 and cdEX("��ʯ���") then
        return true
    end
    return false
end
function shuiyuewujian(weight)
    ---ˮ���޼�
    if dis()>20 or cdEX("ˮ���޼�") then
        return false
    end
    if weight<=6 and tbuffisme("��������") then
        return true
    end
    if weight<=4 then
        return true
    end
    return false
end

function yangmingzhi()
    ---����ָ
    if dis()>20 then
        return false
    end
    if not tbuffisme("����ع��") and buff("�Ÿ�")then
        return true
    end
    if cdEX("ܽ�ز���") and  tbuffisme("ܽ�ز���") and buff("�Ÿ�")then
        return true
    end
    return false
end
function shangyangzhi()
    ---����ָ
    if dis()>20 then
        return false
    end
    if (not tbuffisme("����ָ") or tbufftime("����ָ",10)) and (state("վ��") or buff(412) or buff(8458))  then
        return true
    end
    return false
end

function taiyinzhi(weight)
    ---[̫��ָ]
    if cdEX2("̫��ָ") then
        return false
    end
    if state("ѣ��|����") and (weight <= 8 or life() <= 80)  then
        return true
    end
    return false
end
function qingxinjingqi()
    ---���ľ���
    if buff("���ľ���") then
        return false
    end
    return true
end
function qingfengchuilu()
    ---[��紹¶]
    if not  HaveTalent("��紹¶") or cdEX("��紹¶") then
        return false
    end
    if qusan(mbuff) then
        return true
    end
    return false
end
function jueyinzhi()
    ---����ָ
    if not HaveTalent("����ָ") or cdEX("����ָ") or dis()>20 then
        return false
    end
    if tIsota() then
        return true
    end
    return false
end
function nanfengtuyue()
    ---�Ϸ�����
    if not HaveTalent("�Ϸ�����") or cdEX("�Ϸ�����") then
        return false
    end
    if life()<=30 and not statep("�޵�") and not statep("����80") then
        return true
    end
    return false
end
function xinglouyueying(weight)
    ---��¥��Ӱ
    if cdEX("��¥��Ӱ") then
        return false
    end
    if state("����") and (weight <= 8 or life() <= 80)  then
        return true
    end
    if state("ѣ��|����") and cdEX2("̫��ָ") and (weight <= 8 or life() <= 80)  then
        return true
    end
    return false
end
function bishuitaotian()
    ---��ˮ����
    if cdEX("��ˮ����") then
        return false
    end
    if mana()<=40  then
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

function zhouweiguadu()
        ---��ǵ�ǰĿ���ͷ�����ָ������ָ
        --print("��ǵ�ǰĿ���ͷ�����ָ������ָ")
        local players = GetAllPlayer()
        for k, v in ipairs(players) do
            --v����Ҷ���
            if IsPlayer(v.dwID) and IsEnemy(v)  and objState(v, "����")==false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objNotWudi(v) then
                if yangmingbuff[v.dwID] ~=nil and buffcs("�Ÿ�")>1 then
                    if (GetTickCount() - yangmingbuff[v.dwID] ) > 18000 then
                        CastTo("����ָ",v,false)
                    end
                else
                    if buffcs("�Ÿ�")>1 then
                        CastTo("����ָ",v,false)
                    end
                end
                if shangyangbuff[v.dwID] ~=nil  then
                    if (GetTickCount() - shangyangbuff[v.dwID] ) > 18000 then
                        CastTo("����ָ",v,false)
                    end
                else
                        CastTo("����ָ",v,false)
                end
            end
        end
end

function DPS(weight)



    if shuiyuewujian(weight) then
        Cast("ˮ���޼�", true, true)
    end
    ---�������
    if luansaqinghe(weight) then
        skillEX2("�������")
    end
    ---��ʯ���
    if yushijufen(weight) then
        --if furongbingdi() then
        --    skillEX("ܽ�ز���")
        --else
        --    if shuiyuewujian(weight) then
        --        Cast("ˮ���޼�", true, true)
        --    end
            skillEX("��ʯ���")
        --end
    end

    if yangmingzhi() then
        skillEX("����ָ")
    end
    if furongbingdi(weight) then
        skill("ܽ�ز���")
    end
    if shangyangzhi() then
        skill("����ָ")
    end
    ---��������
    if lancuiyuzhe() then
        skillEX("��������")
    end

    ---����ع��
    if zhonglingminxiu() then
        skill("����ع��")
    end
    if jueyinzhi() then
        skillEX("����ָ")
    end



    ---��ˮ����
    if bishuitaotian() then
        Cast("��ˮ����", true, true)
    end
    ---���ľ���
    if qingxinjingqi() then
        Cast("���ľ���", true, true)
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
        findTargetforRange(20)
        print("Ŀ������")

    end
    if IsParty(target) then
        if target ~=nil then
            SetTarget(save_target)
        end
    else
        if target ~=nil then
            save_target = target
        end
    end
    if  target == nil and save_target~=nil then
        save_target = target
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
    --if IsInArena()  then
    --    if cdEX("���໤��") == false  or ( HaveTalent("��紹¶") and cdEX("��紹¶") == false)  or ( HaveTalent("�Ϸ�����") and cdEX("�Ϸ�����") == false)then
    --        ---���̽÷ûCD ����Ŀ���ǵж�
    --        local target
    --        --���������Ա
    --        for k, v in ipairs(GetAllMember()) do
    --            if IsPlayer(v.dwID) and IsParty(v) and objState(v, "����")==false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and v~=this_player  and objNotWudi(v) then
    --                local tate = GetState(v)
    --                if cdEX("���໤��") == false  and  objLife(v) <= 60 then
    --                    --�ȱ��浱ǰ����
    --                    CastTo("���໤��", v, true)
    --                    print("�����໤��")
    --                    --return 1
    --                end
    --                if  HaveTalent("�Ϸ�����")  and cdEX("�Ϸ�����") == false and objLife(v) <= 30 then
    --                    --�ȱ��浱ǰ����
    --                    CastTo("�Ϸ�����", v, true)
    --                    print("�����໤��")
    --                    --return 1
    --                end
    --                if HaveTalent("��紹¶") and cdEX("��紹¶") == false and qusan(GetBuff(v))and objLife(v) <= 60 then
    --                 CastTo("��紹¶", v, true)
    --                end
    --            end
    --        end
    --    end
    --
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
    if tlife() > 40 then
        findTargetforHp(40)
    end
end

function seurvival(weight)
    ---��������
    --�Ϸ�����
    if nanfengtuyue() then
        Cast("�Ϸ�����",true,true)
    end
    ---[��紹¶]
    if qingfengchuilu() then
        Cast("��紹¶", true, true)
    end
    if xinglouyueying(weight) then
        Cast("��¥��Ӱ", true, true)
    end
    ---���໤��
    if chunnihuhua() then
        Cast("���໤��", true, true)
    end

    if taiyinzhi(weight) then
        Cast("̫��ָ", true, true)
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
        local weight = getWeight()
        seurvival(weight)
        ---��ǵ�ǰĿ���ͷ�����ָ������ָ
        if  rseeme()==0 and GetSkillCD("����ָ") ==0 and cdEX("��ʯ���") then
            zhouweiguadu()
        end
        --print("weight:",weight)
        tab(weight)
        if tbuff("����") then
            StopAction()
            return
        end

        if isMianxiang then
            TurnTo(target)
        end

        --if GetHeight(player)>0 then
        --	Jump()
        --end
        if IsParty(target) then
            return
        end
        if GetFace(target)>=0 and GetFace(target) <=90 then
            DPS(weight)
        end

    end

    --if rseeme()>0 and GetSkillCD("����ָ") >0 and state("վ��") then
    --    Cast(9007)  --����
    --end
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
    if CasterID == myid    then  --����Ƕ����ͷţ�����������׶εļ���ID
        if  dwSkillID == 179 then ---����ָ
            yangmingbuff[tIDnX]= GetTickCount()
        end
        if  dwSkillID == 180 then ---����ָ
            shangyangbuff[tIDnX]= GetTickCount()
        end
    end

    --print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --����ͷ���Ϣ
end


--��ʼ�����ص��������������ʼ����ʱ����
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end