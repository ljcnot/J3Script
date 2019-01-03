
--Main函数，1个参数是自己的玩家对象，每秒调用16次
local lastState
function Main(player)
    --state = GetState(player)
    --if string.find("冲刺", state) == nil then
    --    print("不在冲刺状态")
    --end
    local target, tclass = GetTarget(player)
    --function dis()
    --    return GetDist(target)
    --end
    FollowTarget()
    if GetDist(target)<2 then
        print(IsBack(target))
        if IsBack(target) then
            print("背面")
            MoveForwardStop()
        else
            print("正面")
            MoveForwardStart()

        end
    end

    --MoveForwardStop()
    --if state ~= lastState then
    --    lastState = state
    --end
end


--释放技能回调函数，任意对象释放技能时调用
function OnCast(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)

end


--开始读条回调函数，任意对象开始读条时调用
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end