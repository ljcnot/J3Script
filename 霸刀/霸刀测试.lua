LoadLib("Macro\\��װ����.lua")
AddOption("�Զ�����")
local save
local laststate
function shiziqiang(weight)
    --if  cdEX3("��Ԩ��ɷ") or cdEX("�����Ұ") or  cdEX("���Ӻ���") then
    --    return false
    --end
    --if weight <=10 then
    --    return true
    --end
    --
    --if weight<=7 then
    --    return true
    --end
    return true
end
--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    --local target, tclass = GetTarget(player)
    --if save==nil then
    --    save = target
    --else
    --    SetTarget(save)
    --end
    print(ObjCastTime(player,16608,2))


    --end
    --local func = function(a)
    --    print(a)	--1�����������123
    --end
    --DelayCall(3000, func, 123)	--�ӳ�1����������ĺ�������123��Ϊ����
end


--�ͷż��ܻص���������������ͷż���ʱ����
function OnCast(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)
    --CasterID ��ʼ�����Ľ�ɫID
    --dwSkillID ����ID
    --dwLevel ���ܵȼ�
    --nLeftFrame ʣ��֡��
    --tClass �����ͷŵ�Ŀ������(COORD, NPC, PLAYER)������ͼ��������й�
    --tIDnX �������ҪĿ��ļ��ܣ�����Ǽ��ܵ�Ŀ��ID���������Ҫһ��λ���ͷŵļ��ܣ������x����
    --nY y���꣬����COORD������Ч
    --nZ z���꣬����COORD������Ч
    --������֪��һ������ID��123������ҪĿ��ļ��ܣ��ж��ǲ��Ƕ��Լ��ͷ�
    --local duobi = "3090|3089"
    if  tIDnX == g_player.dwID then  --������˿�ʼ����123���ܣ�Ŀ�����Լ�
        --print(string.find(duobi,dwSkillID))
        print("����id:",dwSkillID)
        --print(string.find(duobi,dwSkillID)~=nil)
        --if string.find(duobi,dwSkillID)~=nil then
            --print("���")
        --    Cast("������ʤ",true,true)
        --    CastTo("������Ӱ", CasterID, true)  --���������
        --Cast(9007)  --����
        --    Cast(3973)
        --end
    end

end



--��ʼ�����ص��������������ʼ����ʱ����
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end