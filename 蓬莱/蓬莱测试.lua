local laststate
--Main������1���������Լ�����Ҷ���ÿ�����16��
function Main(player)
    local state = GetState(player)
    if laststate~=state then
        laststate = state
        print(state)
    end
    print(GetSkillSCD("��Ȫ����"))
end


--�ͷż��ܻص���������������ͷż���ʱ����
function OnCast(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)
    print(dwSkillID)

end


--��ʼ�����ص��������������ʼ����ʱ����
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end