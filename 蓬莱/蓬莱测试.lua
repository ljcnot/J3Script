
--Main������1���������Լ�����Ҷ���ÿ�����16��
local lastState
function Main(player)
    --state = GetState(player)
    --if string.find("���", state) == nil then
    --    print("���ڳ��״̬")
    --end
    local target, tclass = GetTarget(player)
    --function dis()
    --    return GetDist(target)
    --end
    FollowTarget()
    if GetDist(target)<2 then
        print(IsBack(target))
        if IsBack(target) then
            print("����")
            MoveForwardStop()
        else
            print("����")
            MoveForwardStart()

        end
    end

    --MoveForwardStop()
    --if state ~= lastState then
    --    lastState = state
    --end
end


--�ͷż��ܻص���������������ͷż���ʱ����
function OnCast(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)

end


--��ʼ�����ص��������������ʼ����ʱ����
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end