local model = 0;---0:��ͨģʽ,1:�������,2:������,3:����
---
--

local selectID
local first = true

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

---����ʱ�������
function kongzhiTime(time)
    return (dingshenTime() >0 and dingshenTime() > time) or (yunxuanTime() >0 and yunxuanTime() > time) or (jidaoTime()>0 and jidaoTime() > time) or (suozuTime() >0 and suozuTime() > time)
end
---����ʱ�䲻������
function kongzhiTimeEX(time)
    return (dingshenTime() >0 and dingshenTime() > time) or (yunxuanTime() >0 and yunxuanTime() > time) or (jidaoTime()>0 and jidaoTime() > time)
end
---���ܶ����ܵ�ʱ��
function noSkillTime(time)
    return (fengneiTime() >0 and fengneiTime() > time) or (chenmoTime() >0 and chenmoTime() > time) or (jiaoxieTime()>0 and jiaoxieTime() > time)
end




function duobi()
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
    if tbuff("׷������")then
        return true
    end
    if tbuff("ݺ����") or tbuff("�����") or tbuff("��������") then
        return true
    end
    --��Χ�Ƿ�������С��ָ��ʱ����ʹ�ù�ָ������  3������������������ϵ���ͷ�ʱ�䣨�룩
    if rlast("������Ӱ", "�ж�", 3) then		--�����Լ���Ŀ�꣬Ŀ�����ң��ǵжԣ�5����ʹ�ù�������ŭ
        return true
    end
    return false
end

function kekongZT()
    ---Ŀ�괦�ڿ��Կ��Ƶ�״̬(��,վ,��)
   return tstateid()==1 or tstateid()==3 or tstateid()==4
end
function yanyuxing(weight) --�������ж��߼�
---ؤ�������� ID  ��ǰ5269���5506 ����5507 ����5508
    if theig()<-5 then
        return false
    end
    scenef()--����Ŀ��
    AutoMove()
    if state("����|ѣ��|����|����|��ֱ") and cd("��Ծ��Ԩ") and cd("����ͷ")  then	--����Լ���ָ����״̬֮һ
        scenef()--
        AutoMove()
        --Delay(500)
        skill("5269")
    print("������1")
        return false
    end
    if dis()>20 and face()==0  then
        skill("��������")
        skill("5269")
    end
    if cd("����ͷ") and dis()>5 and cd("��Ծ��Ԩ") and (cd("��ս��Ұ")or mana()<20) and face()==0 and tstateid()~=26 and tstateid()~=27 then
        scenef()--����Ŀ��
        AutoMove()
        --Delay(500)
        skill("5269")
        print("������2")

        return false
    end
    if cd("����ͷ")and cd("��Ծ��Ԩ") and dis()>=15 and face()==0
    then

        skill("5269")
        print("������3")

        return false
    end
    if dis()>20 and  kekongZT() and face()==0 then
        scenef()--����Ŀ��
        AutoMove()
        --Delay(500)
        skill("5269")
        print("������4")

        return false
    end

    if cd("����ͷ") and dis()<5  and cd("�����޹�") and  explast("�����л�",1) and mana()<30  and (tstatep("�����")or weight<=5)
    then
        skill("5508")
        print("������6")

        return true
    end





    --if cd("����ͷ") and dis()>10
    --then
    --    return true
    --end
    return false

end

function longyue(weight)
    if state("����|ѣ��|����|����|��ֱ") then
        return true
    end
    --if nocd("����ͷ") then
    --    return false
    --end
    if theig()<-5  and tstatep("�����") then
        return false
    end
    if  dis()>22 then
        return false
    end
    if dis()>6 and dis()<=15 and (cd("��ս��Ұ")or mana()<20) and kekongZT() and tstateid()~=26 and tstateid()~=27  then
        return true
    end
    if dis()>15 and  kekongZT() then
        return true
    end
    if dis()>4 and cd("����ͷ") and cd("�����޹�") and tstatep("�ɿ���")and tstateid()~=26 and tstateid()~=27   then
        return true
    end
    if cd("����ͷ") and cd("�����޹�") and explast("��������", 1) and tstatep("�ɿ���") then
        return true
    end
    if weight <=4 and dis() > 8 then
        return true
    end
return false
end

function bangda(weight)
    if cd("����ͷ") or dis()>20 then
        return false
    end
    if (tstatep("�ɿ���") and (cd("��Ծ��Ԩ") or theig()< -5)and dis() > 5 and dis() <= 20) and kekongZT() then
        return true
    end
    if (cd("�����޹�") and buff("��ϼ") and mana()<30) then
        return true
    end
    if (weight <=4 and dis() > 5 and dis() <= 20) then
        return true
    end
    return false
end


function macro(weight)




    kotabreak(0, 20, "����ͷ")


    if (duobi() or life()<50 or ally())  then
        if norela("����") then		--�����ǰĿ�겻�Ƕ���
            skill("����Ϸˮ",2)
        else
            skill("����Ϸˮ")
        end
    end

    if nocd("������") and life()>30 and model ~= 2 and weight >4 and (state("����") or tstatep("�����") or dis()>25 or nofight() or (cd("����ͷ")and cd("������") and cd("�����޹�")))
    then
        if dis()<=5 then
            skill("5508")--������
        end
        StopMove()
        skill("������")--������
        return 1
    end

    if life()<=30 and buff("����Ϸˮ")==false and buff("��Х����")==false and nocd("Ц���")
    then
        StopMove()
        skill("Ц���")
        return 1
    end




    skill("Ǳ������")--����
    skill("5362")--����

    --skill("5265")--����
    --skill("5522")
    if dis() <= 5 and (mana() >= 40 and (tstatep("�����")and  weight>10 and buffsn("��ͷ")<4)) then
        skill("5367")--��������
        --skill("5258")--����
    end

    if dis() <= 5 and mana() >= 30 and (weight <= 14  or ((buffsn("��ͷ")>=4 or tstatep("�����") )and weight <=10)) then
        skill("����ң")
        if tstatep("�����")  then
            skill("5258")--����
        end
        skill("8490")--����
        return 1
    end


    if (dis() <= 6 and weight < 3) or ((life() < 70 or duobi()) and buff("��Х����") == false and statep("������|�޼���"))
    then
        skill("��Х����")
    end

    if mana() >= 20 and kekongZT() and  tstateid()~=26 and tstateid()~=27 and ((dis() >5 and dis() <= 15) or (buff("�����л�") == false and tstatep("�����")))
    then
        skill("��ս��Ұ")
    end

    if dis() <= 6 and face()==0 and (kongzhiTime(1.8) or noSkillTime(1.8)) then
        skill("����·")
    end





     yanyuxing(weight)

    if mana() <30 and dis() <= 8 and tstatep("�����") and  cd("�����޹�")  and cd("����ͷ")
    then
        skill("��Ȯ����")
    end

    if longyue(weight)
    then
        skill("��Ծ��Ԩ")
    end
    ----�ٻ���
    --if buff("6460") == false then
    --    skill("6945")--����
    --end
    --if (nocd("����ͷ") and tstatep("�ɿ���") and  ((cd("�����޹�") and cd("��������")) or (mana() < 30 and dis() > 5 and dis() <= 20))) or (weight < 4 and dis() > 4 and dis() <= 20) or (tstatep("�ɿ���") and dis() >= 5 and dis() <= 20)
    if bangda(weight)
    then
        skill("����ͷ")
        return 1
    end
    skill("5258")--����
    if dis() <= 5 then
        if tstatep("�����") then
            skill("���˫��")
        else
            skill("�����޹�", 4)
        end
       --end
    end
    return 1

end
function death()
    ---��������
    local select = rlast2(0, 30, "�׼�", "�ж�", 4, 30)
    select = rlast2(0, 30, "�͹Ǿ�", "�ж�", 8, 60)
    select = rlast2(0, 30, "��¥��Ӱ", "�ж�", 4, 30)
    select = rlast2(0, 30, "��¥��Ӱ", "�ж�", 4, 30)
    select = rlast2(0, 30, "��¥��Ӱ", "�ж�", 4, 30)
    select = rlast2(0, 30, "��¥��Ӱ", "�ж�", 4, 30)
    if select ~= nil then
        local player = GetClientPlayer()
        SetTarget(player,select,4)
    end
end

function tab_youxian()
    local player = GetClientPlayer()
    local t = GetAllPlayer()		--����һ��������������ֵ��NPC����
    print("--------------�����Ϣ--------------")
    local select
    local lastWeight=1000
    for _,v in ipairs(t) do
        local x,y,z = GetCoords(v)	--����xyz����
        local szName = GetName(v)	--����
        local dwID = GetID(v)		--��Ҷ���ID (ֻ������NPC)
        print("���Id:",dwID)
        local state = GetState(v)   --�����Ϊ״̬
        local life, maxlife = GetLife(v)	--��ǰ�������Ѫ
        local LifeBfb = (life/maxlife)*100        --Ѫ���ٷֱ�
        local mana, maxmana = GetMana(v)	--��ǰ���������
        local rage = GetRage(v)				--ŭ��
        local energy = GetEnergy(v)			--���ֵ
        local qidian = GetQiDian(v)			--����
        local sun = GetSun(v)				--����
        local moon = GetMoon(v)				--�»�
        local fsun = GetFullSun(v)			--����
        local fmoon = GetFullMoon(v)		--����
        local sp = GetSprintPower(v)		--����ֵ
        local mountID = GetMount(v)			--�ڹ�ID
        local face = GetAngle(v)			--����(0-255)
        local school = GetSchool(v)			--����
        print(LifeBfb)
        local guanxi = GetRelation(player, v)
        local weight=10                     --Ȩ��
        --��ϵID��Ӧ�Ĺ�ϵ
        --     [2] = "�Լ�",
        --     [4] = "�Ѻ�",
        --     [16] = "�ж�",
        --     [32] = "ͬ��",
        --     [68] = "����"

        --ѡ��ж�
        if guanxi == 16 and selectID~= dwID and state~=16 then

            if LifeBfb>=10 and  LifeBfb<20 then
                weight=weight-9
            end
            -- Output("5")
            if LifeBfb>=20 and  LifeBfb<30 then
                weight=weight-8
            end
            -- Output("6")
            if LifeBfb>=30 and  LifeBfb<40 then
                weight=weight-7
            end
            -- Output("7")
            if LifeBfb>=40 and  LifeBfb<50 then
                weight=weight-6
            end
            -- Output("8")
            if LifeBfb>=50 and  LifeBfb<60 then
                weight=weight-5
            end
            if LifeBfb>=60 and  LifeBfb<70 then
                weight=weight-4
            end
            if LifeBfb>=70 and  LifeBfb<80 then
                weight=weight-3
            end
            if LifeBfb>=80 and  LifeBfb<90 then
                weight=weight-2
            end
            if LifeBfb>=90 and  LifeBfb<100 then
                weight=weight-1
            end
            --վ=1
            --��=3
            --��=4
            --����=8
            --����=9
            --����=10
            --������=11
            --��=12
            --����=13
            --����=14
            --����=15
            --��=16
            --�Ṧ=17
            --����=18
            --������ֱ=26
            --����ֱ=2
            if (state ==9 or state==12 or state ==20 ) then
                weight = weight-5
            end
            if (state ==12 or state ==13) then
                weight = weight-4
            end
            if (state ==14 or state ==11 or state ==11) then
                weight = weight-2
            end
            print(weight,lastWeight)
            if weight<lastWeight then
                select = dwID
                lastWeight = weight
            end

        end
    end
    selectID =  select
    SetTarget(player,select,4)
    Delay(900)
    --print(selectID)
    print("ѡ��Ŀ��Ϊ:",selectID)

end
--function tab2()
--    local player = GetClientPlayer()
--    local selfId = GetID(player)
--    local t = GetAllPlayer()		--����һ��������������ֵ��NPC����
--    print("--------------�����Ϣ--------------")
--    for _,v in ipairs(t) do
--        local x,y,z = GetCoords(v)	--����xyz����
--        local szName = GetName(v)	--����
--        local dwID = GetID(v)		--��Ҷ���ID (ֻ������NPC)
--        local state = GetState(v)   --�����Ϊ״̬
--        local life, maxlife = GetLife(v)	--��ǰ�������Ѫ
--        local mana, maxmana = GetMana(v)	--��ǰ���������
--        local rage = GetRage(v)				--ŭ��
--        local energy = GetEnergy(v)			--���ֵ
--        local qidian = GetQiDian(v)			--����
--        local sun = GetSun(v)				--����
--        local moon = GetMoon(v)				--�»�
--        local fsun = GetFullSun(v)			--����
--        local fmoon = GetFullMoon(v)		--����
--        local sp = GetSprintPower(v)		--����ֵ
--        local mountID = GetMount(v)			--�ڹ�ID
--        local face = GetAngle(v)			--����(0-255)
--        local school = GetSchool(v)			--����
--        local guanxi = GetRelation(selfId, dwID)
--
--    --��ϵID��Ӧ�Ĺ�ϵ
--    --     [2] = "�Լ�",
--    --     [4] = "�Ѻ�",
--    --     [16] = "�ж�",
--    --     [32] = "ͬ��",
--    --     [68] = "����"
--
--        if guanxi ~= "�ж�"then
--            continue
--        end
--
--
--    end
--
--    --SetTarget(player,Ŀ��ID,4)
--
--end

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

function tab(weight)
    --local player = GetClientPlayer()
    --local targerType,targerId,targerObj = GetTarget(Player)
    --print(targerId)
    if checkype("nil") then
        --settar("���»�Ҫ��")
        if rlast2(0, 20, "����", "�ж�", 0, 3) or rlast2(0, 20, "��Ӱ����", "�ж�", 0, 3)then
            SetTarget(player,selectID,4)
            return 1
        end
        tab_youxian()
        print("-----------------------Ŀ��ѡ��nil")
    else
        --savetar("���»�Ҫ��")	--��ǰĿ�걣��Ϊ"���»�Ҫ��"
        --selectID = targerId;
    end
    local chaofeng = {"�紵��",
                      "����",
                      "�����",
                      "Ħڭ����",
                      "���",
                      "��ȥ����",
                      "�ȱ�Ը",
                      "��ʥ��",
                      "������",
                      "̰ħ��",
                      "����",
                      "Ħڭ",
                      "ִ�Բ���",
                      "��ħ����",
                      "֪������",
                      "�����ն�",
                      "����ɽ����",
                      "��ħ����",
                      "�齭��",
                      "����",
                      "������"

    }


     --ktarget("�ж�", 30, 40)		--ѡ��20���ڣ�Ѫ��С��30%�����
    if (rela("����") and cd("����Ϸˮ")) then
        print("-----------------------rela(����) and cd(����Ϸˮ)")
        tab_youxian()
    end
    --��ȡĿ���״̬ID
    if tstateid() == 16 then
        --���Ŀ������
        print("-----------------------���Ŀ������")
        tab_youxian()
    end
    if theig()<-7 and cd("��ҡֱ��") and tstatep("�����") and noexplast("��ҡֱ��", 3)then
        tab_youxian()
    end

    if weight >30 then
        tab_youxian()
    end
    if nocd("����Ϸˮ") and rcheck(0, 20, "����", "�뾭�׵�|�����ľ�|�����|��֪", 0, 60) then
        savetar("����")	--��ǰĿ�걣��Ϊ"���»�Ҫ��"
        ktarget("����", 20, 60)
        --model = 2
    end


end

--�ű�ѡ��
attribute = {
    {
        attri_name = "tab����",
        attri_explain = "tab����"
    }
}

function Main()
    ---����ȷ����˭
    ---��ȷ����ô��
    ---1:ѹѪ��
    ---2:������
    ---3:����
    local weight = getWeight()
    tab(weight)
    --print("Ȩ��:",weight)
    --print(string.format("Ȩ��:%d",weight))

    --�ж϶���
    if otatype("right") or otatype("left") then
        --print("������")
        --tab_youxian()
        return 1
    end
    if buff("����������") ==false then
        skill("����������")
    end

    scenef()--����Ŀ��

    if statep("�����") and duobi() then
        skill("��Ծ��Ԩ")
        skill("����ͷ")
        skill("������ʤ")
        skill("��̨���")
        skill("ӭ�����")
        skill("����")
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
    --���������Ŀ����
    if novisble() then
        skill("��ҡֱ��")
        jumpf()
    end
    if theig()<-6 and dis2()<=4 then
        skill("��ҡֱ��")
        jumph()
    end

    if  tbuff("����")==true  then
        return 1
    end

    --if nogcd("�����") then
    --    print("GCD")
    --    return 1
    --end
    --print("DPS")
    macro(weight)
end