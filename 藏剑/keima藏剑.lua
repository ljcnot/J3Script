local skillCD = {
	["�Ʒ����"] = 4,
	["�紵��"] = 25,
	["����"] = 12,
	["����"] = 15,
	["ϼ����ʯ"] = 60,
	["������ϼ"] = 15,
	["��Ȫ����"] = 24,
	["������"] = 15,
	["ƽ������"] = 8,
	["�����´�"] = 8,
	["��Ȫ��Ծ"] = 30
}
local gcdsj=1.44 --gcdʱ��

local lastWeight =0
---Ȩ�ؼ���
function getWeight()

	local wudi = "��ɽ��|ƽɳ����|����|ɢ��ϼ|����|����|�Ϸ�����|Ц���|̫��|�������|Х�绢|ԡ��|����|ʴ�Ĺ�"
	local jianshang80 = "9696|7119|367|368|10307|10414|11313|14105|837|1173|1557|1870"
	--���Ӱ�� �ֻ� ����ɽ Ц������ �붨 ���ƻ��� �������� ���
	local NGjianshang80 = "12041"
	local WGjianshang80 = "12041"
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

	local fengnei={"���Զ���|����ʽ|����ָ|����ҫ|������Х|÷����|����|�Х����|�Х�ݲ�|�Х����|�Х����|����|�������|��Ĭ|������ŭ"}
	local chenmo="����|���ɾ���|��������|��Ĭ|���ɾ���|ֹϢ|����|��Ĭ|����|����ͨ��|����"
	local jianliao="���|����|Ϣ��|���Ӱ��|��һ|�ܻ�|������|����|��������|������|����|Ы��|��ӽ�ɳ|��Ϣ|�̳�|�������|����ݲ�|��������|����|���Ӱ��"
	local jidao={"����ع�|̤������|����"}
	local suozu={"����|����|����ع�|���Ǽ�|����|����|����|Ӱ��|����ع��|������|����|��|�巽�о�|���|����|̫��ָ|����|��ҹ����|������Ӱ|����|ʥЫ�׼�|���|��צ|��ȸ��|����|�����׼�|Ӱ��|�������|����ݲ�|��������|�巽�о�|���Ż���|�¹�����|����|ֹˮ|Ӱ��|����"}
	local dingshen={"����|���|����|����|����|����|�������|��Ӱ|�������|��ҹ����|˿ǣ|�ù�|筴�����|����|ͬ��|����|̫��ָ|���|��������|��������|ܽ�ز���|���ǹ���|����|�ù�|����|��������|�������"}
	local yunxuan={"ѣ��|ǧ��׹|�ù�|����ع�|����|����|��ľ����|��������|����|����|����|����ң|������ħ��|�ùⲽ|����|���|�ƻ�|��ħ|��ҹ����|����|������|��Ӱ|��������|����|Ы�Ķ���|Ы�Ŀݲ�|Ы������|�ϻ��|����|�׹��ɽ|Σ¥|����|��ͷһ��|��ע|�Ƽ���|Ы����|����|��ʨ�Ӻ�|���̽Կ�|ͻ|ս��ѣ��|׷��|�ս�|����ƾ�|��"}
	local jiaoxie="����|ϼ��|��η����|��е"
	local youxian3={"�����","������","��֪"}
	local youxian2={"Ī��","��Ӱʥ��","�����","���޹��","��Ѫս��","��ϼ��","Ц����"}
	local youxian1={"�뾭�׵�","�����ľ�","̫�齣��","���ľ�"}

	local weight = 10
	--OutputinGame("---------------------------------")
	if tbuff(wudi) then
		weight = weight + 100
	end
	if tbuff(jianshang80) then
		weight = weight + 8
		--OutputinGame("jianshang80")
	end
	if tbuff(jianshang70) then
		weight = weight + 7
		--OutputinGame("jianshang70")
	end
	if tbuff(jianshang60) then
		weight = weight + 6
		--OutputinGame("jianshang60")

	end
	if tbuff(jianshang50) then
		weight = weight + 5
		--OutputinGame("jianshang50")
	end
	if tbuff(jianshang40) then
		weight = weight + 4
		--OutputinGame("jianshang40")
	end
	if tbuff(jianshang30) then
		weight = weight + 3
		--OutputinGame("jianshang30")
	end
	if tbuff(jianshang20) then
		weight = weight + 2
		--OutputinGame("jianshang20")
	end
	if tbuff(jianshang10) then
		weight = weight + 1
		--OutputinGame("jianshang10")
	end
	if tbuff(shanbi80) then
		weight = weight + 8
		--OutputinGame("shanbi80")
	end
	if tbuff(shanbi60) then
		weight = weight + 6
		--OutputinGame("shanbi60")
	end
	if tbuff(shanbi50) then
		weight = weight + 5
		--OutputinGame("shanbi50")
	end
	if tbuff(shanbi40) then
		weight = weight + 4
		--OutputinGame("shanbi40")
	end
	if tbuff(shanbi30) then
		weight = weight + 3
		--OutputinGame("shanbi30")
	end
	if tbuff(shanbi20) then
		weight = weight + 2
		--OutputinGame("shanbi20")
	end
	if tbuff(shanbi10) then
		weight = weight + 1
		--OutputinGame("shanbi10")
	end
	--if tbuff(miankong) then
	--    weight = weight + 4
	--    --OutputinGame("shanbi10")
	--end
	--if tbuff(jiaoxie) then
	--	weight = weight -3
	--	--OutputinGame("shanbi10")
	--end
	--if tstate("����|ѣ��|����|����|��ֱ") then
	--	weight = weight -3
	--end
	--[[֧���жϵļ��ϣ�
����ء�����ء��ޱ������б����������ˡ������ˡ��޳�Ĭ���г�Ĭ
�޼��ˡ��м��ˡ������ܡ������ܡ��޼��ơ��м��ơ��޼��١��м���
�޷��ڡ��з��ڡ��޷��Ṧ���з��Ṧ���ɿ��ơ����ж����Ǳ���
������ڣ�������ڣ������ƣ������ƣ���������������
--]]

	--if tstatep("�����") then		--���Ŀ��ɿ���
	--    weight= weight +5
	--end
	if tbuff(jianliao) then
		weight = weight -3
		--OutputinGame("shanbi10")
	end
	--if tstatep("�з��Ṧ") then		--���Ŀ��ɿ���
	--    weight= weight -3
	--end
	--if tbuff(chenmo) then
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

function dis()
	local target, tclass = GetTarget(player)
	return GetDist(target)
end

function duobi()
	local jineng= {"������" , "������" , "����" , "ǧ��׹" , "��" , "���ǹ���" , "��Ծ��Ԩ" , "��ս��Ұ" , "����ͷ" , "����" , "ͻ" , "��������" , "��Ԩ��ɷ" , "������ʽ" , "����ع�" , "�ϻ��" , "����" , "����"}
	for key, value in ipairs(jineng)
	do
		if rlast(value, "�ж�", 1) then
			return true
		end
		if isme() and tlast(value, 1) then			--���Ŀ���Ŀ������
			return true
		end
	end
	return false
end
---��еʱ��
function jiaoxieTime()
	local jiaoxie = { "����", "ϼ��", "��η����", "��е" }
	local time = 0
	for key, value in ipairs(jiaoxie)
	do
		local thisTime = tbufftime(value)
		if thisTime > time then
			time = thisTime
		end
	end
	return time
end
---ѣ��ʱ��
function yunxuanTime()
	local yunxuan = { "ѣ��", "ǧ��׹", "�ù�", "����ع�", "����", "����", "��ľ����", "��������", "����", "����", "����", "����ң", "������ħ��", "�ùⲽ", "����", "���", "�ƻ�", "��ħ", "��ҹ����", "����", "������", "��Ӱ", "��������", "����", "Ы�Ķ���", "Ы�Ŀݲ�", "Ы������", "�ϻ��", "����", "�׹��ɽ", "Σ¥", "����", "��ͷһ��", "��ע", "�Ƽ���", "Ы����", "����", "��ʨ�Ӻ�", "���̽Կ�", "ͻ", "ս��ѣ��", "׷��", "�ս�", "����ƾ�", "��" }
	local time = 0
	for key, value in ipairs(yunxuan)
	do
		local thisTime = tbufftime(value)
		if thisTime > time then
			time = thisTime
		end
	end
	return time
end
---����ʱ��
function dingshenTime()
	local dingshen = { "����", "���", "����", "����", "����", "����", "�������", "��Ӱ", "�������", "��ҹ����", "˿ǣ", "�ù�", "筴�����", "����", "ͬ��", "����", "̫��ָ", "���", "��������", "��������", "ܽ�ز���", "���ǹ���", "����", "�ù�", "����", "��������", "�������" }
	local time = 0
	for key, value in ipairs(dingshen)
	do
		local thisTime = tbufftime(value)
		if thisTime > time then
			time = thisTime
		end
	end
	return time
end
---����ʱ��
function suozuTime()
	local suozu = { "����", "����", "����ع�", "���Ǽ�", "����", "����", "����", "Ӱ��", "����ع��", "������", "����", "��", "�巽�о�", "���", "����", "̫��ָ", "����", "��ҹ����", "������Ӱ", "����", "ʥЫ�׼�", "���", "��צ", "��ȸ��", "����", "�����׼�", "Ӱ��", "�������", "����ݲ�", "��������", "�巽�о�", "���Ż���", "�¹�����", "����", "ֹˮ", "Ӱ��", "����" }
	local time = 0
	for key, value in ipairs(suozu)
	do
		local thisTime = tbufftime(value)
		if thisTime > time then
			time = thisTime
		end
	end
	return time
end
---��еʱ��
function jidaoTime()
	local jidao = { "����ع�", "̤������", "����" }
	local time = 0
	for key, value in ipairs(jidao)
	do
		local thisTime = tbufftime(value)
		if thisTime > time then
			time = thisTime
		end
	end
	return time
end
---����ʱ��
function jianliaoTime()
	local jianliao = { "���", "����", "Ϣ��", "���Ӱ��", "��һ", "�ܻ�", "������", "����", "��������", "������", "����", "Ы��", "��ӽ�ɳ", "��Ϣ", "�̳�", "�������", "����ݲ�", "��������", "����", "���Ӱ��" }
	local time = 0
	for key, value in ipairs(jianliao)
	do
		local thisTime = tbufftime(value)
		if thisTime > time then
			time = thisTime
		end
	end
	return time
end
---����ʱ��
function fengneiTime()
	local fengnei = { "���Զ���", "����ʽ", "����ָ", "����ҫ", "������Х", "÷����", "����", "�Х����", "�Х�ݲ�", "�Х����", "�Х����", "����", "�������", "��Ĭ", "������ŭ" }
	local time = 0
	for key, value in ipairs(fengnei)
	do
		local thisTime = tbufftime(value)
		if thisTime > time then
			time = thisTime
		end
	end
	return time
end
---��Ĭʱ��
function chenmoTime()
	local chenmo = { "����", "���ɾ���", "��������", "��Ĭ", "���ɾ���", "ֹϢ", "����", "��Ĭ", "����", "����ͨ��", "����" }
	local time = 0
	for key, value in ipairs(chenmo)
	do
		local thisTime = tbufftime(value)
		if thisTime > time then
			time = thisTime
		end
	end
	return time
end


function cdEX(skill)
	---ͨ���Ѿ��ͷŵļ���ʱ�����жϼ����Ƿ�cd
	return explast(skill, skillCD[skill])
end


function kongzhiTimeEX(time)
	return (dingshenTime() >0 and dingshenTime() >= time) or (yunxuanTime() >0 and yunxuanTime() >= time) or (jidaoTime()>0 and jidaoTime() >= time)
end
function jiekongTimeEX(time)
	return  (dingshenTime() >0 and dingshenTime()< time) or (yunxuanTime() >0 and yunxuanTime() < time) or (jidaoTime()>0 and jidaoTime() < time)
end
function jiekongTimeEX2(time)
	---�ӿ�ʱ�䲻������
	return  (dingshenTime() >0 and dingshenTime()< time) or (yunxuanTime() >0 and yunxuanTime() < time)
end
function jiekongTimeEX3(time)
	---�ӿ�ʱ��ֻ�ж���
	return  (dingshenTime() >0 and dingshenTime()< time)
end
---���ܶ����ܵ�ʱ��
function noSkillTime(time)
	return (fengneiTime() >0 and fengneiTime() > time) or (chenmoTime() >0 and chenmoTime() > time) or (jiaoxieTime()>0 and jiaoxieTime() > time)
end
function jiekong()
	if (gcdtime("����")+gcdsj)>dingshenTime() then
		return true
	end
	if (gcdtime("����")+gcdsj)>yunxuanTime() then
		return true
	end
	if (gcdtime("����")+gcdsj)>jidaoTime() then
		return true
	end
	return false
end


function tinglei()
	---����
	if dis()>4 then
		return false
	end
	if buff("����") and rage()>=10 then
		return false
	end
	return true
end

function hupao()
	---��Ȫ����
	if statep("�����")or cdEX("��Ȫ����") then
		return false
	end
	if  rseeme(25) > 0 then
		return true
	end
	if dis()>4 then
		return true
	end
	return false
end
function yuyue()
	---��Ȫ��Ծ
	if dis()>15 then
		return true
	end
	if statep("�����") or buff("��Ȫ����")then
		return false
	end
	if cdEX("��Ȫ����")  and (rseeme(25) > 0 or dis()>8) then
		return true
	end
	return false
end
function yuhongguanri()

	---������
	if dis() <5 or dis()>24 or cdEX("������") then
		return false
	end
	if dis()>=5 then
		return true
	end
	return false
end

function pinghuduanyue()
	---ƽ������
	if dis() >8 or cd("ƽ������") then
		return false
	end
	if dis()>=4 then
		return true
	end
	--if totatype("right") or totatype("left") then
	--	return true
	--end
	return false
end
function pinghuduanyue()
	---�����´�
	if dis() >6 or cd("�����´�") then
		return false
	end
	--if tstatep("�����") then
	--	return true
	--end
	return true
end
function zuiyue()
	---����
	if dis() >6 or cdEX("����") or rage()<10 or tstatep("�����") or (mount("ɽ�ӽ���")and cdEX("����")==false) then
		return false
	end

	if tstate("ѣ��|����") and jiekong() and jiekongTimeEX2(0.5) then
		return true
	end
	if tstatep("�����") and tnostate("����|����|ѣ��|����") then
		return true
	end
	return false
end

function xiaori(weight)
	---Х��
	if mount("��ˮ��") then
		if buff("��Ȫ����") then
			return false
		end
		if rseeme(25)>0 and statep("�����") and cdEX("��Ȫ����") and cdEX("��Ȫ��Ծ") then
			return true
		end
		if rage()>=90 and cdEX("��Ȫ����") and dis()<=4 then
			return true
		end
		if state("����|ѣ��|����|����|��ֱ") and (weight<=8 or life()<=70) then
			return true
		end
		return false
	else
		if rseeme(25)>0 and statep("�����") then
			return true
		end
		---ɽ�ӽ���
		if rage()<10 and cd("ݺ����") then
			return true
		end
		if dis()>8 then
			return true
		end
		return false
	end
end
function yunfeiyuhuang(weight)
	---�Ʒ����
	if rage()<20 then
		return false
	end
	if dis()<=23 and (buff("�ƾ�")) then
		return true
	end
	if dis()>8 then
		return false
	end
    if buff("ҹ��") and (weight<10 or bufftime("ҹ��")<2) then
        return true
    end
	if dis()<=4 and (tstateid()==1 or kongzhiTimeEX(1.75)) then
		return true
	end
	return false
end
function xizhaoleifeng()
	---Ϧ���׷�
	if dis()>8 or rage()<15 then
		return false
	end
	if dis()<=4 and buff("����") then
		return true
	end
	if dis()>4 then
		return true
	end
	return false
end
function heguigushan()
	---�׹��ɽ
	if dis()>21 or rage()<20 then
		return false
	end
	if dis2()>=6 and dis2()<=20 and face()>=0 and face()<=15 then
		return true
	end
	if life()<40 then
		return true
	end
	return false
end
function fenglaiwushan(weight)
	---������ɽ
	if dis()>6 or  rage()<50 then
		return false
	end
	if (kongzhiTimeEX(1.5) or noSkillTime(1.5)) and weight<=8 then
		 return true
	end
	if weight <4 then
		return true
	end
	return false
end
function fengchayunjing(weight)
	---����ƾ�
	if dis()>6 or rage()<10  or tstatep("������") or weight>8 or cdEX("�Ʒ����") then
		return false
	end
	if 	weight>=6 and weight<=8 and buff("����") then
		return true
	end
	if 	weight<=2 then
		return true
	end
	return false
end
function yingmingliu(weight)
	---ݺ����
	if buff("ݺ��")then
		return false
	end
	if rage()<10 and mount("ɽ�ӽ���") then
		return true
	end
	if weight<=6 then
		return true
	end
	return false
end
--[[֧���жϵļ��ϣ�
����ء�����ء��ޱ������б����������ˡ������ˡ��޳�Ĭ���г�Ĭ
�޼��ˡ��м��ˡ������ܡ������ܡ��޼��ơ��м��ơ��޼��١��м���
�޷��ڡ��з��ڡ��޷��Ṧ���з��Ṧ���ɿ��ơ����ж����Ǳ���
������ڣ�������ڣ������ƣ������ƣ���������������
--]]
function quanningyue()
	---Ȫ����
	if buff("��Ȫ����")then
		return true
	end
	-----Ȫ����
	if rseeme(25)==0  then
		return false
	end
	--if life()<80 then
	--	return true
	--end
	return true
end
function yunxisong()
	---��ϡ��
	if rseeme(25)<1 or statep("������|������|�м���") then
		return false
	end
	if life()<=50 then
		return true
	end
	return false
end
function fengchuihe()
	---�紵��
	if cdEX("�紵��") or dis()>6 then
		return false
	end
	if ttnorela("�Ѻ�|����") and ttlife()<80  and ttstatep("�з���") then
		return true
	end
	if ttlife()<50 then
		return true
	end
	if life()<50 then
		return true
	end
	return false
end
function jingtao()
	---����
	if cdEX("����") or dis()>8 or tstatep("�����") then
		return false
	end
	if tstate("����")and tstatep("�����") and jiekong() and jiekongTimeEX3(0.5) then
		return true
	end
	if tstatep("�����") and tnostate("����|����|ѣ��|����") then
		return true
	end
	return false
end
function xieliubaoshi(weight)
	---ϼ����ʯ
	if cdEX("ϼ����ʯ") or dis()>6 then
		return false
	end
	if weight<=6 then
		return true
	end
	return false
end
function tanmei()
	---̽÷
	if dis()>15 and ttdis()>15 then
		return false
	end
	if rela("����") then
		return true
	end
	if ttrela("����") and ttlife()<80 and ttstate("ѣ��|����") then
		return true
	end
	return false
end
function jiuximiyan()
	---��Ϫ����
	if dis()> 4 then
		return false
	end
	return true
end
function songshewenxia(weight)
	---������ϼ
	if dis()>20 or cdEX("������ϼ") then
		return false
	end
	-- �ڹ��б�"ϴ�辭","�׽","��ϼ��","̫�齣��","������","�뾭�׵�","��Ѫս��","������","�����ľ�","���ľ�","��ˮ��","ɽ�ӽ���","����","�����","�����","���޹��","��Ӱʥ��","����������","������","��ɽ��","Ц����","Ī��","��֪","������"

	if tmount("�����|���޹��|Ī��|��֪|�躣��")then
		--if buff("����") then
		--	return true
		--end
		if dis()>8 then
			return true
		end
		if weight<5 then
			return true
		end
	else
		if buff("����") then
			return true
		end
		if dis()>8 then
			return true
		end

		if weight<8 then
			return true
		end
	end

	return false
end

function wenshui(weight)
	---��ˮ��
	 kotabreak(5, 24, "������")

	---����
	if zuiyue() then
		skill("����")
		return 1
	end
	---Х��
	if xiaori(weight) then
		skill("Х��")
	end
	---��Ȫ����
	if hupao() then
		skill("��Ȫ����")
	end
	---��Ȫ��Ծ
	if yuyue() then
		skill("��Ȫ��Ծ")
	end
	---������
	if yuhongguanri() then
		skill("������")
	end
	---ƽ������
	if pinghuduanyue() then
		skill("ƽ������")
	end
	if pinghuduanyue() then
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
	if zuiyue() then
		skill("����")
		return 1
	end
	if jingtao() then
		skill("����")
		return 1
	end
	if xieliubaoshi(weight)then
		skill("ϼ����ʯ")
	end
	---������ɽ
	if fenglaiwushan(weight) then
		skill("������ɽ")
	end
    if songshewenxia(weight) then
        skill("������ϼ")
    end
	---�׹��ɽ
	if heguigushan() then
		skill("�׹��ɽ")
	end
	---�Ʒ����
	if  yunfeiyuhuang(weight) then
		skill("�Ʒ����")
		return 1
	end
    ---Ϧ���׷�
    if xizhaoleifeng() then
        skill("Ϧ���׷�")
    end
	---Х��
	if xiaori() then
		skill("Х��")
	end


	if fengchayunjing(weight) then
		skill("����ƾ�")
	end

	---����
	if tinglei() then
		skill("����")
	end
end



function DPS(weight)
	---ݺ����
	if yingmingliu(weight) then
		skill("ݺ����")
	end
	---Ȫ����
	if quanningyue() then
		skill("1666")
	end
	---��ϡ��
	if yunxisong() then
		skill("������")
	end
	---̽÷
	if tanmei() then
		skill("̽÷")
	end
	if fengchuihe() then
		skill("�紵��")
	end
	if mount("��ˮ��") then
		wenshui(weight)
	else
		shanjujianyi(weight)
	end

end


function Tab()
	if  rela("�ж�") and cdEX("̽÷")==false then
		if rela("�ж�") then
			savetar(1)
		end
		ktarget("����", 15, 80, "����|����|ѣ��|����")
		return 1
	end
	if cdEX("̽÷")and rela("����") then
		settar(1)
	end
end

function Main(player)
local weight =  getWeight()
	if lastWeight~=weight then
		lastWeight= weight
		print("Ȩ��",weight)
	end
	scenef()--����Ŀ��

	if  tbuff("����")==true  then
		StopCurrentAction()
		return 1
	end

	if checkype("nil") then
		return 1
	end
    if tstateid() == 16 then
        --ѡ��ָ����Χ�����߿ɴ�ĵ��ˣ� 2����������С���룬�����롣
        crtar(0, 20)		--ѡ��0-15���ڵĵ��ˣ�����ѡ��ң�û�еĻ�ѡNPC
    end
    

	if kcastgroup()and (nocd("��������") or nocd("������")) then		--����Լ�������
		--����Ŀ��
		sceneb()
		skill("��ҡֱ��")
		jumpf()
		skill("5508")--������
		skill("��������")
		return 1
	else
		AutoMove()
	end
	if ota("������ɽ") then
		return 1
	end
	if duobi() and statep("�����") then --�����Χ���˶������˺���
		--OutputinGame("���ӱ�:"..Skill.."���ˣ�")
		if dis()<15 then
			skill("��Ȫ����")
		end
		skill("��Ȫ��Ծ")
		skill("������ʤ")
		skill("��̨���")
		skill("ӭ�����")
		--skill("����")
	end

	--���������Ŀ����
	if novisble() then
		skill("��ҡֱ��")
		jumpf()
	end
	if theig()<-6 and dis2()<=4 then
		skill("��ҡֱ��")
		jumph()
	end



DPS(weight)

	-- for infoi, Obj in pairs((info)) do --�����Ҫɾ ����������ΧĿ���õ�ɾ�˾�ʧЧ��
	-- 	--Output(Obj.szName)
	-- 	OutputinGame("��ɫ��:"..Obj.Kongfu.."���ˣ�")
		
	-- end
end