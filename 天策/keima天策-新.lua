LoadLib("Macro\\��װ����.txt")

function jiekong()
    if (GetSkillGCD("��������") + gcdsj) > dingshenTime() then
        return false
    end
    if (GetSkillGCD("��������") + gcdsj) > yunxuanTime() then
        return false
    end
    return true
end
function chuanyun()
    ---����
    if dis()>4 or cdEX("����") then
        return false
    end
return true
end
function longying()
    ---����
    local distance = 4
    if HaveTalent("��") then
        distance = 8
    end
    if dis()>distance or cdEX("����") then
        return false
    end
    return true
end
function longya(weight)
    ---����
    if dis()>4 or zhanyi()<3 or cdEX("����") then
        return false
    end
    if weight<=10 then
        return true
    end
    return false
end

function cangyue(weight,target)
    ---����
    if dis()>4 or cdEX("����") or tstatep("���") or tstate("���") then
        return false
    end
    if target and needTui(target) then
        return true
    end
    if weight<=10 then
        return true
    end
    return false
end
function jirufeng(weight)
    ---�����
    if cdEX("�����") then
        return false
    end
    if state("ѣ��|����|��ֱ|����") and (life()<80 or weight<=8)then
        return true
    end
    return false
end
function hanrulei(weight)
    ---������
    if HaveTalent("����") ==false or cdEX("������") then
        return false
    end
    if weight<=6 then
        return true
    end
return false
end
function shourushan()
    ---����ɽ
    if  cdEX("����ɽ") or statep("����") or statep("�޵�") then
        return false
    end
    if life()<=60 then
        return true
    end
    return false
end
function xiaoruhu()
    ---Х�绢
    if  cdEX("Х�绢") or statep("����") or statep("�޵�") then
        return false
    end
    if life()<=40 then
        return true
    end
    return false
end
function yu()
    ---��
    if onHorse() or cdEX("��") or (not onHorse()) then
        return false
    end
    if boom()>2 then
        return true
    end
    return false
end
function tu(weight)
    ---ͻ
    if (onHorse()) or dis()<8 or dis()>25 or cdEX2("ͻ") or tstatep("���") or tstate("���") then
        return false
    end
    if weight<=10 then
        return true
    end
    return false
end
function ji(weight)
    ---��
    if (onHorse()) or dis()>30 or  cdEX("��") or tstatep("���") or tstate("���") then
        return false
    end
    if weight<=10 then
        return true
    end
    return false
end
function mie(weight)
    ---��
    if (onHorse()) or dis()>25 or  cdEX("��")  then
        return false
    end
    if weight<=8 then
        return true
    end
    return false
end
function zhanbafang()
    ---ս�˷�
    if (not onHorse() and HaveTalent("����")==false) or dis()>6 or  cdEX("ս�˷�") then
        return false
    end

    return true
end
function duanhunci()
    ---�ϻ��
    if dis()<8 or dis()>27  or cdEX("�ϻ��") or tstatep("���") or tstate("���") then
        return false
    end
    if tstate("ѣ��|����") and seeObjForPart(target)>0 and jiekong() then
        return true
    end
    if tstate("����|ѣ��|����") == false then
        return true
    end
    return false
end
function renchicheng()
    ---�γ۳�
    if  cdEX2("�γ۳�") then
        return false
    end
    if dis()>4 and statep("���")==false then
        return true
    end
    if cdEX("��") and cdEX("����") then
        return true
    end
    return false
end
function pojianzhen()
    ---�Ƽ���
    if dis()>4  or cdEX("�Ƽ���") or tstatep("���") or tstate("���") then
        return false
    end
    if tstate("����|ѣ��|����") and seeObjForPart(target)>0 and jiekong() then
        return true
    end
    if tstate("����|ѣ��|����") == false then
        return true
    end
    return false
end
function pili(weight)
    ---����
    if onHorse() or dis()>4 or cdEX("����") then
        return false
    end
    if weight<= 6 then
        return true
    end
    if tstatep("����") then
        return false
    end
    if tstatep("����")==false and weight<=8 then
        return true
    end
    return false
end
function pochongwei(weight)
    ---����Χ
    if (not onHorse()) or dis()>4 or cdEX("����Χ") then
        return false
    end
    if weight<= 3 then
        return true
    end
    if tstate("����") and weight<=8 then
        return true
    end
    return false
end
function mashang(weight)
    if pochongwei(weight) then
        skillEX("����Χ")
    end
    if duanhunci() then
        skillEX("�ϻ��")
    end
    if zhanbafang() then
        skill("ս�˷�")
    end
    if pojianzhen() then
        skill("�Ƽ���")
    end
end
function maxia(weight)
    ---����
    if tu(weight) then
        skillEX("ͻ")
    end
    if ji(weight) then
        skillEX("��")
    end
    if pili(weight) then
        skillEX("����")
    end
    if mie(weight) then
        skill("��")
    end
end
function DPS(weight,target)
    --if renchicheng() then
    --    skill("�γ۳�")
    --end
    if onHorse() then
        ---������
        mashang(weight)
    else
        ---������̬
        maxia(weight)
    end
    if cangyue(weight,target) then
        skill("����")
    end
    if longya(weight) then
        skill("����")
    end
    if longying() then
        skill("����")
    end
    if chuanyun() then
        skill("����")
    end
end
function seurvival(weight)
    ---��������
    if yu() then
        Cast("��",true,true)
    end
    if jirufeng(weight) then
        Cast("�����",true,true)
    end
    if hanrulei(weight) then
        Cast("������",true,true)
    end
    if shourushan() then
        Cast("����ɽ",true,true)
    end
    if xiaoruhu() then
        Cast("Х�绢",true,true)
    end
end
function tab(player)
    local target, tclass = GetTarget(player)
    if objState(target, "����") then
        findTargetforRange(30)
        --print("Ŀ������")

    end
end
--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    --if IsHotKeyDown(1) then
    --    local mbuff = GetBuff(player)
    --    CancelBuff(mbuff, "����")
    --    Jump()
    --end
   local target =  setAll(player)
    tab(player)
    --if target then
    --    TurnTo(target)
    --    MoveForwardStart()
    --    toBack()
    --end

    local weight = getWeight(true)
    seurvival(weight)
    DPS(weight,target)

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