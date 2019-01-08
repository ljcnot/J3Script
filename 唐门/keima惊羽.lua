--dolib("Evde.lib")--����˺��߼�
--dolib("Tab.lib")--��Ŀ���߼�
--dolib("js.lib")--�����߼�

---Ȩ�ؼ���
function getWeight()

	local wudi = "��ɽ��|ƽɳ����|����|ɢ��ϼ|����|����|�Ϸ�����|Ц���|̫��|�������|Х�绢|ԡ��|����|ʴ�Ĺ�"
	local jianshang80 = "9696|7119|368|10307|10414"
	--���Ӱ�� �ֻ� ����ɽ Ц������ �붨
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
	if tbuff(jiaoxie) then
		weight = weight -3
		--OutputinGame("shanbi10")
	end
	if tstate("����|ѣ��|����|����|��ֱ") then
		weight = weight -3
	end
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
	if tbuff(chenmo) then
		weight = weight -3
		--OutputinGame("shanbi10")
	end
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

function whmax()--�򻨱����ж�
	if bufftime("����ָ")>3 and bufftime("����ع��")>3  then
		return true
	end
	if bufftime("����ع��")>3 and bufftime("��������")>3 then
		return true
	end
	if bufftime("����ָ")>3 and bufftime("��������")>3 then
		return true
	end
	if  buffsn("����")>=2 then
		return true
	end
	if tbuff("׷������") then
		return true
	end
	if life()<45 then
		return true
	end
	return false
end


function mubiaobeikong()
	return (tstate("����|ѣ��|����|����"))
end

function mubiaobeikongEX()--��������
	return (tstate("����|ѣ��|����"))
end
---skill:����id;time:��Ϣʱ��


local dutiao=false
function Thomas()--����˹
	-- ����Ŀ��()
	if kcastfl()and nocd("��������")  then --����Լ���������ɽ���� �����Լ��������Ѿ���Ϣ����
		--����Ŀ��()
		skill("��ҡֱ��")
		jumpf()
		skill("��������")
		return
	end
	if tota("������ɽ")  then -- ����Է�dutiaoת�糵
		sceneb()
		skill("��������")
		return  --ֱ�ӷ��� ��ִ������ĸ�������Ŀ��
	end
	scenef()
end
--function sleep(n)
--	if n > 0 then
--		os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL")
--	end
--end

function kongqueling()
	local qusan2={"681","680","112","631","213","673"}
	--��Ԫ���(�о����Բ�Ҫ) ����(ͬ��) ���ľ��� ���� ��Ū�� ����
	local qusan1="755|684|6174|112|122|��������|������|����"
	if tbuff(qusan1) then
		return true
	end
	local num=0;
	for key,value in ipairs(qusan2)
		do
			if tbuff(value) then
				--OutputinGame(value)
				num=num+1
				-- Output("�ҵ���"..value..";"..a)
				if (num>=2) then
					return true
				end
			end
			-- Output(value)
		end
		return false
	end
	
	function Dps()--���ѭ��
        local player = GetClientPlayer()
        local stateEX = GetState(player)

		if rlast2(0, 30, "�׼�", "�ж�", 4, 30) then
            kskill(0, 25, "����", "�뾭�׵�|�����ľ�|�����|��֪")
		end
		--����
		--if ( buff("������Ӱ")==true) then
        --
		--	----OutputinGame("׷����")
		--end
        if getWeight()<=10 and buff("������Ӱ")==true then
            skill("3096")--׷����
            skill("18801")
            return
        end
		if otatype("right") or otatype("left") then
			return
		end
		--��ɢ
		if (life()<50 or (whmax() and life()<70))and statep("�޼���") then
			skill("��������")
		end
		if state("����|ѣ��|����|����") and statep("�����") then
            skill("17587")--������1
			--if(mSkillCharge("���Ƕ�Ӱ")>1) then
            --skill("17587")--������1
			--end
		end
		if (((getWeight()<=5 or life()<30)and nocd("׷����")) or (whmax() and life()<50 and buff("3206")==false ))and nocd("������Ӱ") and buff("������Ӱ")==false and dis()<=20 then
			StopCurrentAction()
			skill("������Ӱ")
			return
		end
		
		
		
		if nocd("3118") and buff("������Ӱ")==false then
			skill("3118")
		end
		if buff("3217")  and (otatype("right") ==false and otatype("left")==false  ) then
			if theig()<3 then
				jumph()
				Delay(500)
			end
			if theig()>3.5 then
				jumph()
				Delay(500)
			end
			if theig()>6 then
				jumph()
				Delay(500)
				skill("3119")--���踡��
			end
		end
		if bufftime("12481")<1  then
            StopCurrentAction()
			skill("3120",2)--�������
		end
		--���
		if buff("����")==false then
			skill("3103")
			--Delay(500)
		end
		--if buffTime("11886")<2 then
		--		skill("17587")--������1
		--end
		
		if kongqueling() then
			skill("3091")--��ȸ��
			----OutputinGame("��ȸ��")
		end
		----OutputinGame("Ȩ��:.."..Ѫ������Ȩ��())
		
		if getWeight()<=6 then
			skill("3094")--����|����|׷��|3112|3096
			--skill("3112")--����
		end
		if (getWeight()<10  and (buff("3276")==true or buff("����")==true)) or buff("��������")==true then
			
			
			skill("3096")--׷����
			skill("18801")--׷����
			--OutputinGame("׷����")
		end
		
		
		
		if buff("����")==true then
			skill("3095")
			skill("18779")
		end
		
		if tstatep("������")  and dis()>10 and dis()<25 then
			skill("3101")--���Ǽ�
			skill("18810")--���Ǽ�
			--OutputinGame("���Ǽ�")
			
		end
		--���
		if  (dis()<10 and dis()<25 and buff("����")==false)  then
			skill("3101")--���Ǽ�
			skill("18810")--���Ǽ�
			--OutputinGame("���Ǽ�")
			
		end
		if  (dis()>10 and dis()<25 and tstatep("�����"))  then
			skill("3101")--���Ǽ�
			skill("18810")--���Ǽ�
			--OutputinGame("���Ǽ�")
		end
		
		
		--����
		
		
		--����
		if  getWeight()<8 and nocd("3098") then
			skill("3098")--������
			skill("18811")--������
			--OutputinGame("������")
			
		end
		
		--����
		if  tstatep("�����")  and energy()>50 then
			--skill("����")
			skill("������")
			--OutputinGame("������")
			
		end
		
		
		
		if (tbuff("����")==false or tbufftime("����")<3 or tbuffsn("����")<3 )then
			skill("6450")--��ʯ��
			skill("18812")--��ʯ��
			--OutputinGame("��ʯ��")
			
		end
		--print(stateEX)
		if stateEX==1 or buff("12481") or  buff("12481") then
			--OutputinGame("���Ǽ�")
			skill("3095")--���Ǽ�
			skill("18779")--���Ǽ�
		else
			skill("6450")--��ʯ��
			skill("18812")--��ʯ��
			--OutputinGame("��ʯ��")
			
		end
		
		
	end
	function FullMonitor(Info)--ȫ�����
		
		
	end

	
	function Main()
		
		if tstateid() == 16  then--Ŀ��������ʲôҲ��ִ��
			return
		end
		--if tstatep("������") then--Ŀ���޵���ʲôҲ��ִ��
		--	return
		--end
		-- --OutputinGame(TLTriggerBomdis())
		if  tbuff("����")==false and tbuff("����|������ŭ")==false then
			--GetFullMonitorInfo()
			--Tab()
			Thomas()
			--sleep(1)
			Dps()
		else
            StopCurrentAction()
		end
		--StopCurrentAction()
		
	end