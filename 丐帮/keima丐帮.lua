--�ű���Ϣ="�ű����Ƽ�QQ��356151696-���ߣ�keima"

---Ȩ�ؼ���
function getWeight()

    local wudi= "��ɽ��|ƽɳ����|����|ɢ��ϼ|����|����|ڤ��|��Ӱ|�Ϸ�����|Ц���|̫��|�������|wudi|ԡ��|����|ʴ�Ĺ�"
    local jianshang80= "9696|7119|368|10307|10414"
    --���Ӱ�� �ֻ� ����ɽ Ц������ �붨
    local jianshang70= "8421|10493|1802|384"
    --���� ����� ���� תǬ��
    local jianshang60= "6264|11319|8300|13044|9836|9206|6200"
    --���໤�� ��Ԩ���� ��ǽ ����� Ħ�� ����֮��  ��Х����
    local jianshang50= "9810|6315|10014|8427|9803|6306|2983|1412|3068"
    --���� ���� ���� �ٻ� ����� ������ ���� �������� ����
    local jianshang40= "9873|2953|1187|399|9693|6279|11920|8839|6637|6636|6257|5744|6163|9874|9293|12530|122|6240|12656|9208|8495|6248"
    --ҷ�� ʥ��֯�� ���� ����� ���Ӱ�� ̰ħ�� ���໤�� ʥ��֯�� ʥ��֯�� ʥ��֯�� ���໤�� ̰ħ�� ����ɽ ɢӰ ��Ӱ ����Ϸˮ ���໤�� ��ˮ�� ˮ鿻�ӯ ����֮�� ���� �ݲй�
    local jianshang30= "9510|11457|9895|9745|9896|8302|12286|2177|10051|9510|5641|6262|6160|5806|5705|2813|6247"
    --�������� ��ˮ ־�� ��ʥ ���� ���� ������ת ���� ��ˮ��Ӱ �������� ��� ���� ���� ���� ���� ��� ��Ӱ
    local jianshang20= "2983|7790|7171|6378|6209|5746"
    --���� ��ս �ƻ� ѱ�� ����� ������Ӱ
    local jianshang10= "11272|9904|9763|11344|6333|6610|5750|10024|12411|8424|6540|6337|6237|5770|4479|6113"
    --���� ��Ȫ ���� ���� �Ͻ���ӡ �ݺ� ��ȥ�� ��ŵ� ���� ����Ϸˮ �ᶨ ��ɽ �껤 ʥӿ �ҽ� �۳� ǧ������
    local miankong="������|����|ͻ|����|Ц���|��Ԩ|������|��Ծ��Ԩ|�Ƴ��׼�|�̵��׼�|�����׼�|����|����|�������|��Ӱ|����|����|��¥��Ӱ|�麨|����|��Ȼ|���|����֮��|����|Х��|��¥��Ӱ|תǬ��|תǬ��|ʥ��|�������|��Ұ|����|ǧ��׹|����|������|����|������|������|�γ۳�|��̫��|��̫��|�����|�Ƴ��|��������miankong|�����޳�|�����޳�|����|ʯ����|����|����|����Χ|����|̽÷|����|��Ӱ|����|����|�ٻ�|��������|��ǽ|������Ⱥ|ǧ������|����|ǧ��|�޾�|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|ȵ̤֦|����|����|��������|����|���|ˮ���޼�|�۹�|ʴ�Ĺ�|��Ȫ��Ծ|��Ӱ|�ɹ�|���߿���|��������|��Ӱ"
    local shanbi80="10619|9846|9783"
    --����|�������� ȵ̤֦
    local shanbi60="6434|9783|5668|9736"
    --����ң ȵ̤֦ �紵�� �ȱ�Ը

    local shanbi50="2065|6299|8866|677"
    --��ϡ�� ������� ȵ̤֦ ȵ̤֦
    local shanbi40="6174|4028|10618"
    --���� ʥ���� ����
    local shanbi30="4931|6146"
    --���� ����
    local shanbi20="4710|6142|3310|948"
    --���� ���� ���� �����������
    local shanbi10="857|10465|6289|10617"
    --���� ����̿� �ȱ� ����

    local weight=10
    --OutputinGame("---------------------------------")
    if tbuff(wudi) then
        weight = weight +100
    end
    if tbuff(jianshang80) then
        weight = weight +8
        --OutputinGame("jianshang80")
    end
    if tbuff(jianshang70) then
        weight = weight +7
        --OutputinGame("jianshang70")
    end
    if tbuff(jianshang60) then
        weight = weight +6
        --OutputinGame("jianshang60")

    end
    if tbuff(jianshang50) then
        weight = weight +5
        --OutputinGame("jianshang50")
    end
    if tbuff(jianshang40) then
        weight = weight +4
        --OutputinGame("jianshang40")
    end
    if tbuff(jianshang30) then
        weight = weight +3
        --OutputinGame("jianshang30")
    end
    if tbuff(jianshang20) then
        weight = weight +2
        --OutputinGame("jianshang20")
    end
    if tbuff(jianshang10) then
        weight = weight +1
        --OutputinGame("jianshang10")
    end
    if tbuff(shanbi80) then
        weight = weight +8
        --OutputinGame("shanbi80")
    end
    if tbuff(shanbi60) then
        weight = weight +6
        --OutputinGame("shanbi60")
    end
    if tbuff(shanbi50) then
        weight = weight +5
        --OutputinGame("shanbi50")
    end
    if tbuff(shanbi40) then
        weight = weight +4
        --OutputinGame("shanbi40")
    end
    if tbuff(shanbi30) then
        weight = weight +3
        --OutputinGame("shanbi30")
    end
    if tbuff(shanbi20) then
        weight = weight +2
        --OutputinGame("shanbi20")
    end
    if tbuff(shanbi10) then
        weight = weight +1
        --OutputinGame("shanbi10")
    end

    if tlife()<10 then
        weight = weight -10
    end
    if tlife()>=10 and  tlife()<20 then
        weight = weight -9
    end
    -- Output("5")
    if tlife()>=20 and  tlife()<30 then
        weight = weight -8
    end
    -- Output("6")
    if tlife()>=30 and  tlife()<40 then
        weight = weight -7
    end
    -- Output("7")
    if tlife()>=40 and  tlife()<50 then
        weight = weight -6
    end
    -- Output("8")
    if tlife()>=50 and  tlife()<60 then
        weight = weight -5
    end
    if tlife()>=60 and  tlife()<70 then
        weight = weight -4
    end
    if tlife()>=70 and  tlife()<80 then
        weight = weight -3
    end
    if tlife()>=80 and  tlife()<90 then
        weight = weight -2
    end
    if tlife()>=90 and  tlife()<100 then
        weight = weight -1
    end

    return weight
end



function avoid() --���
	if (whmax() and statep("������|�޼���")) or life()<50 then
		skill("18523")
    end
    if life()<=30 and buff("����Ϸˮ")==false and buff("��Х����")==false and nocd("Ц���")
    then
        --����(87)
        StopMove()
        skill("Ц���")
        Delay(8000)
        return
    end
end


function Thomas()--����˹
    AutoMove()
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
	if tbuff("׷������") and statep("������|�޼���")then
		return true
	end
	return false
end

function kanglong()
    if dis()<4 and mana()>=30 and ((tstatep("������") and tstatep("�޼���"))or tlife()<20)
    then 
        skill("����ң")
        skill("8490")--����
        return
    end
end

function yanyuxing() --�������ж��߼�

    if explast("", 1.5) then	--����Լ�3���ڷŹ�������
        return false
    end
    if explast("5508", 1.5) then	--����Լ�3���ڷŹ�������
       return false
    end

   if cd("����ͷ") and dis()<5 and cd("5258") and cd("�����޹�") and mana()<30
    then
        return true
    end

    --if cd("����ͷ") and dis()>10
    --then
    --    return true
    --end
    return false

end


---��еʱ��
function jiaoxieTime()
    local jiaoxie={"����","ϼ��","��η����","��е"}
    local time=0
    for key,value in ipairs(jiaoxie)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---ѣ��ʱ��
function yunxuanTime()
    local yunxuan={"ѣ��","ǧ��׹","�ù�","����ع�","����","����","��ľ����","��������","����","����","����","����ң","������ħ��","�ùⲽ","����","���","�ƻ�","��ħ","��ҹ����","����","������","��Ӱ","��������","����","Ы�Ķ���","Ы�Ŀݲ�","Ы������","�ϻ��","����","�׹��ɽ","Σ¥","����","��ͷһ��","��ע","�Ƽ���","Ы����","����","��ʨ�Ӻ�","���̽Կ�","ͻ","ս��ѣ��","׷��","�ս�","����ƾ�","��"}
    local time=0
    for key,value in ipairs(yunxuan)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---����ʱ��
function dingshenTime()
    local dingshen={"����","���","����","����","����","����","�������","��Ӱ","�������","��ҹ����","˿ǣ","�ù�","筴�����","����","ͬ��","����","̫��ָ","���","��������","��������","ܽ�ز���","���ǹ���","����","�ù�","����","��������","�������"}
    local time=0
    for key,value in ipairs(dingshen)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---����ʱ��
function suozuTime()
    local suozu={"����","����","����ع�","���Ǽ�","����","����","����","Ӱ��","����ع��","������","����","��","�巽�о�","���","����","̫��ָ","����","��ҹ����","������Ӱ","����","ʥЫ�׼�","���","��צ","��ȸ��","����","�����׼�","Ӱ��","�������","����ݲ�","��������","�巽�о�","���Ż���","�¹�����","����","ֹˮ","Ӱ��","����"}
    local time=0
    for key,value in ipairs(suozu)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---��еʱ��
function jidaoTime()
    local jidao={"����ع�","̤������","����"}
    local time=0
    for key,value in ipairs(jidao)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---����ʱ��
function jianliaoTime()
    local jianliao={"���","����","Ϣ��","���Ӱ��","��һ","�ܻ�","������","����","��������","������","����","Ы��","��ӽ�ɳ","��Ϣ","�̳�","�������","����ݲ�","��������","����","���Ӱ��"}
    local time=0
    for key,value in ipairs(jianliao)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---����ʱ��
function fengneiTime()
    local fengnei={"���Զ���","����ʽ","����ָ","����ҫ","������Х","÷����","����","�Х����","�Х�ݲ�","�Х����","�Х����","����","�������","��Ĭ","������ŭ"}
    local time=0
    for key,value in ipairs(fengnei)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---��Ĭʱ��
function chenmoTime()
    local chenmo={"����","���ɾ���","��������","��Ĭ","���ɾ���","ֹϢ","����","��Ĭ","����","����ͨ��","����"}
    local time=0
    for key,value in ipairs(chenmo)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end

---����ʱ�������
function kongzhiTime(time)
   return dingshenTime()>time or yunxuanTime()>time or jidaoTime()>time or suozuTime()>time
end
---����ʱ�䲻������
function kongzhiTimeEX(time)
    return dingshenTime()>time or yunxuanTime()>time or jidaoTime()>time
end
---���ܶ����ܵ�ʱ��
function noSkillTime(time)
    return fengneiTime()>time or chenmoTime()>time or jiaoxieTime()>time
end

function macro()
    if  ota("������") or ota("5270") or ota("5268")then
        return
    end


    if ally() then		--���Ŀ�����Լ����Ѻã�����
        --�����ǰĿ���ǵж�
        plast()
    end
    if attri("tab����")then
        tab()
    end
    avoid()

    --print(dis())

    scenef()
    if tnoota("������ɽ|��������") then
        AutoMove()
    end
    if math.abs(theig())>5 and dis()<=4 then
        skill("��ҡֱ��")
        jumph()
    end
    --if theig()>1 thens
    --    jumpf()
    --end

    if  tbuff("����")==true  then
        return
    end
    if checkype("nil") then		--����Լ���ǰû��Ŀ��
        return
    end

    local weight = getWeight()
    local chemmoTime = chenmoTime()
    skill("Ǳ������")--����
    skill("5362")--����

    skill("��������")--����
    skill("������β")--����
    skill("��������")--����

    if  nocd("������")
    then
        --����(87)
        StopMove()
        skill("������")--������
        Delay(1000)
        return
    end
    if dis()<=4 and mana()>=30 and  weight<10 then
        --if  buffsn("6381")>3 and buff("7118") == false then
        --else
            skill("����ң")
            skill("8490")--����
        --end
    elseif dis()<=5 and mana()>=40 then
        skill("5367")--��������
        skill("5368")--˫��ȡˮ
        skill("5369")--�������
        skill("5370")--��������
    else

        if (dis()<=6 and weight<3)  or (life()<70  and buff("��Х����")==false)
        then
            skill("��Х����")
        end

        if mana()>=20 or (dis()>=4 and dis()<=15 and cd("��Ծ��Ԩ")) or buff("�����л�")==false
        then
            skill("��ս��Ұ")
        end


        if dis()<=8 and (kongzhiTime(1.5) or noSkillTime(1.5)) then
            skill("����·")
        end

        if dis()<=5  then
            skill("5258")--����
            --if  nocd("�����޹�")
            --then
            skill("�����޹�",4)
            --end
        end

        if  (nocd("����ͷ") and tstatep("�ɿ���") and ( cd("�����޹�") or (mana()<30 and dis()>=4 and dis()<=20))) or (weight<4 and dis()>4 and dis()<=20) or (tstatep("�ɿ���") and dis()>=5 and dis()<=20)
        then
            skill("����ͷ")
        end


        if  yanyuxing()
        then
            skill("5508")--������
        end


        if mana()<30 and dis()<=8  and tstatep("�����") and (weight<8 or cd("�����޹�"))
        then
            skill("��Ȯ����")
        end

        if ((dis()>4 or cd("�����޹�") or statep("�����")  or cd("����ͷ") ) and dis()<22)or (weight<4 and dis()>4 and dis()<=22) or state("����|ѣ��|����|����|��ֱ")
        then
            skill("��Ծ��Ԩ")
        end



    end
    --�ٻ���
    if buff("6460") == false then
        skill("6945")--����
    end


end

function tab()
    if rlast2(0, 25, "�׼�", "�ж�", 0, 30) then		--0-15�ߣ��ж���ң��Ź���ɽ�ӣ�û��8�룬������
        ktarget("�ж�", 30, 100, nil, "�����")
        return
    end
    --��ȡĿ���״̬ID
    if tstateid() == 16 then	--���Ŀ������
        ktarget("�ж�", 30, 100)
    end
    --ktarget("�ж�", 20, 90)
    --ktarget("�ж�", 20, 80)
    --ktarget("�ж�", 20, 70)
    --ktarget("�ж�", 20, 60)
    --ktarget("�ж�", 20, 50)
    --ktarget("�ж�", 20, 40)
    --ktarget("�ж�", 20, 30)
    --ktarget("�ж�", 20, 20)
    --ktarget("�ж�", 20, 10)
    --ktarget("�ж�", 25, 100, nil, "�����")
    --ktarget("�ж�", 25, 100, nil, "�����")
    --ktarget("�ж�", 25, 100, nil, "�뾭�׵�")
    --ktarget("�ж�", 25, 100, nil, "��ѩս��")
    --ktarget("�ж�", 20, 100, "����|ѣ��|����")
    --ktarget("�ж�", 20, 90, "����|ѣ��|����")
    --ktarget("�ж�", 20, 80, "����|ѣ��|����")
    --ktarget("�ж�", 20, 70, "����|ѣ��|����")
    ktarget("�ж�", 20, 60, "����|ѣ��|����")
    ktarget("�ж�", 20, 50, "����|ѣ��|����")
    ktarget("�ж�", 20, 40, "����|ѣ��|����")
    ktarget("�ж�", 20, 30, "����|ѣ��|����")
    ktarget("�ж�", 20, 20, "����|ѣ��|����")
    ktarget("�ж�", 20, 10, "����|ѣ��|����")
end

--�ű�ѡ��
attribute = {
    {
        attri_name = "tab����",
        attri_explain = "tab����"
    }
}

function Main()


    macro()


end