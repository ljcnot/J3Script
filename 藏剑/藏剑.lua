--��ʼ�����֣������ʱ���ִ�У���Ҫ���ں�������
--����һЩѡ��
AddOption("ѡ��һ")
AddOption("ѡ���")
AddOption("ѡ����")

--�ű�������˵��������������ЩЩ��Ѩ֮��ģ�������\n
--����ڲ���˵��еĽű�˵���л���ʾ
szScriptDesc = "Х���ֶ�"

----g_player�Լ��Ķ���ȫ�֣�
   local me = GetMyPlayer() --�Լ�
   local ta, taclass = GetTarget(me) --�ҵĽ��㣬�������� 
	

-----------��ѯ��ǰ����ʲô�ķ�
function isxinfa()
return GetMount(GetMeState()) 
end	
	
	
-----------��ȡ�ҵĶ���	
function GetMeState()
	return GetMyPlayer()
end
-------------��ȡ�������
function GetTaState()
	local ta,taclass = GetTarget(GetMeState())
	if taclass == NONE then return nil end
	return ta
end
--------------�ҵ�buffʣ��ʱ��
function GetMeBuffTime(buff) 
	return (GetTypeTime(GetBuff(GetMeState()),buff))
end
--------------����buff����ʣ��ʱ��
function GetTaBuffTime(buff)
	local tabufftime = -1
	if nil ~= GetTaState() then 
	tabufftime = GetTypeTime(GetBuff(GetTaState()),buff)
	return tabufftime
	end
	return tabufftime
end
-------------��ȡ�ҵ�����ֵ
function GetMelife()
	return (GetMeState().nCurrentLife/GetMeState().nMaxLife)*100
end
------------��ȡ���������ֵ
function GetTalife()
	local talife = -1
	if nil ~= GetTaState() then
	talife = (GetTaState().nCurrentLife/GetTaState().nMaxLife)*100
	return talife
	end
	return talife
end

-----------�����ͷ�ǰ�ж� (���� true false)
function isTopSkill()
    local ta = GetTaState()
	if nil == ta  then return false end
	--�ж�Ŀ���Ƿ��ǵж�
	if IsEnemy(ta) == false then return false end
	--�ж�Ŀ���Ƿ��޵���
	local wudiList = "��ɽ��|ƽɳ����|����|ɢ��ϼ|����|�Ϸ�����|Ц���|̫��|�������|ԡ��|����|ʴ�Ĺ�"
	local wudiTime = GetBuffTime(GetBuff(ta),wudiList)
	if wudiTime > 0 then return false end
	--�ж�Ŀ���Ƿ�������
	local taState = GetState(ta)
	if string.find("����",taState) then return false end
	return true
end

-----------���ܾ����ж�(�ھ����з��� true ���ھ����з��� false)
function islengthSkill(length)
	local ta = GetTaState()
	if nil == ta  then return false end
	--���뽹��ľ���
	local beforelength = GetDist(ta)
	if beforelength > length then return false end
	return true
end

---------�жϼ���cdʣ��ʱ��(��cd�з���false ����cd�з���true)
function isSkillcd(mySkill)
	local time = GetSkillGCD(mySkill)
	if time > 0 then return false end
	return true
end

---------��ǰ10�߽����Լ����⹦(���ظ���)
function pointMewaigong ()
	local waigongnumber = 0
	local seemecount,seemet = GetSeeMe(10)
	--����һ����Ŀ������
	if seemecount > 0 then 
		--Ŀ������о���
		if seemet["�����"] then waigongnumber = waigongnumber+1 end
		--Ŀ������н���
		if seemet["̫�齣��"] then waigongnumber = waigongnumber+1 end
		--Ŀ����������
		if seemet["��Ѫս��"] then waigongnumber = waigongnumber+1 end
		--Ŀ�������ؤ��
		if seemet["Ц����"] then waigongnumber = waigongnumber+1 end
		--Ŀ������вؽ�
		if seemet["��ˮ��"] then waigongnumber = waigongnumber+1 end
		if seemet["ɽ�ӽ���"] then waigongnumber = waigongnumber+1 end
		--Ŀ������в���
		if seemet["��ɽ��"] then waigongnumber = waigongnumber+1 end
		--Ŀ������аԵ�
		if seemet["������"] then waigongnumber = waigongnumber+1 end
		--Ŀ�����������
		if seemet["�躣��"] then waigongnumber = waigongnumber+1 end
	end
	return waigongnumber
end

----------�ὣ �����ͷ�ǰbuff�ж�
function isqingjianjingtao()
	--�жϽ��������Ƿ��� ���buff����
	if GetTaBuffTime("���") ~= 0 then return false end
	--�жϽ��������Ƿ��� ����buff����
	if GetTaBuffTime("����") ~= 0 then return false end
	--�жϽ��������Ƿ��� ����buff����
	if GetTaBuffTime("����") ~= 0 then return false end
	--�жϽ��������Ƿ��� ����buff����
	if GetTaBuffTime("����") ~= 0 then return false end
	--�жϽ��������Ƿ��� ѣ��buff����
	if GetTaBuffTime("ѣ��") ~= 0 then return false end
	--�жϽ��������Ƿ��� ����buff����
	if GetTaBuffTime("����") ~= 0 then return false end
	--�жϽ��������Ƿ��� ��������buff����
	if GetTaBuffTime("��������") ~= 0 then return false end
	--�жϽ��������Ƿ��� ���Ṧbuff����
	if GetTaBuffTime("���Ṧ") ~= 0 then return false end
	return true
end

----------�ؽ� �����ͷ�ǰbuff�ж�
function iszhongjianjingtao()
	--�жϽ��������Ƿ��� ���buff����
	if GetTaBuffTime("���") ~= 0 then return false end
	--�жϽ��������Ƿ��� ����buff����
	if GetTaBuffTime("����") ~= 0 then return false end
	--�жϽ��������Ƿ��� ѣ��buff����
	if GetTaBuffTime("ѣ��") ~= 0 then return false end
	--�жϽ��������Ƿ��� ����buff����
	if GetTaBuffTime("����") ~= 0 then return false end
	--�жϽ��������Ƿ��� ��������buff����
	if GetTaBuffTime("��������") ~= 0 then return false end
	return true
end


---------- �����ͷ�ǰbuff�ж� (���ν�����)
function iszuiyue()
	if GetTaBuffTime("���") == 0 and 
	GetTaBuffTime("����") == 0 and 
	GetTaBuffTime("ѣ��") == 0 and 
	GetTaBuffTime("��������") == 0 
	then return true end	
	if GetTaBuffTime("����") > 0 
	and GetTaBuffTime("����") <= 0.2 
	then return true end
	return false
end

---------- �Ʒ��ͷ�ǰbuff�ж� (����1.5��)
function isyunfei()
	if GetTaBuffTime("����") > 1.6 or GetTaBuffTime("ѣ��") > 1.6 or GetTaBuffTime("����") > 1.6  then
		return true
	end
		return false
end

--------------------------------------------����

---------------���� (�ĳ�)
function tinglei()
	fengchayunfei()
	local length = 4
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	Cast("����")
end

--------------ƽ������,�����´�(8��)
function pinghuduanyue()
	local length = 8
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--�жϼ���cdʣ��ʱ��
	if false == GetSkillSCD("ƽ������") then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	Cast("ƽ������")
	huanglongtucui()

end

--------------�����´�(6��)
function huanglongtucui()
	local length = 6
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--�жϻ���cdʣ��ʱ�� (�����ǵ�����cd)
	if GetSkillSCD("�����´�") ~= 0 then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	Cast("�����´�")
end

--------------������(5-24��)
function yuhongguanri()
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	local length = 15
	--��Ȫ��������(��gcd)
	if GetSkillSCD("��Ȫ����") == 0 and islengthSkill(length) then mengquanhupao() return end
	--�жϼ���cdʣ��ʱ��
	if false == isSkillcd("������") then return end
	--���ܾ����ж�
	local ta = GetTaState()
	if nil == ta  then return false end
	--�������ҵľ���
	local beforelength = GetDist(ta)
	if beforelength < 9 then return end
	Cast("������")
end

-------------��Ȫ���� (15��)
function mengquanhupao()
	local length = 15
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	Cast("��Ȫ����")
end

------------Ȫ����(����)
function quanningyue()
	--�ж��Ƿ��ǵ���
	if GetTaState() == nil or IsEnemy(GetTaState()) == false then return end
	--�ж� 6143Ȫ���µ�buff
	local quanBuff = GetMeState().IsHaveBuff(6143,0)
	if quanBuff then return end
	Cast("Ȫ����")
end

------------ �紵�� 6�� (����60%)
function fengchuihe()
	local length = 6
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--��ǰ10�߽����Լ����⹦����
	local tanumber = pointMewaigong()
	if tanumber == 0 then return end
	--�жϷ紵�ɵ�cd
	if GetSkillSCD("�紵��") ~= 0 then return end  
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	Cast("�紵��")
end

----------- �ὣ���� 8�� (�ὣ���� ����12��)

function qingjingtao()
	local length = 8
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--�ὣ�����ͷ�ǰbuff�ж�
	if isqingjianjingtao() == false then return end
	--�жϾ��ε�cd
	if isSkillcd("����") ~= 0 then return end  
	--�ж������ù�û
	if GetSkillSCD("����") == 0 then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	Cast("����")
end

----------- �ؽ����� 8�� (�ؽ����� 3��)

function zhongjingtao()
	local length = 8
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--�жϾ��ε�cd
	if GetSkillSCD("����") ~= 0 then return end  
	--�ؽ������ͷ�ǰbuff�ж�
	if iszhongjianjingtao() == false then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	--���2����֮�ڷŹ� ���(1613) ���ܷž���
	if GetCastCount(GetMeState(),1613,2) ~= 0 then return end
	Cast("����")
	xizhaoleifeng()
end

----------- ���� 8�� (ѣ�� 4��)
function zuiyue()
	local length = 8
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--�ж����µ�cd
	if GetSkillSCD("����") ~= 0 then return end  
	--�����ͷ�ǰbuff�ж�
	if iszuiyue() == false then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	--���2����֮�ڷŹ� ���(1613) ���ܷ�����
	if GetCastCount(GetMeState(),1613,2) ~= 0 then return end
	Cast("����")
	yunfei()
end

---------- ����ƾ� 6 �� (���Ṧ2�룬����15��)
function fengcha()
	local length = 4
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--�жϷ���ƾ���cd
	if GetSkillSCD("����ƾ�") ~= 0 then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	--����ƾ� �ͷ�ǰbuff�ж�
	if GetTaBuffTime("����") ~= 0 then return end
	if GetTaBuffTime("ѣ��") ~= 0 then return end
	Cast("����ƾ�")
	--�Ʒ���� �����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	Cast("�Ʒ����")
end

-------- Ϧ���׷� 8��
function xizhaoleifeng()
	fengchayunfei()
	local length = 8
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	Cast("Ϧ���׷�")
end

------- �Ʒ���� ������� 
function yunfei()
	local length = 8
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	--�Ʒ� �ͷ�ǰbuff �ж� �Ƿ����1.6��
	if false == isyunfei() then return end
	--����ָ��Ŀ��
	TurnTo(GetTaState())
	Cast("�Ʒ����")
	tinglei()
end



--------- ������ (����50%)      Ѫ������30 �����ҵ��⹦����1 ʹ��
function yunxisong()
	--��ǰ10�߽����Լ����⹦����
	local tanumber = pointMewaigong()
	--�ҵĵ�ǰѪ��(�ٷֱ�)
	local mylife = GetMelife()
	if mylife < 30 and tanumber > 0 then
		Cast("������")
	end
end

------�����Ʒ�
function fengchayunfei()
	--���3����֮�ڷŹ� ���(1613) 
	local fengchatime = GetCastTime(GetMeState(),1613)
	if fengchatime >= 0 and fengchatime < 3 then
		print("zuihou")
	Cast("�Ʒ����")
	end
end

------�׹��ɽ 15��

function hegui()
	local length = 15
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--���뽹��ľ���
	local beforelength = GetDist(GetTaState())
	--�ж�����ǲ��Ƿ糵,Ⱥ��
	if IsDangerArea(GetTaState(),"�ж�") then return end
	--�ж�13�ߵ�17��֮��
	if beforelength > 12 and beforelength < 18 then
	CastTo("�׹��ɽ",GetTaState(),true)
	end
end

------������ϼ
function songshe()
	local length = 15
	--�����ͷ�ǰ�ж�
	if false == isTopSkill() then return end
	--�ж������cd
	if GetSkillSCD("����ƾ�") ~= 0 then return end
	--���ܾ����ж�
	if false == islengthSkill(length) then return end
	--�ж��Ƿ����,���״̬��
	if GetTaBuffTime("���") ~= 0 then return end
	if GetTaBuffTime("��������") ~= 0 then return end
	local taState = GetTaState()
	if string.find("���",GetState(taState)) then return end
	--�ж�����ǲ��Ƿ糵,Ⱥ��
	if IsDangerArea(GetTaState(),"�ж�") then return end
	Cast("������ϼ")
end




--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
	yunxisong()
	quanningyue()
	--�ὣ
	if isxinfa() == "��ˮ��" then
	yuhongguanri()
	zuiyue()
	pinghuduanyue()
	tinglei()
    fengchuihe()
	return
	end
	--�ؽ�
	if isxinfa() == "ɽ�ӽ���" then
	songshe()
	hegui()
	zuiyue()
	yunfei()
	zhongjingtao()
	xizhaoleifeng()
	tinglei()
	fengcha()
	return
	end
	
end


















































