--local save_target
--local target
--local tclass
--local this_player
--local mbuff
--local tbuffList
--local ttarget
--local ttclass
--local ttbuffList
--local gcdsj = 0.2 --gcdʱ��
--local help = false
--local lastSelectTime = 0
--local move = true
--local laststate
--AddOption("�Զ���8�߸���")
--
--function ota(desc)
--	local mota, motatime, motaratio = GetPrepare()
--	return string.find(desc, mota)~=nil
--end
--
--function objLife(obj)
--	if obj == nil then
--		return 999
--	end
--	local bfb = (obj.nCurrentLife / obj.nMaxLife) * 100
--	return bfb
--end
--
--function life()
--	if this_player == nil then
--		return 999
--	end
--	local bfb = (this_player.nCurrentLife / this_player.nMaxLife) * 100
--	return bfb
--end
--function tlife()
--	if target == nil then
--		return 999
--	end
--	local bfb = (target.nCurrentLife / target.nMaxLife) * 100
--	return bfb
--end
--function ttlife()
--	if ttarget == nil then
--		return 999
--	end
--	local bfb = (ttarget.nCurrentLife / ttarget.nMaxLife) * 100
--	return bfb
--end
--function buff(list)
--	return GetBuffTime(mbuff, list) > 0
--end
--function tbuff(list)
--	return GetBuffTime(tbuffList, list) > 0
--
--end
--function bufftime(id)
--	return GetBuffTime(mbuff, id)
--end
--function skill(skillid)
--	--print(skillid)
--	Cast(skillid, false, false)
--end
--function skillEX(skillid)
--	---��ϵ�ǰ����
--	CastTo(skillid,target,true)
--end
--function dis()
--	return GetDist(target)
--end
--function his()
--	return GetHeight(target)
--end
--function dis2()
--	return GetDist2D(target)
--end
--function ttdis()
--	return GetDist(this_player, ttarget)
--end
--
--function rseeme(seeme)
--	local seemecount, seemet = GetSeeMe(20)
--	return seemecount
--end
--
--function state(desc)
--	local tate = GetState(this_player)
--	if tate~=laststate then
--		laststate = tate
--		print("��ǰ",tate,"Ѱ��",desc)
--	end
--	return string.find(desc, tate)~=nil
--end
--function tstate(desc)
--	if target == nil then
--		return false
--	end
--	local tstate = GetState(target)
--	return string.find(desc, tstate)~=nil
--end
--function mount(desc)
--	local school = GetMount(this_player)
--	--print(school)
--	return string.find(desc, school)~=nil
--end
--function tmount(desc)
--	if tclass == NPC then
--		return false
--	end
--
--	local school = GetMount(target)
--	--print(school)
--	if school == nil then
--		return false
--	end
--	return string.find(desc, school)~=nil
--end
--
--function statep(desc)
--	--print(desc)
--	return GetTypeTime(mbuff, desc) > 0
--end
--
--function ttstatep(desc)
--	if ttarget == nil then
--		return false
--	end
--	return GetTypeTime(ttbuffList, desc) > 0
--end
--
--function tstatep(desc)
--	if target == nil then
--		return false
--	end
--	return GetTypeTime(tbuffList, desc) > 0
--end
--function tstate(desc)
--	if target == nil then
--		return false
--	end
--	local tstate = GetState(target)
--	return string.find(desc, tstate) ~= nil
--end
--function objState(obj, desc)
--	if obj == nil then
--		return false
--	end
--	local tstate = GetState(obj)
--	return string.find(desc, tstate) ~= nil
--end
--function ttstate (desc)
--	if ttarget == nil then
--		return false
--	end
--	local tstate = GetState(ttarget)
--	return string.find(desc, tstate) ~= nil
--end
--function tnostate(desc)
--	if target == nil then
--		return false
--	end
--	local tstate = GetState(target)
--	return string.find(desc, tstate) == nil
--end
--function CastTime(skillid, time)
--	if target == nil then
--		return false
--	end
--	return GetCastTime(target, skillid) > 0 and GetCastTime(target, skillid) <= time
--end
-----Ȩ�ؼ���
--function getWeight()
--	--��ȡ�Լ���buff����
--	--local mbuff = GetBuff(player)
--	--��ȡĿ���buff����
--	--local tbuffList = GetBuff(target)
--
--	local wudi = "��ɽ��|ƽɳ����|����|ɢ��ϼ|����|����|�Ϸ�����|Ц���|̫��|�������|Х�绢|ԡ��|����|ʴ�Ĺ�"
--	local jianshang80 = "9696|7119|368|10307"
--	--���Ӱ�� �ֻ� ����ɽ Ц������
--	local jianshang70 = "8421|10493|1802|384"
--	--���� ����� ���� תǬ��
--	local jianshang60 = "6264|11319|8300|13044|9836|9206|6200"
--	--���໤�� ��Ԩ���� ��ǽ ����� Ħ�� ����֮��  ��Х����
--	local jianshang50 = "9810|6315|10014|8427|9803|6306|2983|1412|3068"
--	--���� ���� ���� �ٻ� ����� ������ ���� �������� ����
--	local jianshang40 = "9873|2953|1187|399|9693|6279|11920|8839|6637|6636|6257|5744|6163|9874|9293|12530|122|6240|12656|9208|8495|6248"
--	--ҷ�� ʥ��֯�� ���� ����� ���Ӱ�� ̰ħ�� ���໤�� ʥ��֯�� ʥ��֯�� ʥ��֯�� ���໤�� ̰ħ�� ����ɽ ɢӰ ��Ӱ ����Ϸˮ ���໤�� ��ˮ�� ˮ鿻�ӯ ����֮�� ���� �ݲй�
--	local jianshang30 = "9510|11457|9895|9745|9896|8302|12286|2177|10051|9510|5641|6262|6160|5806|5705|2813|6247"
--	--�������� ��ˮ ־�� ��ʥ ���� ���� ������ת ���� ��ˮ��Ӱ �������� ��� ���� ���� ���� ���� ��� ��Ӱ
--	local jianshang20 = "2983|7790|7171|6378|6209|5746"
--	--���� ��ս �ƻ� ѱ�� ����� ������Ӱ
--	local jianshang10 = "11272|9904|9763|11344|6333|6610|5750|10024|12411|8424|6540|6337|6237|5770|4479|6113"
--	--���� ��Ȫ ���� ���� �Ͻ���ӡ �ݺ� ��ȥ�� ��ŵ� ���� ����Ϸˮ �ᶨ ��ɽ �껤 ʥӿ �ҽ� �۳� ǧ������
--	local miankong = "������|����|ͻ|����|Ц���|��Ԩ|������|��Ծ��Ԩ|�Ƴ��׼�|�̵��׼�|�����׼�|����|����|�������|��Ӱ|����|����|��¥��Ӱ|�麨|����|��Ȼ|���|����֮��|����|Х��|��¥��Ӱ|תǬ��|תǬ��|ʥ��|�������|��Ұ|����|ǧ��׹|����|������|����|������|������|�γ۳�|��̫��|��̫��|�����|�Ƴ��|��������miankong|�����޳�|�����޳�|����|ʯ����|����|����|����Χ|����|̽÷|����|��Ӱ|����|����|�ٻ�|��������|��ǽ|������Ⱥ|ǧ������|����|ǧ��|�޾�|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|����|����|��������|����|���|ˮ���޼�|�۹�|ʴ�Ĺ�|��Ȫ��Ծ|��Ӱ|�ɹ�|���߿���|��������|��Ӱ"
--	local shanbi80 = "10619|9846|9783"
--	--����|�������� ȵ̤֦
--	local shanbi60 = "6434|9783|5668|9736"
--	--����ң ȵ̤֦ �紵�� �ȱ�Ը
--
--	local shanbi50 = "2065|6299|8866|677"
--	--��ϡ�� ������� ȵ̤֦ ȵ̤֦
--	local shanbi40 = "6174|4028|10618"
--	--���� ʥ���� ����
--	local shanbi30 = "4931|6146"
--	--���� ����
--	local shanbi20 = "4710|6142|3310|948"
--	--���� ���� ���� �����������
--	local shanbi10 = "857|10465|6289|10617"
--	--���� ����̿� �ȱ� ����
--
--	local fengnei = { "���Զ���|����ʽ|����ָ|����ҫ|������Х|÷����|����|�Х����|�Х�ݲ�|�Х����|�Х����|����|�������|��Ĭ|������ŭ" }
--	local chenmo = "����|���ɾ���|��������|��Ĭ|���ɾ���|ֹϢ|����|��Ĭ|����|����ͨ��|����"
--	local jianliao = "���|����|Ϣ��|���Ӱ��|��һ|�ܻ�|������|����|��������|������|����|Ы��|��ӽ�ɳ|��Ϣ|�̳�|�������|����ݲ�|��������|����|���Ӱ��"
--	local jidao = { "����ع�|̤������|����" }
--	local suozu = { "����|����|����ع�|���Ǽ�|����|����|����|Ӱ��|����ع��|������|����|��|�巽�о�|���|����|̫��ָ|����|��ҹ����|������Ӱ|����|ʥЫ�׼�|���|��צ|��ȸ��|����|�����׼�|Ӱ��|�������|����ݲ�|��������|�巽�о�|���Ż���|�¹�����|����|ֹˮ|Ӱ��|����" }
--	local dingshen = { "����|���|����|����|����|����|�������|��Ӱ|�������|��ҹ����|˿ǣ|�ù�|筴�����|����|ͬ��|����|̫��ָ|���|��������|��������|ܽ�ز���|���ǹ���|����|�ù�|����|��������|�������" }
--	local yunxuan = { "ѣ��|ǧ��׹|�ù�|����ع�|����|����|��ľ����|��������|����|����|����|����ң|������ħ��|�ùⲽ|����|���|�ƻ�|��ħ|��ҹ����|����|������|��Ӱ|��������|����|Ы�Ķ���|Ы�Ŀݲ�|Ы������|�ϻ��|����|�׹��ɽ|Σ¥|����|��ͷһ��|��ע|�Ƽ���|Ы����|����|��ʨ�Ӻ�|���̽Կ�|ͻ|ս��ѣ��|׷��|�ս�|����ƾ�|��" }
--	local jiaoxie = "����|ϼ��|��η����|��е"
--	local youxian3 = { "�����", "������", "��֪" }
--	local youxian2 = { "Ī��", "��Ӱʥ��", "�����", "���޹��", "��Ѫս��", "��ϼ��", "Ц����" }
--	local youxian1 = { "�뾭�׵�", "�����ľ�", "̫�齣��", "���ľ�" }
--
--	local weight = 10
--	--OutputinGame("---------------------------------")
--	if GetBuffTime(tbuffList, wudi) > 0 then
--		weight = weight + 100
--	end
--	if GetBuffTime(tbuffList, jianshang80) > 0 then
--		weight = weight + 8
--		--OutputinGame("jianshang80")
--	end
--	if GetBuffTime(tbuffList, jianshang70) > 0 then
--		weight = weight + 7
--		--OutputinGame("jianshang70")
--	end
--	if GetBuffTime(tbuffList, jianshang60) > 0 then
--		weight = weight + 6
--		--OutputinGame("jianshang60")
--
--	end
--	if GetBuffTime(tbuffList, jianshang50) > 0 then
--		weight = weight + 5
--		--OutputinGame("jianshang50")
--	end
--	if GetBuffTime(tbuffList, jianshang40) > 0 then
--		weight = weight + 4
--		--OutputinGame("jianshang40")
--	end
--	if GetBuffTime(tbuffList, jianshang30) > 0 then
--		weight = weight + 3
--		--OutputinGame("jianshang30")
--	end
--	if GetBuffTime(tbuffList, jianshang20) > 0 then
--		weight = weight + 2
--		--OutputinGame("jianshang20")
--	end
--	if GetBuffTime(tbuffList, jianshang10) > 0 then
--		weight = weight + 1
--		--OutputinGame("jianshang10")
--	end
--	--if GetBuffTime(tbuffList, shanbi80) > 0 then
--	--	weight = weight + 8
--	--	--OutputinGame("shanbi80")
--	--end
--	--if GetBuffTime(tbuffList, shanbi60) > 0 then
--	--	weight = weight + 6
--	--	--OutputinGame("shanbi60")
--	--end
--	--if GetBuffTime(tbuffList, shanbi50) > 0 then
--	--	weight = weight + 5
--	--	--OutputinGame("shanbi50")
--	--end
--	--if GetBuffTime(tbuffList, shanbi40) > 0 then
--	--	weight = weight + 4
--	--	--OutputinGame("shanbi40")
--	--end
--	--if GetBuffTime(tbuffList, shanbi30) > 0 then
--	--	weight = weight + 3
--	--	--OutputinGame("shanbi30")
--	--end
--	--if GetBuffTime(tbuffList, shanbi20) > 0 then
--	--	weight = weight + 2
--	--	--OutputinGame("shanbi20")
--	--end
--	--if GetBuffTime(tbuffList, shanbi10) > 0 then
--	--	weight = weight + 1
--	--	--OutputinGame("shanbi10")
--	--end
--	--if GetBuffTime(tbuffList,miankong) then
--	--    weight = weight + 4
--	--    --OutputinGame("shanbi10")
--	--end
--	--if GetBuffTime(tbuffList,jiaoxie) then
--	--	weight = weight -3
--	--	--OutputinGame("shanbi10")
--	--end
--	--if tstate("����|ѣ��|����|����|��ֱ") then
--	--	weight = weight -3
--	--end
--
--
--	--if tstatep("���") then		--���Ŀ��ɿ���
--	--    weight= weight +5
--	--end
--	if GetBuffTime(tbuffList, jianliao) > 0 then
--		weight = weight - 3
--		--OutputinGame("shanbi10")
--	end
--	--if tstatep("�з��Ṧ") then		--���Ŀ��ɿ���
--	--    weight= weight -3
--	--end
--	--if GetBuffTime(tbuffList,chenmo) then
--	--	weight = weight -3
--	--	--OutputinGame("shanbi10")
--	--end
--	if tlife() < 10 then
--		weight = weight - 10
--	end
--	if tlife() >= 10 and tlife() < 20 then
--		weight = weight - 9
--	end
--	-- Output("5")
--	if tlife() >= 20 and tlife() < 30 then
--		weight = weight - 8
--	end
--	-- Output("6")
--	if tlife() >= 30 and tlife() < 40 then
--		weight = weight - 7
--	end
--	-- Output("7")
--	if tlife() >= 40 and tlife() < 50 then
--		weight = weight - 6
--	end
--	-- Output("8")
--	if tlife() >= 50 and tlife() < 60 then
--		weight = weight - 5
--	end
--	if tlife() >= 60 and tlife() < 70 then
--		weight = weight - 4
--	end
--	if tlife() >= 70 and tlife() < 80 then
--		weight = weight - 3
--	end
--	if tlife() >= 80 and tlife() < 90 then
--		weight = weight - 2
--	end
--	if tlife() >= 90 and tlife() < 100 then
--		weight = weight - 1
--	end
--
--	return weight
--end
--
--
--
--
--
----function duobi()
----	local jineng= {"������" , "������" , "����" , "ǧ��׹" , "��" , "���ǹ���" , "��Ծ��Ԩ" , "��ս��Ұ" , "����ͷ" , "����" , "ͻ" , "��������" , "��Ԩ��ɷ" , "������ʽ" , "����ع�" , "�ϻ��" , "����" , "����"}
----	for key, value in ipairs(jineng)
----	do
----		if rlast(value, "�ж�", 1) then
----			return true
----		end
----		if isme() and tlast(value, 1) then			--���Ŀ���Ŀ������
----			return true
----		end
----	end
----	return false
----end
-----��еʱ��
--function jiaoxieTime()
--	local time = GetTypeTime(tbuffList, "��е")
--	if time then
--		return time
--	end
--	return 0
--end
-----ѣ��ʱ��
--function yunxuanTime()
--	local time = GetTypeTime(tbuffList, "ѣ��")
--	if time then
--		return time
--	end
--	return 0
--end
-----����ʱ��
--function dingshenTime()
--	local time = GetTypeTime(tbuffList, "����")
--	if time then
--		return time
--	end
--	return 0
--end
-----����ʱ��
--function suozuTime()
--	local time = GetTypeTime(tbuffList, "����")
--	if time then
--		return time
--	end
--	return 0
--end
-----����ʱ��
--function jidaoTime()
--	local time = GetTypeTime(tbuffList, "����")
--	if time then
--		return time
--	end
--	return 0
--end
-----����ʱ��
--function jianliaoTime()
--	local time = GetTypeTime(tbuffList, "����")
--	if time then
--		return time
--	end
--	return 0
--end
-----����ʱ��
--function fengneiTime()
--	local time = GetTypeTime(tbuffList, "����")
--	if time then
--		return time
--	end
--	return 0
--end
-----��Ĭʱ��
--function chenmoTime()
--	local time = GetTypeTime(tbuffList, "��Ĭ")
--	if time then
--		return time
--	end
--	return 0
--end
--
--function cdEX(skill)
--	---ͨ���Ѿ��ͷŵļ���ʱ�����жϼ����Ƿ�cd
--	--if skill()
--	--print(skill,GetSkillSCD(skill))
--	return GetSkillSCD(skill) > 0
--end
--function cdEX2(skill)
--	---���ܼ����ж�
--	return GetSkillCN(skill)==0
--end
--
--function kongzhiTimeEX(time)
--	--print(time)
--	return dingshenTime() >= time or yunxuanTime() >= time or jidaoTime() >= time
--end
--function jiekongTimeEX(time)
--	return (dingshenTime() > 0 and dingshenTime() < time) or (yunxuanTime() > 0 and yunxuanTime() < time) or (jidaoTime() > 0 and jidaoTime() < time)
--end
--function jiekongTimeEX2(time)
--	---�ӿ�ʱ�䲻������
--	return (dingshenTime() > 0 and dingshenTime() < time) or (yunxuanTime() > 0 and yunxuanTime() < time)
--end
--function jiekongTimeEX3(time)
--	---�ӿ�ʱ��ֻ�ж���
--	return (dingshenTime() > 0 and dingshenTime() < time)
--end
-----���ܶ����ܵ�ʱ��
--function noSkillTime(time)
--	return (fengneiTime() > 0 and fengneiTime() > time) or (chenmoTime() > 0 and chenmoTime() > time) or (jiaoxieTime() > 0 and jiaoxieTime() > time)
--end
--function noskill()
--	return fengneiTime() > 0 or chenmoTime() > 0 or jiaoxieTime() > 0
--
--end
--function jiekong()
--	if (GetSkillGCD("��������") + gcdsj) > dingshenTime() then
--		return false
--	end
--	if (GetSkillGCD("��������") + gcdsj) > yunxuanTime() then
--		return false
--	end
--	if (GetSkillGCD("��������") + gcdsj) > jidaoTime() then
--		return false
--	end
--	return true
--end


function daiyuanjiqu()
	---���Ҽ���
	if dis()>25 or state("վ��")== false then
		return false
	end
	return true
end
function jianqichangjiang()
	---��������
	if dis()>20 or state("վ��") then
		return false
	end
	return true
end
function jianpoxukong(weight)
	---�������
	if dis()>20 or cdEX("�������")  then
		return false
	end
	if GetBuffStack(tbuffList,"����",true)< 3 then
		return true
	end
	if weight <5 and (noskilltime(0.5) or noskill()==false) then
		return true
	end
	return false
end
function jianyingliuhen(weight)
	---��Ӱ����
	if dis()>8 or cdEX("��Ӱ����") or tstatep("����")  then
		return false
	end
	---����ڵ�����-------------------------------
	if target ~= nil and CastTime(2226, 4) then
		return true
	end
	if tbuff("����|ҷ��") then
		return true
	end
	------------------------------------------------
	if GetBuffStack(tbuffList,"����",true)>2 then
		return false
	end
	if GetBuffStack(tbuffList,"����",true) == 2 then
		return true
	end
	if weight <5 then
		return true
	end
	return false
end
function dicanlongxiang()
	---��������
	if dis()>8 or cdEX("��������") or tstatep("���")  then
		return false
	end
	if tnostate("���") and tstate("����|����") and jiekong() and jiekongTimeEX3(0.5) then
		return true
	end
	if tnostate("���") and tstate("����|����|ѣ��|����") == false then
		return true
	end
	return false
end
function jianghainingguang(weight)
	---��������
	if dis()>24 then
		return false
	end
	
	if GetBuffStack(tbuffList,"����",true)>2 and weight<10 then
		return true
	end
	return false
end
function tiandidiang()
	---��صͰ�
	if cdEX("��صͰ�") or statep("�޵�") or statep("����") or statep("������") or statep("������") or statep("����") or statep("������") or statep("����") or statep("��������") then
		return false
	end
	if life() <= 50 then
		return true
	end
	return false
end
function shuixiehuaying()
	---ˮ鿻�ӯ
	if GetSkillCD("ˮ鿻�ӯ") or statep("���") then
		return false
	end
	if state("����|ѣ��|����|����|��ֱ") then
		print("ˮ鿻�ӯ")
		shuixieFind()
		return true
	end
return false
end
function shuixieFind()
	---Ѱ���ʺϵ�Ŀ���ˮ鿻�ӯ(20����������Ŀ��)
	local players = GetAllPlayer()
	local lastTar
	local lastDis  = 100  ---��һ��Ŀ��ľ���
	for k,v in ipairs(players) do	--v����Ҷ���
		local this_dis = GetDist(this_player, v)
		if IsDangerArea(v, "�ж�")==false and objState(v, "����")==false  and this_dis <20 and IsVisible(this_player, v) and v~=this_player then	--���������
			if this_dis < lastDis then
				lastDis = this_dis
				lastTar = v
			end
		end
	end
	if lastTar ~=nil then
		CastTo("ˮ鿻�ӯ", lastTar, true)
	end
end
function leitingzhennu(weight)
	---������ŭ
	if cdEX("������ŭ") then
		return false
	end
	if weight <=5 then
		local naima = FindPlayer(17, "�뾭�׵�|�����ľ�|�����|��֪", "�ж�")
		if naima and naima~=target and objState(naima,"ѣ��|����|���")==false then
			CastTo("������ŭ", naima,true)
		end
	end
	return false
end
function fanyinjijie(weight)
	---��������
	if cdEX2("��������") or buff("��������") then
		return false
	end
	if weight <=8 and GetBuffStack(tbuffList,"����",true)==2 then
		return true
	end
	if weight <=5 then
		return true
	end
	return false
end
function poluomen()
	---������(����)
	if cdEX("������") or buff("����") then
		return false
	end
	return true
end
function dienongzu(weight)
	---��Ū��
	if cdEX2("��Ū��") or statep("���") then
		return false
	end
	if state("����|ѣ��|����|����|��ֱ") and (life()<80 or weight<=8) then
		return true
	end
	if life()<60 and statep("����")==false then
		return true
	end
	return false
end
function quetazhi(weight)
	---ȵ̤֦
	if cdEX2("ȵ̤֦") or statep("���")  then
		return false
	end
	if state("����|ѣ��|����|����|��ֱ") and (life()<80 or weight<=8) then
		return true
	end
	if statep("�޵�") or statep("����") or statep("������") or statep("������") or statep("����") or statep("������") or statep("����") or statep("��������") then
		return false
	end
	if life()<=50 then
		return true
	end
	return false
end
function jianzhuanliuyun()
	---��ת����(��ɢ)
	if dis()>20 then
		return false
	end
	--��Ԫ���(�о����Բ�Ҫ) ����(ͬ��) ���ľ��� ���� ��Ū�� ����
	local qusan="680|681|112|631|213|673"
	if HaveTalent("��ת����") == false or cdEX("��ת����") then
		return false
	end
	if tbuff(qusan) then
		return true
	end
	return false
end
function jianzhuanliuyun2()
	---��ת����(��ɢ)
	if dis()>20 then
		return false
	end
	--��Ԫ���(�о����Բ�Ҫ) ����(ͬ��) ���ľ��� ���� ��Ū�� ����
	local qusan="755|684|6174|112|122|��������|������|����"
	if HaveTalent("��ת����") == false or cdEX("��ת����") then
		return false
	end
	if tbuff(qusan) then
		return true
	end
	return false
end
function jianxintongming(weight)
	---����ͨ��
	if cdEX("����ͨ��") or dis()>20  then
		return false
	end
	if weight <=6 then
		local naima = FindPlayer(20, "�뾭�׵�|�����ľ�|�����|��֪", "�ж�")
		if naima~=nil and tmount("�����|�뾭�׵�|��֪|�����ľ�")==false then
			if  naima~=target and objState(naima,"ѣ��|����|���")==false then
				CastTo("����ͨ��", naima,true)
				return false
			end
		else
			return true
		end
	end
	return false
end

function shuyunzhuyue()
	---��������
	if cdEX("��������") or not GetOption("�Զ���8�߸���") then
		return false
	end
	if dis2()>18 then
		return true
	end
	return false
end


function DPS(weight)

	if shuyunzhuyue() then
		CastTo("��������",target,false)
	end
	---��صͰ�
	if tiandidiang() then
		print("��صͰ�")
		Cast("��صͰ�",true,true)
	end
	---��������
	if fanyinjijie(weight) then
		print("��������")
		Cast("��������",true,true)
	end
	---ˮ鿻�ӯ
	if shuixiehuaying() then
		print("ˮ鿻�ӯ")
		skill("ˮ鿻�ӯ")
	end
	---��Ū��
	if dienongzu(weight) then
		print("��Ū��")
		Cast("��Ū��",true,true)
		return 1
	end
	---ȵ̤֦
	if quetazhi(weight) then
		print("ȵ̤֦")
		Cast("ȵ̤֦",true,true)
		return 1
	end
	---����ͨ��
	if jianxintongming(weight) then
		--skillEX("����ͨ��")
		--print("����ͨ��")
	end
	---��ת����
	if jianzhuanliuyun2() then
		print("��ת����")
		skill("��ת����")
	end
	---��������
	if jianghainingguang(weight) then
		print("��������")
		skillEX("��������")
	end
	---������ŭ
	if leitingzhennu(weight) then
		skillEX("������ŭ")
	end
	---��������
	if dicanlongxiang() then
		skillEX("��������")
	end
	---��Ӱ����
	if jianyingliuhen(weight) then
		skillEX("��Ӱ����")
	end
	---�������
	if jianpoxukong(weight) then
		skill("�������")
		return 1
	end
	---��ת����
	if jianzhuanliuyun() then
		print("��ת����")
		skill("��ת����")
	end
	---���Ҽ���
	if daiyuanjiqu() then
		skill("���Ҽ���")
	end
	---��������
	if jianqichangjiang() then
		skill("��������")
	end
	---������
	if poluomen() then
		Cast("������",true)
	end
end
function toBack()
	---�Զ��Ʊ�
	if GetDist(target)<2 then
		if IsBack(target) then
			MoveForwardStop()
		else
			MoveForwardStart()
		end
	end
end


function findTarget(outTarger)---�Ƿ��ų���ǰĿ��
---Ѱ���ʺϵ�Ŀ��
	local players = GetAllPlayer()
	local lastTar
	local lastWeight  = 100
	for k,v in ipairs(players) do	--v����Ҷ���
		local weight = 10
		if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "����")==false  and IsDangerArea(v, "�ж�")==false and GetDist(this_player, v) <20 and IsVisible(this_player, v) and objNotWudi(v) then	--���������
			if outTarger==false or v ~= target then	---�����Ҫ�ų���ǰĿ��
				if objLife(v) ==0 or objState(v,"����")then
					weight = weight+ 100
				end
				if objLife(v)>80 and objLife(v)<=90 then
					weight = weight - 1
				end
				if objLife(v)>70 and objLife(v)<=80 then
					weight = weight - 2
				end
				if objLife(v)>60 and objLife(v)<=70 then
					weight = weight - 3
				end
				if objLife(v)>50 and objLife(v)<=60 then
					weight = weight - 4
				end
				if objLife(v)>40 and objLife(v)<=50 then
					weight = weight - 5
				end
				if objLife(v)>30 and objLife(v)<=40 then
					weight = weight - 6
				end
				if objLife(v)>20 and objLife(v)<=30 then
					weight = weight - 7
				end
				if objLife(v)>10 and objLife(v)<=20 then
					weight = weight - 8
				end
				if objLife(v)>0 and objLife(v)<=10 then
					weight = weight- 9
				end
				if objState(v,"ѣ��|����|��ֱ|����") then
					weight = weight - 3
				end
				if lastWeight>weight then
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
	local lastTar =nil
	local lastWeight  = 100
	for k,v in ipairs(players) do	--v����Ҷ���
		local weight = 10
		if IsPlayer(v.dwID)  and IsEnemy(v) and objState(v, "����")==false  and IsDangerArea(v, "�ж�")==false  and GetDist(this_player, v) <20 and IsVisible(this_player, v) and objLife(v)<hp and objNotWudi(v) then	--���������
			if objLife(v) ==0 or objState(v,"����")then
				weight = weight+ 100
			end
			if objLife(v)>80 and objLife(v)<=90 then
				weight = weight - 1
			end
			if objLife(v)>70 and objLife(v)<=80 then
				weight = weight - 2
			end
			if objLife(v)>60 and objLife(v)<=70 then
				weight = weight - 3
			end
			if objLife(v)>50 and objLife(v)<=60 then
				weight = weight - 4
			end
			if objLife(v)>40 and objLife(v)<=50 then
				weight = weight - 5
			end
			if objLife(v)>30 and objLife(v)<=40 then
				weight = weight - 6
			end
			if objLife(v)>20 and objLife(v)<=30 then
				weight = weight - 7
			end
			if objLife(v)>10 and objLife(v)<=20 then
				weight = weight - 8
			end
			if objLife(v)>0 and objLife(v)<=10 then
				weight = weight- 9
			end
			if objState(v,"ѣ��|����|��ֱ|����") then
				weight = weight - 3
			end
			if lastWeight>weight then
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
	local lastTar
	local lastWeight  = 100
	for k,v in ipairs(players) do	--v����Ҷ���
		local weight = 10
		if IsPlayer(v.dwID)  and IsEnemy(v) and objState(v, "����")==false  and IsDangerArea(v, "�ж�")==false and GetDist(this_player, v) <range and IsVisible(this_player, v) and objNotWudi(v) then	--���������
			if objLife(v) ==0 or objState(v,"����")then
				weight = weight+ 100
			end
				if objLife(v)>80 and objLife(v)<=90 then
					weight = weight - 1
				end
				if objLife(v)>70 and objLife(v)<=80 then
					weight = weight - 2
				end
				if objLife(v)>60 and objLife(v)<=70 then
					weight = weight - 3
				end
				if objLife(v)>50 and objLife(v)<=60 then
					weight = weight - 4
				end
				if objLife(v)>40 and objLife(v)<=50 then
					weight = weight - 5
				end
				if objLife(v)>30 and objLife(v)<=40 then
					weight = weight - 6
				end
				if objLife(v)>20 and objLife(v)<=30 then
					weight = weight - 7
				end
				if objLife(v)>10 and objLife(v)<=20 then
					weight = weight - 8
				end
				if objLife(v)>0 and objLife(v)<=10 then
					weight = weight- 9
				end
				if objState(v,"ѣ��|����|��ֱ|����") then
					weight = weight - 3
				end
				if lastWeight>weight then
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
	if target == nil or objState(target,"����") then
		findTargetforRange(30)
		--print("Ŀ������")
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
	--if cdEX("̽÷") ==false and IsEnemy(target) then  ---���̽÷ûCD ����Ŀ���ǵж�
	--	local target
	--	--���������Ա
	--	for k,v in ipairs(GetAllMember()) do
	--		if IsPlayer(v.dwID) and GetDist(this_player, v) <20 and IsVisible(this_player, v) and v.IsHaveBuff(9695, 0)==false and v.IsHaveBuff(10212, 0)==false then
	--			local tstate = GetState(v)
	--			if string.find("ѣ��|����|����|��ֱ", tstate) and objLife(v)<90 then
	--				--�ȱ��浱ǰ����
	--				CastTo("̽÷",v,true)
	--				print("��̽÷")
	--				return 1
	--			end
	--		end
	--	end
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
	---�ϴ��л�Ŀ�����5��ŻỻĿ��
	if weight>=15 and (GetTickCount() - lastSelectTime)>5000 then
		print("Ŀ����˹���")
		lastSelectTime = GetTickCount()
		findTarget(true)
	end

	--if IsDangerArea(target, "�ж�") and (GetTickCount() - lastSelectTime)>5000 then
	--	print("Σ�������л�Ŀ��")
	--	lastSelectTime = GetTickCount()
	--	findTarget(true)
	--end
	if tlife() >40 then
		findTargetforHp(40)
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
		TurnTo(target)
        if GetOption("�Զ���8�߸���") then
            if dis()>8 and GetSkillSCD("�������")<2 then
                move= true
                MoveForwardStart()
            end
            if dis()>22 then
                move= true

                MoveForwardStart()
            end
            if dis()<=8 and move then
                MoveForwardStop()
            end
        end

		--toBack()
		--if GetHeight(player)>0 then
		--	Jump()
		--end
		--if ota("������ɽ") then  --����糵�Ͳ�ִ�к����
		--	return
		--end
		DPS(weight)
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