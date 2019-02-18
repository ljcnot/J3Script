LoadLib("Macro\\封装函数.lua")
local laststate
--Main函数，1个参数是自己的玩家对象，每秒调用16次
function Main(player)
    --skill(5508)
end


--释放技能回调函数，任意对象释放技能时调用
function OnCast(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)
    --CasterID 开始读条的角色ID
    --dwSkillID 技能ID
    --dwLevel 技能等级
    --nLeftFrame 剩余帧数
    --tClass 技能释放的目标类型(COORD, NPC, PLAYER)，这个和技能类型有关
    --tIDnX 如果是需要目标的技能，这个是技能的目标ID，如果是需要一个位置释放的技能，这个是x坐标
    --nY y坐标，不是COORD类型无效
    --nZ z坐标，不是COORD类型无效
    --比如你知道一个技能ID是123，是需要目标的技能，判断是不是对自己释放
    --local duobi = "3090|3089"
    if  tIDnX == g_player.dwID then  --如果有人开始读条123技能，目标是自己
        --print(string.find(duobi,dwSkillID))
        print("技能id:",dwSkillID)
        --print(string.find(duobi,dwSkillID)~=nil)
        --if string.find(duobi,dwSkillID)~=nil then
            --print("躲避")
        --    Cast("凌霄揽胜",true,true)
            CastTo("流光囚影", CasterID, true)  --打断他读条
        --Cast(9007)  --后跳
            Cast(3973)
        --end
    end

end



--开始读条回调函数，任意对象开始读条时调用
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end