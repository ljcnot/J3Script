LoadLib("Macro\\封装函数.lua")
local target
local tclass
local this_player
local gcdsj = 0.1 --gcd时间
local lastSelectTime = 0
local save_target
local isRun = false
local isDanger = false

function jiekong()
    if (GetSkillGCD("生死劫") + gcdsj) > dingshenTime() then
        return false
    end
    if (GetSkillGCD("生死劫") + gcdsj) > yunxuanTime() then
        return false
    end
    return true
end
function chirilun()
    ---赤日轮
    if dis() > 4 or isManri() then
        return false
    end
    return true
end

function lierizhan()
    ---烈日斩
    if dis() > 4 or cdEX("烈日斩") or isManri() or getSun() >= 80 then
        return false
    end

    return true
end
function youyuelun()
    ---幽月轮
    if dis() > 4 or isManyue() then
        return false
    end
    return true
end

function yinyuezhan()
    ---银月斩
    if dis() > 12 or cdEX("银月斩") or isManyue() or ( getMoon() >= 80  and dis()<=4 )then
        return false
    end
    return true
end
function shengsijie()
    ---生死劫
    if dis() > 6 or GetCastCount(this_player, 3966, 10) >= 2 or (isManyue() == false and isManri() == false) or HaveTalent("幽隐尘迹") then
        return false
    end
    if haveMiankong() then
        return false
    end
    if death(target) and tnostate("冲刺") and tstate("击倒|眩晕|定身") == false and tstatep("免控") == false then
        return true
    end
    if death(target) and tnostate("冲刺") and tstate("眩晕|定身") and seeObj(target) > 0 and jiekong() and tstatep("免控") == false then
        return true
    end

    return false
end
function shengsijieJianliao()
    ---生死劫减疗
    if dis() > 6 or (isManyue() == false and isManri() == false) then
        return false
    end
    if not tstatep("减疗") or tbufftime("月劫")<2 then
        return true
    end
    return false
end
function jingshipomoji()
    ---净世破魔击
    if dis() > 15 or (isManyue() == false and isManri() == false) then
        return false
    end
    if isManri() and (not shengsijie() or HaveTalent("善恶如梦")==false) then
        return true
    end
    if isManyue() then
        return true
    end
    return false
end
function quyeduanchou()
    ---驱夜断愁
    if dis() > 6 or cdEX("驱夜断愁") or isManyue() or isManri() then
        return false
    end
    if buff("暗尘弥散") or buff("安尘") then
        return true
    end
    return false
end
function buweianxing(weight)
    ---怖畏暗刑
    if tclass==NPC or dis() > 6  or  noSkillTime(0.2) or cdEX("怖畏暗刑") or tstatep("免缴械") or tstatep("免封内") then
        return false
    end
    --if weight<=8 and  kongzhiTimeEX(1) then
    --    if cdEX("怖畏暗刑") and cdEX("生灭予夺")==false then
    --        skillEX2("暗尘弥散")
    --        skill("流光囚影")
    --        skillEX2("生灭予夺")
    --        --print("生灭")
    --        return true
    --    end
    --    --print("缴械1")
    --    return true
    --end
    if tbuff("乱洒青荷") or tbuff("心无旁骛") then
        return true
    end

    if tlife() <= 50 then
        --if cdEX("怖畏暗刑") and cdEX("生灭予夺") == false then
        --    skillEX2("暗尘弥散")
        --    skill("流光囚影")
        --    skill("驱夜断愁")
        --    skillEX2("生灭予夺")
        --    --print("生灭")
        --    return true
        --end
        return true
    end
    if tlife() <= 100 and (not IsInArena() or objOnHorse(target) or tmount("补天诀|离经易道|相知|云裳心经|凌海决")) then
        return true
    end

    return false
end
function shengmieyuduo()
    ---生灭予夺
    if cdEX("生灭予夺") or noSkillTime(0.2) then
        return false
    end
    if tlife() <= 50 and cdEX("怖畏暗刑") then
        return true
    end
    return false
end
function guangmingxiang(weight)
    ---光明相
    if cdEX("光明相") or buff("扬旌沙场") or dis() > 15 or isyueda() then
        return false
    end

    if weight <= 7 and (isManri() or isManyue()) then
        return true
    end
    if weight<=10 and quyeduanchou() and not cdEX("驱夜断愁") then
        return true
    end
    return false
end
function fumingzhongsheng(weight)
    ---伏明众生
    if not HaveTalent("伏明众生") or buff("扬旌沙场") or cdEX("伏明众生") or getSun() < 60 or dis() > 6 then
        return false
    end
    if weight <= 10  then
        return true
    end
    --if weight <= 7 then
    --    return true
    --end
    return false
end
function mingyueduxin(weight)
    ---冥月渡心
    if not HaveTalent("冥月渡心") or buff("扬旌沙场") or isguangmingxiang() or cdEX("冥月渡心") or getMoon() < 60 or dis() > 12 or buff("光明相") then
        return false
    end
    if weight <= 10 then
        return true
    end
    return false
end
function hanyueyao()
    ---寒月耀
    if not HaveTalent("寒月耀") or cdEX("寒月耀") or dis() > 20 or tstatep("免封内") or tstatep("免打断") then
        return false
    end
    if tIsota() then
        return true
    end
    if not tmount("离经易道|云裳心经|补天诀|相知") then
        local diduinaima = FindPlayer(20, "离经易道|云裳心经|补天诀|相知", "敌对")
        if diduinaima ~= nil and objIsota(diduinaima) then
            CastTo("寒月耀", diduinaima)
        end
    end
    return false
end
function liuguangqiuying(weight)
    ---流光囚影
    if cdEX2("流光囚影") or dis() > 20 or jileyin(weight) or tstate("冲刺") or GetSkillGCD("生死劫") > 0 or (GetCastTime(this_player, 18629) > 0 and GetCastTime(this_player, 18629) < 1) then
        --or (statep("免控") and not buff("暗尘弥散"))
        return false
    end
    if dis() > 4 and (statep("锁足") or state("僵直")) then
        return true
    end
    if dis() > 4 and dis() <= 15 and jingshipomoji() then
        return false
    end
    if dis() > 4 and dis() <= 12 and yinyuezhan() then
        return false
    end
    if dis() > 4 and dis() <= 6 and shengsijieJianliao() then
        return false
    end
    if dis() > 4 and dis() <= 6 and quyeduanchou() then
        return false
    end
    if dis() > 6 and dis() <= 12 and isyueda() and buff("暗尘弥散") then
        return true
    end
    if dis() > 12 and his() <= 12 then
        return true
    end
    if dis() > 4 and his() <= 12  and not buff("烈火")  then
        return true
    end
    if dis() > 8 and his() <= 12  and  buff("烈火")  then
        return true
    end
    if seeObjEX(this_player)>=1 and not statep("免控") then
        return true
    end

    return false
end
function huanguangbu(weight)
    ---幻光步
    if cdEX("幻光步") or dis() > 20 or tstate("冲刺") or isyueda() or statep("免控") then
        return false
    end

    if dis() > 4 and dis() <= 12 and isyueda() then
        return false
    end
    if HaveTalent("秘影诡行") and  statep("缴械") or statep("沉默") or statep("封内") then
        return true
    end
    if HaveTalent("秘影诡行") and  state("眩晕|定身") then
        return true
    end
    if dis() > 4 and dis() <= 15 and jingshipomoji() then
        return false
    end
    --if dis()>4 and (isManri()==false and isManyue()==false and dis()<15) and cdEX2("流光囚影") then
    --    return true
    --end
    if dis() > 4 and cdEX2("流光囚影") and weight <= 5 then
        return true
    end

    return false
end
function jileyin(weight)
    ---极乐引
    if not HaveTalent("极乐引") or cdEX("极乐引") or tstate("冲刺") or dis() > 14 then
        return false
    end
    if not tstatep("封轻功") and weight<=4 then
        return true
    end
    if femgche(this_player, "队友") and target and not femgche(target, "队友") then
        return true
    end
    if femgche(this_player, "队友") and findRangeCount(14)>=2 then
        return true
    end
    if his() > 4 and weight<=5 then
        return true
    end
    if dis() > 6 and weight<=4 and not yinyuezhan() and not quyeduanchou() and not jingshipomoji() then
        return true
    end
    return false
end
function tanmoti()
    ---贪魔体
    if cdEX2("贪魔体") or buff("暗尘弥散") or (GetCastTime(this_player, 18629) > 0 and GetCastTime(this_player, 18629) < 10) or buff("暗尘弥散") or buff("安尘") then
        return false
    end
    if boom() >= 3 and life() <= 90 and statep("减伤") == false then
        return true
    end
    if boom() >= 2 and life() <= 70 and statep("减伤") == false then
        return true
    end
    local naima = FindPlayer(30, "离经易道|云裳心经|补天诀|相知", "队友")
    if life() < 60 and naima and statep("减伤") == false then
        return true
    end
    if life() < 30 then
        return true
    end
    return false
end
function anchenmisan(weight)
    ---暗尘弥散
    if cdEX("暗尘弥散") then
        return false
    end
    if life() < 40 then
        return true
    end
    if isyueda() or statep("免控") then
        return false
    end
    if dis() > 4 and dis() <= 12 and isyueda() then
        return false
    end
    --if dis()<4 and weight<=3 and cdEX("冥月渡心") and getSun()<60 and getMoon()<60 then
    --    return true
    --end
    if (statep("缴械") or statep("沉默") or statep("封内")) and cdEX("幻光步") then
        return true
    end
    --if dis()>4 and (isManri()==false and isManyue()==false and dis()<15) and cdEX2("流光囚影") then
    --    return true
    if state("眩晕|定身") and cdEX("幻光步") then
        return true
    end
    if state("击倒") then
        return true
    end
    return false
end
function wuminghunsuo(weight)
    if cdEX("无明魂锁") then
        return false
    end
    if dis()<=8 and tmount("离经易道|云裳心经|补天诀|相知") and  tbuff("疾电叱羽") and not tstatep("免控")  then
        return true
    end
    if dis()<=8 and tmount("离经易道|云裳心经|补天诀|相知") and  femgche(target, "敌对") and  not tstatep("免控")  then
        return true
    end
    if dis()>4 and  his()>=4 and  dis()<=8 and not tstatep("免控") and not yinyuezhan() and not quyeduanchou() and not jingshipomoji()  then
        CastTo("无明魂锁", target, true)
    end

    if not tmount("离经易道|云裳心经|补天诀|相知") and weight <= 10 then
        local diduinaima = FindPlayer(8, "离经易道|云裳心经|补天诀|相知", "敌对")
        if diduinaima then
            CastTo("无明魂锁", diduinaima, true)
        end
    end
    if tmount("离经易道|云裳心经|补天诀|相知") and weight <= 10 then
        local nosee = findNoSeediren()
        if nosee then
            CastTo("无明魂锁", nosee, true)
        end
    end
end

function riling()
    ---攒日灵
    if lierizhan() then
        skill("烈日斩")
    end
    if chirilun() then
        skill("赤日轮")
    end
end

function yueling()
    ---攒月灵
    if yinyuezhan() then
        skill("银月斩")
    end
    if youyuelun() then
        skill("幽月轮")
    end
end
function manri()
    ---满日输出
    --
    if  HaveTalent("善恶如梦") and shengsijieJianliao() then
        skillEX("生死劫")
    end
    if jingshipomoji() then
        skillEX("净世破魔击")
    end
    if HaveTalent("善恶如梦") and shengsijie() then
        skillEX("生死劫")
    end
end
function manyue()

    if shengsijieJianliao() then
        skillEX("生死劫")
    end
    if jingshipomoji() then
        skillEX("净世破魔击")
    end
    ---满月输出
    if shengsijie() then
        skillEX("生死劫")
    end
end
function yinshen()
    ---隐身输出
end
function DPS(weight)
    --如果血量回来了就取消贪魔体
    --if buff("贪魔体") and life()> 60 and weight<=3 and (getMoon()>=60 or getSun()>=60) then
    --    CancelBuff(mbuff, "贪魔体")
    --end

    if jileyin(weight) then
        skillEX2("极乐引")
    end

    if target and  not femgche(target, "敌对") and liuguangqiuying(weight) then
        skill("流光囚影")
    end

    if buweianxing(weight) then
        skillEX("怖畏暗刑")
    end

    if shengmieyuduo() then
        skillEX2("暗尘弥散")
        skill("流光囚影")
        skill("驱夜断愁")
        skillEX2("生灭予夺")
    end
    if guangmingxiang(weight) then
        Cast("光明相", true, true)
    end
    if hanyueyao() then
        skill("寒月耀")
    end

    if fumingzhongsheng(weight) then
        skill("伏明众生")
    end
    if mingyueduxin(weight) then
        skill("冥月渡心")
    end

    if isManyue() then
        manyue()
    else
        if isManri() then
            manri()
        end
    end
    if quyeduanchou() then
        skillEX("驱夜断愁")
    end
    if (cdEX("烈日斩") and getSun() < 80) or dis()>4 then
        yueling()
    else
        riling()
    end
    if cdEX("扶摇直上") == false then
        Cast("扶摇直上", true, true)
    end
end
function seurvival(weight)
    ---生存向技能
    if tanmoti() then
        Cast(3973, true, true)
    end
    if anchenmisan(weight) then
        Cast("暗尘弥散", true, true)
    end
    if target and  not femgche(target, "敌对") and  huanguangbu(weight) then
        skill("幻光步")
    end


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
    if HaveTalent("寒月耀") and cdEX("寒月耀") == false then
        ---如果探梅没CD 并且目标是敌对
        local target
        --遍历队伍成员
        for k, v in ipairs(GetAllMember()) do
            if IsPlayer(v.dwID) and IsEnemy(v.dwID) and objState(v, "重伤") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and v ~= this_player and objNotWudi(v) then
                if objIsota(v) and (objmount(v, "补天诀|离经易道|相知|云裳心经") or not IsInArena() ) then
                    --先保存当前对象
                    CastTo("寒月耀", v, true)
                    --return 1
                end
            end
        end
    end
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
    if weight >= 50 and (GetTickCount() - lastSelectTime) > 5000 then
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
    if player.bFightState == false then
        Cast("暗尘弥散", true, true)
    end
    InteractNpc("遗失的货物")
    target,tclass = setAll(player)
    local weight = getWeight(false)

    if weight>3 and femgche(player, "敌对") then
        if target then
            if femgche(target, "敌对") then
                BackTo(target)
            else
                skill("流光囚影")
            end
        end
        MoveForwardStart()
        if state("眩晕|击倒|定身") then
            Cast("暗尘弥散", true, true)
        end
        Cast("扶摇直上", true, true)
        Jump()
        Cast("蹑云逐月", true, true)

        --Cast(3973, true, true)
    end

    --print("weight:",weight)
    tab(weight)
    seurvival(weight)
    if wuminghunsuo(weight) then
        skillEX("无明魂锁")
    end
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
            toBack()
        else
            if isRun then
                MoveAction_StopAll()
                isRun=false
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