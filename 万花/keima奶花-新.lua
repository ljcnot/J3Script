LoadLib("Macro\\��װ����.txt")
local target
local tclass
local this_player
local gcdsj = 0.1 --gcdʱ��
local lastSelectTime = 0
local save_target
local isRun = false
local isDanger = false
local jiaoxieNai = false
local lastWegiht = 10
local isChangzhen = true
function bizhen(obj)
    ---����
    if objDis(obj)>20 or cdEX("����") or (not state("վ��") and not buff("����Ѫ"))then
        return false
    end
    if objBuff(obj,"����") and objBufftime(obj,"����")>1.5 and objBufftime(obj,"����")<8 then
        return true
    end
    return false
end
function wozhen(obj)
    ---����
    local distance = 20
    if HaveTalent("��Ϣ") then
        distance = 24
    end
    if objDis(obj)>distance or (objBuff(obj,"����") and objBufftime(obj,"����")>1.5)  then
        return false
    end
    return true
end
function tizhen(obj)
    ---����
    if objDis(obj)>20  or (not state("վ��") and not buff("ˮ���޼�") )then
        return false
    end
    if objLife(obj)<=80 then
        return true
    end
    return false
end
function changzhen(obj)
    ---����
    if objDis(obj)>24  or (not state("վ��") and not buff("ˮ���޼�") )then
        return false
    end
    if HaveTalent("΢��")  and objBuff(obj,"����") and objBufftime(obj,"����")>3 and countNotBuffByPart(obj,"����",15)>=2 then
        return true
    end
    return false
end

function chunnihuhua(obj)
    ---���໤��
    if cdEX("���໤��")  or objStatep(obj,"����") or objStatep(obj,"��������") then
        return false
    end
    if objLife(obj)< 60 then
        return true
    end
    return false
end
function zheyelonghua(obj)
    ---��Ҷ����
    if not HaveTalent("��Ҷ����") or cdEX("��Ҷ����") then
        return false
    end
    if objLife(obj)<=30 and not objStatep(obj,"�޵�") and not objStatep(obj,"����80") then
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
function shuiyuewujian(obj)
    ---ˮ���޼�
    if cdEX("ˮ���޼�") then
        return false
    end
    if objLife(obj)<=50 and not objStatep(obj,"����")  then
        return true
    end
    return false
end
function DPS(weight)
    if target then
    if shuiyuewujian(target) then
        skill("ˮ���޼�")
    end
    if zheyelonghua(target) then
        skill("��Ҷ����")
    end
    if chunnihuhua(target) then
        skill("���໤��")
    end
    if wozhen(target) then
        skillEX4("����")
    end
    if bizhen(target) then
        skill("����")
    end
    if tizhen(target) then
        skill("����")
    end
    if changzhen(target) then
        skill("����")
    end
        if not wozhen(target)  and not tizhen(target) and not changzhen(target) then
            isChangzhen = true
        end
end
    if cdEX("��ҡֱ��") == false then
        Cast("��ҡֱ��", true, true)
    end
end
function seurvival()
    ---��������
    if bishuitaotian() then
        skillEX2("��ˮ����")
    end
    if shuiyuewujian(this_player) then
        skillEX2("ˮ���޼�")
    end

    if zheyelonghua(this_player) then
        skillEX2("��Ҷ����")
    end
    if skillEX2(this_player) then
        skillEX2("���໤��")
    end
    if wozhen(this_player) then
        skillEX2("����")
    end
    if bizhen(this_player) then
        skillEX2("����")
    end
    if tizhen(this_player) then
        skillEX2("����")
    end
    if changzhen(this_player) then
        --print("11")
        skillEX2("����")
    end

end



function tab()
        ---���̽÷ûCD ����Ŀ���ǵж�
        local this_target
        local last_weight=10
        --���������Ա
        for k, v in ipairs(GetAllMember()) do
            local weight = 10

            if IsPlayer(v.dwID) and IsParty(v) and objState(v, "����")==false and  GetDist(this_player, v) < 20 and IsVisible(this_player, v) then
                if objLife(v) < 10 then
                    weight = weight - 10
                end
                if objLife(v) >= 10 and objLife(v) < 20 then
                    weight = weight - 9
                end
                -- Output("5")
                if objLife(v) >= 20 and objLife(v) < 30 then
                    weight = weight - 8
                end
                -- Output("6")
                if objLife(v) >= 30 and objLife(v) < 40 then
                    weight = weight - 7
                end
                -- Output("7")
                if objLife(v) >= 40 and objLife(v) < 50 then
                    weight = weight - 6
                end
                -- Output("8")
                if objLife(v) >= 50 and objLife(v) < 60 then
                    weight = weight - 5
                end
                if objLife(v) >= 60 and objLife(v) < 70 then
                    weight = weight - 4
                end
                if objLife(v) >= 70 and objLife(v) < 80 then
                    weight = weight - 3
                end
                if objLife(v) >= 80 and objLife(v) < 90 then
                    weight = weight - 2
                end
                if objLife(v) >= 90 and objLife(v) < 100 then
                    weight = weight - 1
                end
                if objBuff(v,"�����궯") or objBuff(v,"����Ԫ��") then
                    weight = weight - 10
                end
                if objBuff(v,"����") and  objBufftime(v,"����")<5 then
                    weight = weight -4
                end
                if  not objBuff(v,"����")  and countNotBuffByPart(v,"����",15)<2  then
                    weight = weight -2
                end
                if countNotBuffByPart(v,"����",15)>=2 then
                    weight = weight -3
                end
                end
            if last_weight>weight then
                last_weight =weight
                this_target = v
            end
        end
    if this_target then
        SetTarget(this_target)
        isChangzhen = false
    end
end

--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    target,tclass = setAll(player)
    this_player = player
    seurvival()
    if isChangzhen and not tbuff("�����궯") and  not tbuff("����Ԫ��") then
        tab()
    end
    DPS()
end

--end


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
    local myid = GetMyID()
    if dwSkillID == 142 and CasterID == myid then  --����Ƕ����ͷţ�����������׶εļ���ID
        --print("222")
    	--�����ȥ��֡��С��4���ܹ�8֡������4˵������̫��Ѿ��㲻����
    	--������Ϊ4ֻ����ʾ��ʵս��Ҫ�Լ�����
    	--isChangzhen = true
    end

    --print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --����ͷ���Ϣ
end


--��ʼ�����ص��������������ʼ����ʱ����
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end