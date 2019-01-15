local laststate
--Main函数，1个参数是自己的玩家对象，每秒调用16次
function Main(player)
    local state = GetState(player)
    if laststate~=state then
        laststate = state
        print(state)
    end
    print(GetSkillSCD("梦泉虎跑"))
end


--释放技能回调函数，任意对象释放技能时调用
function OnCast(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)
    print(dwSkillID)

end


--开始读条回调函数，任意对象开始读条时调用
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end