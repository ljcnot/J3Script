
--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    --state = GetState(player)
    --print(player.nRunSpeed)
   --local target, tclass = GetTarget(player)
    Cast("������ɽ",true,true)

    print(GetSkillSCD("��Ȫ����"))
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
    local myid = GetMyID()
    local duobi = {18322,1649,1647}
               ---�׹��ɽ ���� ����
    if dwSkillID == 123 and tIDnX == myid then  --����Ƕ����ͷţ�����������׶εļ���ID
        --�����ȥ��֡��С��4���ܹ�8֡������4˵������̫��Ѿ��㲻����
        --������Ϊ4ֻ����ʾ��ʵս��Ҫ�Լ�����
        if nPastFrame < 4 then
            Cast(9007)  --����
        end
    end

    --print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --����ͷ���Ϣ
end


--��ʼ�����ص��������������ʼ����ʱ����
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end