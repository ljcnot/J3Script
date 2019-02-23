LoadLib("Macro\\封装函数.txt")
AddOption("自动跟随")
AddOption("目标切换")
--AddOption("自动面向")
--AddOption("自动跟随")

local target
local tclass
local this_player
local gcdsj = 0.2 --gcd时间
local lastSelectTime = 0
local save_target
local isRun = false
local isDanger = false

function jiekong()
    if (GetSkillGCD("大道无术") + gcdsj) > dingshenTime() then
        return false
    end
    return true
end

function shengtaiji()
    ---生太极
    if cdEX("生太极") then
        return false
    end
    if  not buff("生太极") then
        Cast("生太极",true,true)
    end
    if target then
        ---生太极,吞日月
        local npc,count = FindNpc(target, "气场生太极", 18, "自己")
        if count==0 then
            skillEX("生太极")
        end

    end
    return false
end
function zhuanqiankun()
    ---转乾坤
    if cdEX("转乾坤") then
        return false
    end
    if life()<=40 and not statep("减伤") then
        return true
    end
    return false
end
function tunriyue()
    ---吞日月
    if cdEX("吞日月") then
        return false
    end
    local diduinaima = FindPlayer(20, "离经易道|云裳心经|补天诀|相知|丐帮", "敌对")
    if diduinaima then
        local npc,count = FindNpc(diduinaima, "气场吞日月", 10, "自己")
        if count==0 then
            CastTo("吞日月",diduinaima,true)
        end
    end
    if boom()>3 then
        skill("吞日月")
    end
    return false
end
function sanhuantaoyue()
    ---三环套月
    if dis()>4 or cdEX("三环套月") or qidian()>=5 then
        return false
    end
    return true
end
function wanjianguizong()
    ---万剑归宗
    local distance = 6
    if HaveTalent("数穷") then
        distance = 8
    end
    if dis()>distance or cdEX("万剑归宗") then
        return false
    end
    if tlife()<=80 and not tstatep("减疗") then
        return true
    end

    if findRangeCount(6)>=2 then
        return true
    end
    if findMSRangeCount(6)>=1 then
        return true
    end
    return false
end
function wuwowujian()
    ---无我无剑
    if dis()>4  then
        return false
    end
    if tbuffCS("叠刃")<5 or tbufftime("叠刃")<10 then
        --print("叠刃")
        return true
    end
    if qidian()>=5 then
        return true
    end
    return false
end
function dadaowushu()
    ---大道无术
    if dis()>8 or cdEX("大道无术") or tstatep("免控")  then
        return false
    end
    if tstatep("定身") and jiekong() then
        return true
    end
    if not tstate("定身|眩晕|击倒") and death(target)  and qidian()>=3 then
        return true
    end
    if not tstate("定身|眩晕|击倒") and qidian()>=5 then
        return true
    end

    return false
end
function bahuangguiyuan(weight)
    ---八荒归元
    if dis()>12 or cdEX("八荒归元")  then
        return false
    end
    if weight<=10 then
        return true
    end
    return false
end
function renjianheyi()
    ---人剑合一
    if cdEX("人剑合一")  then
        return false
    end
    local npc,count
    if target then
     npc,count = FindNpc(target, "气场生太极|气场破苍穹|气场吞日月|气场碎星辰|气场镇山河|气场化三清", 6, "自己|队友|敌人")
    if npc and  objDis(npc)<=13 then

        if not tstatep("免控") and tstatep("定身") and jiekong() then
            return true
        end
        if not tstatep("免控") and not tstate("定身|眩晕|击倒") and tclass ~= NPC and death(target) then
            return true
        end
        if not tstatep("免控") and not tstate("定身|眩晕|击倒") and not cdEX("生太极") then
            return true
        end
    end
    end
    npc,count = FindNpc(this_player, "气场镇山河", 13, "敌人")
    if count>0  then
        return true
    end

    return false
end
function jianchongyinyang()
    ---剑冲阴阳
    if dis()>20 or cdEX("剑冲阴阳") or tstatep("免控")  then
        return false
    end
    local diduinaima = FindPlayer(20, "离经易道|云裳心经|补天诀|相知", "敌对")
    if death(diduinaima) then
        CastTo(diduinaima,true,true)
    end
    if not tstate("定身|眩晕|击倒")and tclass ~= NPC and death(target)  then
        return true
    end
    if not tstate("定身|眩晕|击倒") then
        return true
    end

    return false
end
function zuowangwuwo()
    ---坐忘无我
    if cdEX("坐忘无我") or buff("无我")  then
        return false
    end
    return true
end
function ziqidonglai(weight)
    ---紫气东来
    if cdEX("紫气东来")  then
        return false
    end
    if weight<=5 and qidian()<=1 then
        return true
    end
    return false
end
function pinxuyufeng(weight)
    ---凭虚御风
    if cdEX("凭虚御风")  then
        return false
    end
    if state("定身|锁足") and life()<=70 and not statep("减伤") then
        return true
    end
    if state("定身|锁足") and weight<=5 then
        return true
    end
    if life()<= 50 and not statep("减伤") then
        return true
    end
    return false
end

function jianfeijingtian(weight)
    ---剑飞惊天
    if not HaveTalent("剑飞惊天") or cdEX("剑飞惊天") then
        return false
    end
    if objOnHorse(target) and weight<=10 then
        --print("当前目标打断")

        return true
    end
    --遍历队伍成员
    for k, v in ipairs(GetAllPlayer()) do
        if IsPlayer(v.dwID) and IsEnemy(v) and not objState(v, "重伤") and GetDist(g_player, v) < 20 and IsVisible(g_player, v)   then
            if objIsota(v) and (objmount(v, "补天诀|离经易道|相知|云裳心经") or not IsInArena() ) then
                --先保存当前对象
                --print("切目标打断")

                CastTo("剑飞惊天", v, true)
            end
            if objIsotaDesc(v,"平沙落雁|杯水留影") and objmount(v, "莫问") then
                --先保存当前对象
                --print("切目标打断")
                CastTo("剑飞惊天", v, true)
            end
        end
    end

    return false
end
function xingtiandao(weight)
    ---行天道
    if not HaveTalent("行天道") or cdEX("行天道") then
        return false
    end
    if death(target) and kongzhi() then
        return true
    end
    if weight<= 10 and kongzhi() then
        return true
    end
    if target then
        local npc,count = FindNpc(target, "气场生太极|气场破苍穹|气场吞日月|气场碎星辰|气场镇山河|气场化三清", 20, "自己")
        if weight<= 7 and count>=2 then
            return true
        end
    end
    return false
end
function shuyunzhuyue()
    ---蹑云逐月
    if cdEX("蹑云逐月") then
        return false
    end
    if dis() > 16 then
        return true
    end
    return false
end
function DPS(weight)
    if ziqidonglai(weight) then
        skillEX2("紫气东来")
    end
    if dadaowushu() then
        skillEX("大道无术")
    end
    if renjianheyi() then
        --print("人剑合一")
        skillEX("人剑合一")
    end
    if xingtiandao(weight) then
        skill("行天道")
    end
    if jianchongyinyang() then
        skillEX("剑冲阴阳")
    end
    if bahuangguiyuan(weight) then
        skillEX("八荒归元")
    end
    --print("无我前")
    if wuwowujian() then
        --print("无我无剑")

        skill("无我无剑")
    end
    if wanjianguizong() then
        --print("万剑归宗")

        skillEX2("万剑归宗")
    end
    if sanhuantaoyue() then
        skill("三环套月")
    end
    if not cdEX("碎星辰")  then
        skillEX("碎星辰")
    end
    if target and shuyunzhuyue() then
        CastTo("蹑云逐月", target, false)
    end

    if cdEX("扶摇直上") == false then
        Cast("扶摇直上", true, true)
    end
end
function seurvival(weight)
    ---生存向技能
    if shengtaiji() then

    end
    if zhuanqiankun() then
        skill("转乾坤")
    end
    if tunriyue() then

    end
    if zuowangwuwo() then
        skill("坐忘无我")
    end
    if pinxuyufeng(weight) then
        skill("凭虚御风")
    end
end



function tab(weight)
    if objState(target, "重伤") or tbuff("雷霆震怒") then
        findTargetforRange(30)
        --print("目标重伤")

    end
    if target == nil and save_target ~= nil then
        SetTarget(save_target)
    end

    -----上次切换目标大于5秒才会换目标
    if weight >= 50 and (GetTickCount() - lastSelectTime) > 5000 then
        print("目标减伤过高")
        lastSelectTime = GetTickCount()
        findTarget(true)
    end

    if tlife() > 20 and not tmount("离经易道|云裳心经|补天诀|相知") then
        findTargetforHp(20)
    end
end

--Main函数，1个参数是自己的玩家对象，每秒调用16次
function Main(player)
    this_player = player
    target,tclass = setAll(player)
    local weight = getWeight(false)
    if jianfeijingtian(weight) then
        skillEX("剑飞惊天")
    end
    if weight>3 and femgche(player, "敌对") then
        if target then
            if femgche(target, "敌对") then
                BackTo(target)
            else
                --skill("流光囚影")
            end
        end
        --if GetOption("自动跟随") then
            MoveForwardStart()
        --end
        if state("眩晕|击倒|定身") then
            --Cast("暗尘弥散", true, true)
        end
        Cast("扶摇直上", true, true)
        Jump()
        Cast("蹑云逐月", true, true)

        --Cast(3973, true, true)
    end

    --print("weight:",weight)
    if GetOption("自动切换") then
        tab(weight)
    end
    seurvival(weight)
    if GetOption("自动跟随") then
        if  target and  femgche(target, "敌对") then
            TurnTo(target)
            isDanger = true
            if isRun then
                MoveAction_StopAll()
                isRun=false
            end
        else
            isDanger = false
            if target then
                TurnTo(target)
                isRun= true
                MoveForwardStart()
                toBack()
            else
                if isRun then
                    MoveAction_StopAll()
                    isRun=false
                end
            end

        end
    end

    if tbuff("盾立") or tbuff("无明魂锁") or tbuff("雷霆震怒") then
        StopAction()
        return
    end
    --if ota("云飞玉皇") then
    --    MoveAction_StopAll()
    --    return
    --end
    --跟随当前目标




    if his() > 6 and buff("弹跳") then
        Jump()
    end
    if GetHeight(player) > 6 and dis() <= 4 then
        Jump()
    end
    if target and IsParty(target) then
        return
    end
    DPS(weight)
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
    --local myid = GetMyID()
    --local skillList =
    --if dwSkillID == 123 and tIDnX == myid then  --如果是对我释放，这个是起跳阶段的技能ID
    --	--如果过去的帧数小于4，总共8帧，大于4说明网速太差，已经躲不掉了
    --	--这里设为4只是演示，实战中要自己尝试
    --	if nPastFrame < 4 then
    --		Cast(9007)  --后跳
    --	end
    --end

    --print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --输出释放信息
end


--开始读条回调函数，任意对象开始读条时调用
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end