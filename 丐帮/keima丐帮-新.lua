LoadLib("Macro\\封装函数.txt")
local target
local tclass
local this_player
local gcdsj = 0.1 --gcd时间
local lastSelectTime = 0
local save_target
local isRun = false
local isDanger = false
local isdutiao=false
local laststate

function bogouchaotian()
    ---拨狗朝天
    if dis()>5 or mana()>30 then
        return false
    end
    return true
end
function kanglong(weight)
    ---亢龙有悔
    local distans = 4
    if HaveTalent("洪荒") then
        distans = 8
    end
    if dis()>distans or mana()<30 or target==nil or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if weight<= 10 or not tstatep("免控") then
        return true
    end
    return false
end
function tianxiawugou(weight)
    ---天下无狗
    if dis()>8 or mana()>30 or cdEX("天下无狗") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    return true
end
function bangdagoutou(weight)
    ---棒打狗头
    if dis()>20 or cdEX("棒打狗头") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if not tstate("冲刺") and not tstatep("免控") and mana()<30 and cdEX("天下无狗") then
        return true
    end
    if not tstate("冲刺") and  his()>8 and buff("烟霞") and mana()<10   then
        return true
    end
    if not tstate("冲刺") and  his()>8 and not buff("烟霞") and mana()>=10   then
        return true
    end
    if not tstate("冲刺") and buff("烟霞") and mana()<10   then
        return true
    end
    if not tstate("冲刺") and weight<=4 and dis()>5 then
        return true
    end
    if not tstate("冲刺") and not tstatep("免控") and dis()>5 then
        return true
    end
    return false
end
function shuquanxiaori(weight)
    ---蜀犬吠日
    if dis()>8 or cdEX("蜀犬吠日") or mana()>=10 or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if not tstatep("免控") then
        return true
    end
    return false
end
function equanlanlu(weight)
    ---恶犬拦路
    if dis()>10 or cdEX("恶犬拦路") or tstatep("封轻功") or jiuzhongxian(weight) or xiaozuikuang() then
    return false
    end
    if kongzhiTimeEX(1.5) then
    return true
    end
    return false
end
function longzhanyuye(weight)
    ---龙战于野
    if dis()>15 or cdEX("龙战于野")  or mana()<20  or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if not tstate("冲刺") and not buff("亢龙有悔") and weight>=4 then
        return true
    end
    if not tstate("冲刺") and dis()>5 and not longyueyuyuan(weight) and not bangdagoutou(weight)  then
        return true
    end
    return false
end
function longyueyuyuan(weight)
    ---龙跃于渊
    if dis()>20 or cdEX("龙跃于渊") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if not tstate("冲刺") and target and  objOnHorse(target) then
        return true
    end
    if not tstate("冲刺") and not tbuff("亢龙有悔") then
        return true
    end
    if not tstate("冲刺") and dis()>5 and not bangdagoutou(weight)  then
        return true
    end
    return false
end
function longyueyuyuanjiekong(weight)
    ---龙跃于渊
    if dis()>20 or cdEX("龙跃于渊") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if state("眩晕|定身|击倒|僵直") then
        return true
    end
    return false
end
function jiaolongfanjaing(weight)
    ---蛟龙翻江
    if dis()>5 or mana()<10 or kanglong(weight) or jiuzhongxian(weight) or xiaozuikuang()  then
        return false
    end
    if mana()>30 then
        return true
    end
    return false
end
function longxiaojiutian(weight)
    ---龙啸九天
    if  (not HaveTalent("无咎") and mana()<30 ) or cdEX("龙啸九天") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if life()<70 and not  statep("减伤") then
        return true
    end
    if dis()<=6 and weight<=3 then
        return true
    end
    return false
end
function chenglongxishui(weight)
    ---乘龙戏水
    if   cdEX("乘龙戏水") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if boom() >= 3 and life() <= 90 and statep("减伤") == false then
        return true
    end
    if boom() >= 2 and life() <= 70 and statep("减伤") == false then
        return true
    end
    if life() < 50 then
        return true
    end
    return false
end
function jiuzhongxian(weight)
    ---酒中仙
    if cdEX("酒中仙") or weight<=3 then
        return false
    end
    if not HaveTalent("宽野") and statep("免控") then
        return true
    end
    if HaveTalent("宽野") then
        return true
    end
    return false
end
function yanyuxing(weight)
    ---烟雨行
    if cdEX2("烟雨行") or buff("烟霞") or jiuzhongxian(weight) or xiaozuikuang() then
        return false
    end
    if not  kanglong(weight) and cdEX("棒打狗头") and cdEX("天下无狗") and mana()<30 then
        return true
    end
    return false
end
function yanyuxingzhuiren(weight)
    ---烟雨行
    if cdEX2("烟雨行")  or jiuzhongxian(weight) or xiaozuikuang()  then
        return false
    end
    if dis()>18 and bangdagoutou(weight) and target and objIsZhengmian(target) then
        return true
    end
    if dis()>10 and bangdagoutou(weight) and longyueyuyuan(weight) and target and objIsZhengmian(target) then
        return true
    end
    if state("锁足|僵直") then
        return true
    end
    return false
end
function xiaozuikuang()
    ---笑醉狂
    if cdEX("笑醉狂") then
        return false
    end
    if life() < 30 and not statep("减伤") then
        return true
    end
    if life() < 20 then
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

    skill("犬牙交错")

    if kanglong(weight) then
        skill("醉逍遥")
        skill("亢龙有悔")
    else
        if equanlanlu(weight) then
            skillEX("恶犬拦路")
        end
        if bangdagoutou(weight) then
            skill("棒打狗头")
        end
        if bogouchaotian(weight)then
            skill("拨狗朝天")
        end
        if tianxiawugou(weight) then
            skill("天下无狗")
        end

        if shuquanxiaori(weight) then
            skill("蜀犬吠日")
        end
        if longzhanyuye(weight) then
            skill("龙战于野")
        end
        if longyueyuyuan(weight) then
            skill("龙跃于渊")
        end
        if jiaolongfanjaing(weight) then
            skill("蛟龙翻江")
        end

        if yanyuxing(weight) then
            skill(5508)
        end
        if yanyuxingzhuiren(weight)then
            skillEX(5269)
        end
    end

    --if target and shuyunzhuyue() then
    --    CastTo("蹑云逐月", target, false)
    --end
    --if cdEX("扶摇直上") == false then
    --    Cast("扶摇直上", true, false)
    --end
end
function seurvival(weight)
    if longyueyuyuanjiekong (weight) then
        skill("龙跃于渊")
    end

    if longxiaojiutian(weight) then
        Cast("龙啸九天",true,false)
    end
    if chenglongxishui(weight) then
        Cast("乘龙戏水",true,false)
    end

end

function dutiao(weight)
    if (GetCastTime(g_player,5268)>0 and GetCastTime(g_player,5268)<2) or (GetCastTime(g_player,5270)>0 and GetCastTime(g_player,5270)<2 )  then
        isdutiao = false
        return
    end
    if jiuzhongxian(weight) then
        if dis()<=5 then
            skill(5508)--烟雨行
        end
        isdutiao = true
        SheildMoveKey(true)
        if state("站立") then
            Cast("酒中仙",true)
        else
            MoveAction_StopAll()
        end

        return true
    end
    if xiaozuikuang() then
        isdutiao = true
        SheildMoveKey(true)
        if state("站立") then
            Cast("笑醉狂",true,false)
        else
            MoveAction_StopAll()
        end
        return true
    end
    return false
end

function tab(weight)
    if objState(target, "重伤") or tbuff("雷霆震怒") then
        findTargetforRange(30)
        --print("目标重伤")

    end
    --if target and IsParty(target) then
    --    if target ~= nil then
    --        SetTarget(save_target)
    --    end
    --else
    --    if target ~= nil then
    --        save_target = target
    --    end
    --end
    if target == nil and save_target ~= nil then
        SetTarget(save_target)
    end
    --if life() <=40 then
    --	local naima = FindPlayer(40, "离经易道|云裳心经|补天诀|相知", "队友")
    --	if naima and GetDist(naima)>6 then
    --		SetTarget(naima)
    --		help = true
    --	else
    --		if help then
    --			findTargetforRange(8)
    --			help = false
    --		end
    --	end
    --end

    --print("当前目标是否是队友",IsParty(target))
    --if cdEX("探梅") and IsParty(target) and life() >40 then
    --	if save_target ~= nil then
    --		--换回保存的目标
    --		SetTarget(save_target)
    --		print("探梅完了,切回原来目标")
    --
    --		return 1
    --	else
    --		findTarget(false)
    --	end
    --	print("探梅完了")
    --end
    -----上次切换目标大于5秒才会换目标
    if tbuff("镇山河") and (GetTickCount() - lastSelectTime) > 5000 then
        print("目标减伤过高")
        lastSelectTime = GetTickCount()
        findTarget(true)
    end
    --
    --if IsDangerArea(target, "敌对") and (GetTickCount() - lastSelectTime) > 5000 then
    --    print("危险区域切换目标")
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
    local weight = getWeight(true)


    if dutiao(weight) then
        return 1
    end
    if isdutiao or objIsota(player) then
        return 1
    end
    SheildMoveKey(false)
    if weight>3 and femgche(player, "敌对") then
        if target then
            if femgche(target, "敌对") then
                BackTo(target)
            else
                skill(5269)
            end
        end
        MoveForwardStart()
        if state("眩晕|击倒|定身") then
            skill(5269)
        end
        Cast("扶摇直上", true, true)
        Jump()
        Cast("蹑云逐月", true, true)

        --Cast(3973, true, true)
    end

    tab(weight)
    seurvival(weight)
    if target and  femgche(target, "敌对") then
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
            --toBack()
        else
            if isRun then
                MoveAction_StopAll()
                isRun=false
            end
        end

    end
    if tbuff("盾立") or tbuff("无明魂锁") or tbuff("雷霆震怒") then
        return 1
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
        return 1
    end
    DPS(weight)
    return 2
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
    if  tIDnX == g_player.dwID then  --如果有人开始读条123技能，目标是自己
        --print(string.find(duobi,dwSkillID))
        --print("技能id:",dwSkillID)
        --if dwSkillID==5268 or dwSkillID==5270 then
        --    isdutiao=false
        --end
        --print(string.find(duobi,dwSkillID)~=nil)
        --if string.find(duobi,dwSkillID)~=nil then
        --print("躲避")
        --    Cast("凌霄揽胜",true,true)
        --    CastTo("流光囚影", CasterID, true)  --打断他读条
        --Cast(9007)  --后跳
        --    Cast(3973)
        --end
    end


    --print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --输出释放信息
end


--开始读条回调函数，任意对象开始读条时调用
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end