LoadLib("Macro\\封装函数.txt")
local target
local tclass
local this_player
local gcdsj = 0.1 --gcd时间
local lastSelectTime = 0
local save_target
local isRun = false
local isDanger = false
local jiaoxieNai = false
local lastWegiht = 10
local isChangzhen = true
function bizhen(obj)
    ---彼针
    if objDis(obj)>20 or cdEX("彼针") or (not state("站立") and not buff("行气血"))then
        return false
    end
    if objBuff(obj,"握针") and objBufftime(obj,"握针")>1.5 and objBufftime(obj,"握针")<8 then
        return true
    end
    return false
end
function wozhen(obj)
    ---握针
    local distance = 20
    if HaveTalent("生息") then
        distance = 24
    end
    if objDis(obj)>distance or (objBuff(obj,"握针") and objBufftime(obj,"握针")>1.5)  then
        return false
    end
    return true
end
function tizhen(obj)
    ---提针
    if objDis(obj)>20  or (not state("站立") and not buff("水月无间") )then
        return false
    end
    if objLife(obj)<=80 then
        return true
    end
    return false
end
function changzhen(obj)
    ---长针
    if objDis(obj)>24  or (not state("站立") and not buff("水月无间") )then
        return false
    end
    if HaveTalent("微潮")  and objBuff(obj,"握针") and objBufftime(obj,"握针")>3 and countNotBuffByPart(obj,"握针",15)>=2 then
        return true
    end
    return false
end

function chunnihuhua(obj)
    ---春泥护花
    if cdEX("春泥护花")  or objStatep(obj,"减伤") or objStatep(obj,"单次免伤") then
        return false
    end
    if objLife(obj)< 60 then
        return true
    end
    return false
end
function zheyelonghua(obj)
    ---折叶笼花
    if not HaveTalent("折叶笼花") or cdEX("折叶笼花") then
        return false
    end
    if objLife(obj)<=30 and not objStatep(obj,"无敌") and not objStatep(obj,"减伤80") then
        return true
    end
    return false
end
function bishuitaotian()
    ---碧水滔天
    if cdEX("碧水滔天") then
        return false
    end
    if mana()<=40  then
        return true
    end
    return false
end
function shuiyuewujian(obj)
    ---水月无间
    if cdEX("水月无间") then
        return false
    end
    if objLife(obj)<=50 and not objStatep(obj,"减伤")  then
        return true
    end
    return false
end
function DPS(weight)
    if target then
    if shuiyuewujian(target) then
        skill("水月无间")
    end
    if zheyelonghua(target) then
        skill("折叶笼花")
    end
    if chunnihuhua(target) then
        skill("春泥护花")
    end
    if wozhen(target) then
        skillEX4("握针")
    end
    if bizhen(target) then
        skill("彼针")
    end
    if tizhen(target) then
        skill("提针")
    end
    if changzhen(target) then
        skill("长针")
    end
        if not wozhen(target)  and not tizhen(target) and not changzhen(target) then
            isChangzhen = true
        end
end
    if cdEX("扶摇直上") == false then
        Cast("扶摇直上", true, true)
    end
end
function seurvival()
    ---生存向技能
    if bishuitaotian() then
        skillEX2("碧水滔天")
    end
    if shuiyuewujian(this_player) then
        skillEX2("水月无间")
    end

    if zheyelonghua(this_player) then
        skillEX2("折叶笼花")
    end
    if skillEX2(this_player) then
        skillEX2("春泥护花")
    end
    if wozhen(this_player) then
        skillEX2("握针")
    end
    if bizhen(this_player) then
        skillEX2("彼针")
    end
    if tizhen(this_player) then
        skillEX2("提针")
    end
    if changzhen(this_player) then
        --print("11")
        skillEX2("长针")
    end

end



function tab()
        ---如果探梅没CD 并且目标是敌对
        local this_target
        local last_weight=10
        --遍历队伍成员
        for k, v in ipairs(GetAllMember()) do
            local weight = 10

            if IsPlayer(v.dwID) and IsParty(v) and objState(v, "重伤")==false and  GetDist(this_player, v) < 20 and IsVisible(this_player, v) then
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
                if objBuff(v,"内力躁动") or objBuff(v,"摧形元火") then
                    weight = weight - 10
                end
                if objBuff(v,"握针") and  objBufftime(v,"握针")<5 then
                    weight = weight -4
                end
                if  not objBuff(v,"握针")  and countNotBuffByPart(v,"握针",15)<2  then
                    weight = weight -2
                end
                if countNotBuffByPart(v,"握针",15)>=2 then
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

--Main函数，1个参数是自己的玩家对象，每秒调用16次
function Main(player)
    target,tclass = setAll(player)
    this_player = player
    seurvival()
    if isChangzhen and not tbuff("内力躁动") and  not tbuff("摧形元火") then
        tab()
    end
    DPS()
end

--end


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
    if dwSkillID == 142 and CasterID == myid then  --如果是对我释放，这个是起跳阶段的技能ID
        --print("222")
    	--如果过去的帧数小于4，总共8帧，大于4说明网速太差，已经躲不掉了
    	--这里设为4只是演示，实战中要自己尝试
    	--isChangzhen = true
    end

    --print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --输出释放信息
end


--开始读条回调函数，任意对象开始读条时调用
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end