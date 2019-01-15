local laststate
--Main函数，1个参数是自己的玩家对象，每秒调用16次
local this_player
AddOption("风来吴山")
AddOption("风来吴山2")
AddOption("风来吴山3")
function buff(list)
   local mbuff = GetBuff(this_player)
    return GetBuffTime(mbuff, list) > 0
end

function Main(player)
    this_player = player
    local state = GetState(player)
    if laststate~=state then
        laststate = state
        print(state)
    end

    --print("执行前",GetTickCount())
    --GetOption("风来吴山")
    --GetOption("风来吴山2")
    --GetOption("风来吴山3")
    --print("执行后",GetTickCount())
    --if GetSkillSCD("泉凝月")>0 then
    --    print("泉凝月CD",GetTickCount())
    --end
    --if buff("泉凝月") then
    --    print("泉凝月buff",GetTickCount())
    --end
end


--释放技能回调函数，任意对象释放技能时调用
function OnCast(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)
    --CasterID 释放技能的角色ID
    --dwSkillID 技能ID
    --dwLevel 技能等级
    --nPastFrame 从服务端发出到现在已过去的帧数
    --tClass 技能释放的目标类型(COORD, NPC, PLAYER)，这个和技能类型有关
    --tIDnX 如果是需要目标的技能，这个是技能的目标ID，如果是需要一个位置释放的技能，这个是x坐标
    --nY y坐标，不是坐标类型的技能无效
    --nZ z坐标，不是坐标类型的技能无效
    --比如有个技能123，类似撼地之类的技能，其实是个二段技能，起跳，落地之后才会造成眩晕
    --起跳到落地有8帧（0.5秒），你想躲这个技能（聂云，后跳什么的）
    local myid = GetMyID()
    local duobi = {18322,1649,1647}
               ---鹤归孤山 醉月 惊涛
    if dwSkillID == 3089 and tIDnX == myid then  --如果是对我释放，这个是起跳阶段的技能ID
        --如果过去的帧数小于4，总共8帧，大于4说明网速太差，已经躲不掉了
        --这里设为4只是演示，实战中要自己尝试
        --if nPastFrame < 4 then
            Cast("蹑云逐月",true,true)  --后跳
        --end
    end

    --print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --输出释放信息
end


--开始读条回调函数，任意对象开始读条时调用
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end