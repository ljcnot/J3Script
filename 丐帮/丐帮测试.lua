LoadLib("Macro\\��װ����.lua")
local laststate
--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    --skill(5508)
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
            CastTo("������Ӱ", CasterID, true)  --���������
        --Cast(9007)  --����
            Cast(3973)
        --end
    end

end



--��ʼ�����ص��������������ʼ����ʱ����
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end