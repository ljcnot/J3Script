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
local ttarget
local ttclass
function jiekong()
    if (GetSkillGCD("大道无术") + gcdsj) < dingshenTime() then
        return true
    end
    return false
end

function shengtaiji()
    ---生太极
    if cdEX("生太极") then
        return false
    end
    if  not buff("生太极") then
        Cast("生太极",true,true)
    end

    return false
end
function pocangqiong()
    ---破苍穹
    if cdEX("破苍穹") then
        return false
    end
    if  not buff("破苍穹") then
        Cast("破苍穹",true,true)
    end
    return false
end

function zhenshanhe()
    ---镇山河
    if cdEX("镇山河") then
        return false
    end
    local wudi  = findPartforHp(30)
    if wudi  then
        CastXYZ("镇山河",wudi.nX,wudi.nY,wudi.nZ,true)
    end
    if  life()<=30 and not statep("减伤") then
        Cast("镇山河",true,true)
    end
    if  life()<=20 then
        Cast("镇山河",true,true)
    end
    return false
end
function sixianglunhui()
    ---四象轮回
    if dis()>25 then
        return false
    end
    if buff("雨集") then
        return true
    end
    if state("站立") then
        return true
    end
    return false
end
function liangyihuaxing(weight)
    ---两仪化形
    if dis()>20 then
        return false
    end
    if qidian()>4 and weight<=10 then
        return true
    end
    return false
end
function taijiwuji()
    ---太极无极
    if dis()>20 then
        return false
    end
    if not sixianglunhui() then
        return true
    end
    return false
end
function sancaihuasheng(weight)
    ---三才化生
    if dis()>8 or cdEX("三才化生")  then
        return false
    end
    if not tstate("眩晕|定身|击倒|锁足") and  not tstatep("免控") then
        --print("当前目标打断")

        return true
    end
    if weight<=3 then
        return true
    end
    return false
end
function liuheduzun()
    ---六合独尊
    if dis()>20 or cdEX("六合独尊") or not state("站立")  then
        return false
    end
    if tstate("眩晕|定身|击倒|锁足") and noSkillTime(1.4) then
        return true
    end
    if death(target) and tstate("眩晕|定身|击倒|锁足") then
        return true
    end
    return false
end
function qixinggongrui(weight)
    ---七星拱瑞
    if  cdEX("七星拱瑞") or not state("站立") then
        return false
    end
    if not tstate("眩晕|击倒|定身") and not tstatep("免控") and ObjCastTime(this_player,369,14) then
        return true
    end
    if dis()<=25 and tmount("离经易道|云裳心经|补天诀|相知") and  tbuff("疾电叱羽") and not tstatep("免控")  then
        return true
    end
    if not tmount("离经易道|云裳心经|补天诀|相知") and weight <= 10 then
        local diduinaima = FindPlayer(25, "离经易道|云裳心经|补天诀|相知", "敌对")
        if diduinaima and not objState(diduinaima,"眩晕|击倒|定身") and not objStatep(diduinaima,"沉默") and not objStatep(diduinaima,"封内")  and not objStatep(diduinaima,"缴械")  and not objStatep(diduinaima,"免控") then
            CastTo("七星拱瑞", diduinaima, true)
        end
    end
    if tmount("离经易道|云裳心经|补天诀|相知") and weight <= 10 then
        local nosee = findNoSeediren(25)
        if nosee and not objState(nosee,"眩晕|击倒|定身") and not objStatep(nosee,"免控") then
            CastTo("七星拱瑞", nosee, true)
        end
    end
    return false
end
function wanshibujie()
    ---万世不竭
    if cdEX(18796) or (not HaveTalent("万物") and not state("站立")) then
        return false
    end
    if not buff("气剑") then
        return true
    end
    return false
end
function wanshibujieBoom(weight)
    ---万世不竭
    if bufftime("气剑")<=3 then
        return true
    end
    if weight<=3 then
        return true
    end
    return false
end
function wufangxingjing(weight)
    ---五方行尽
    if dis()> 20 or cdEX("五方行尽") then
        return false
    end
    if  not tstate("眩晕|定身|击倒|锁足") and  not tstatep("免控") then
        return true
    end
    if weight<=7 then
        return true
    end
    return false
end
function jiuzhuanguiyi(weight)
    ---九转归一
    if dis()> 8 or cdEX("九转归一") then
        return false
    end
    if ttarget ~= nil and IsParty(ttarget) and (ttlife() < 60 or ttlife()< 40)then
        return true
    end
    if life()<= 50 then
        return true
    end
    if needTui(target) then
        return true
    end
    if tmount("离经易道|云裳心经|补天诀|相知") and  weight<=3 and not  tstate("定身|眩晕|击倒") then
        return true
    end
    if not tmount("离经易道|云裳心经|补天诀|相知") and  weight<=3 then
        local diduinaima = FindPlayer(8, "离经易道|云裳心经|补天诀|相知", "敌对")
        if diduinaima and not objState(diduinaima,"眩晕|击倒|定身") and not objStatep(diduinaima,"免控") then
            CastTo("九转归一", diduinaima, true)
        end
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
    if cdEX2("紫气东来") or buff("紫气东来")  then
        return false
    end
    if qixinggongrui(weight) and seeObjForEnemy(this_player)>0 then
        return true
    end
    if liuheduzun() then
        return true
    end
    if weight<=7 then
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
function baguadongxuan(weight)
    ---八卦洞玄
    if not HaveTalent("八卦洞玄") or cdEX("八卦洞玄") then
        return false
    end
    --遍历队伍成员
        for k, v in ipairs(GetAllPlayer()) do
            if IsPlayer(v.dwID) and IsEnemy(v) and not objState(v, "重伤") and GetDist(g_player, v) < 20 and IsVisible(g_player, v)   then
                if (objIsota(v) or (tlife() <= 100 and qidian()>4) or (weight <= 5 and qidian()>3)  ) and  (objmount(v, "补天诀|离经易道|相知|云裳心经") or not IsInArena() ) then
                    --先保存当前对象
                    CastTo("八卦洞玄", v, true)
                end
                if objIsotaDesc(v,"平沙落雁|杯水留影") and objmount(v, "莫问") then
                    --先保存当前对象
                    --print("切目标打断")
                    CastTo("八卦洞玄", v, true)
                end
            end
        end
    if tstate("锁足|眩晕|定身|击倒") and not tstatep("免封内") then
        return true
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
        skillEX3("紫气东来")
    end
    if jiuzhuanguiyi(weight) then
        skillEX("九转归一")
    end
    if qixinggongrui(weight) then
        skillEX("七星拱瑞")
    end
    if liuheduzun(weight) then
        skillEX("六合独尊")
    end
    if wanshibujieBoom(weight) then
        skill(18983)
    end

    if wufangxingjing(weight) then
        skillEX("五方行尽")
    end
    if sancaihuasheng(weight) then
        skillEX3("三才化生")
    end
    if liangyihuaxing(weight) then
        skillEX("两仪化形")
    end
    if taijiwuji() then
        skill("太极无极")
    end
    if sixianglunhui() then
        skill("四象轮回")
    end
    if not cdEX("梯云纵") and not buff("梯云纵") then
        Cast("梯云纵", true, false)
    end
    if cdEX("扶摇直上") == false then
        Cast("扶摇直上", true, false)
    end
end
function seurvival(weight)
    ---生存向技能
    if zhenshanhe() then

    end
    if shengtaiji() then

    end
    if pocangqiong() then

    end
    if wanshibujie() then
        skill(18796)
    end
    if zuowangwuwo() then
        skill("坐忘无我")
    end
    if pinxuyufeng(weight) then
        skill("凭虚御风")
    end
end



function tab(weight)
    if objState(target, "重伤") or tbuff("雷霆震怒") or tbuff("南风吐月") or tbuff("镇山河") then
        findTargetforRange(30)
        --print("目标重伤")

    end
    --if target == nil and save_target ~= nil then
    --    SetTarget(save_target)
    --end

    -----上次切换目标大于5秒才会换目标
    --if weight >= 50 and (GetTickCount() - lastSelectTime) > 5000 then
    --    print("目标减伤过高")
    --    lastSelectTime = GetTickCount()
    --    findTarget(true)
    --end

    if tlife() > 20 and not tmount("离经易道|云裳心经|补天诀|相知") then
        findTargetforHp(20)
    end
end

--Main函数，1个参数是自己的玩家对象，每秒调用16次
function Main(player)
    this_player = player
    target,tclass = setAll(player)
    if target then
        ttarget, ttclass = GetTarget(target)
    end
    local weight = getWeight(false)
    ---八卦洞玄
    if baguadongxuan(weight) then
        skillEX("八卦洞玄")
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

    if target and weight<=5 then
        RemoteCall("集火", target.dwID)	--jihuo相当于指令，是必须的，后面的参数没有或者传多少个都行
    end
    if GetOption("自动切换") then
        tab(weight)
    end
    seurvival(weight)


    if tbuff("盾立") or tbuff("无明魂锁") or tbuff("雷霆震怒")  then
        StopAction()
        return
    end
    --if ota("云飞玉皇") then
    --    MoveAction_StopAll()
    --    return
    --end
    --跟随当前目标
    if ota("万世不竭") or objState(target, "重伤") then
        return
    end



    --if his() > 6 and buff("弹跳") then
    --    Jump()
    ----end
    --if GetHeight(player) > 6 and dis() <= 4 then
    --    Jump()
    --end
    if target and IsParty(target) then
        return
    end
    --TurnTo(target)
    DPS(weight)
end

--end

--这个回调函数会收到RemoteCall发送的信息
--SenderID 发送者的ID
--SenderName 发送者的名字
--tInfo 数据表，里面是调用RemoteCall传的参数
function OnRemoteCall(SenderID, SenderName, tInfo)
    if SenderID ~= g_player.dwID then	--如果发送者不是自己
        if tInfo[1] == "集火" then	--1对应RemoteCall的第一个参数
            SetTarget(tInfo[2])	--2对应RemoteCall的第二个参数
        end
    end
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