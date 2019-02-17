LoadLib("Macro\\封装函数.lua")
local target
local this_player
local gcdsj = 0.1 --gcd时间
local lastSelectTime = 0
local save_target
local isRun = false
local ttarget
local ttclass
function tinglei()
    ---听雷
    if dis() > 4 then
        return false
    end
    if buff("凤鸣") and this_player.nCurrentRage >= 10 then
        return false
    end
    return true
end
function jiekong()
    if (GetSkillGCD("醉月") + gcdsj) > dingshenTime() then
        return false
    end
    if (GetSkillGCD("醉月") + gcdsj) > yunxuanTime() then
        return false
    end
    return true
end

function hupao()
    ---梦泉虎跑
    if statep("免控") or cdEX("梦泉虎跑") then
        return false
    end
    if rseeme(25) > 0 then
        return true
    end
    if dis() > 4 then
        return true
    end
    return false
end
function yuyue()
    ---玉泉鱼跃
    if dis() > 15 then
        return true
    end
    if statep("免控") or buff("梦泉虎跑") then
        return false
    end
    if cdEX("梦泉虎跑") and (rseeme(25) > 0 or dis() > 8) then
        return true
    end
    return false
end
function yuhongguanri()

    ---玉虹贯日
    if dis() < 5 or dis() > 24 or cdEX("玉虹贯日") or tstate("冲刺") then
        return false
    end
    if tota("任驰骋") then
        return true
    end
    if dis()>15 then
        return true
    end
    return false
end

function pinghuduanyue()
    ---平湖断月
    if dis() > 8 or cdEX("平湖断月") or tstate("冲刺") then
        return false
    end
    if dis() >= 4 then
        return true
    end
    --if totatype("right") or totatype("left") then
    --	return true
    --end
    return false
end
function huanglongtucui()
    ---黄龙吐翠
    if dis() > 6 or cdEX("黄龙吐翠") then
        return false
    end
    --if tstatep("免控")==false then
    --	return true
    --end
    return true
end
function zuiyue()
    ---醉月
    if dis() > 6 or cdEX("醉月") or this_player.nCurrentRage < 10 or haveMiankong() or tstatep("免控") or tstatep("闪避") or (mount("山居剑意") and HaveTalent("惊涛") and cdEX("惊涛") == false) then
        return false
    end
    if tnostate("冲刺") and tstate("眩晕|定身") and death(target) and seeObj(target)>0 and jiekong()  then
        return true
    end
    if tnostate("冲刺") and not tstatep("免控") and  not tstate("击倒|眩晕|定身") then
        return true
    end
    return false
end

function xiaori(weight)
    ---啸日
    if cdEX2("啸日") or lastSkill(14910,1) or lastSkill(18322,2) or lastSkill(18322,1) or lastSkill(1580,1) or lastSkill(1589,1)  then
        return false
    end
    if mount("问水诀") then
        if state("击倒|眩晕|定身|锁足") and (weight <= 8 or life() <= 70) then
            --print("state(击倒|眩晕|定身|锁足|僵直)")
            return true
        end
        if dis() <= 4  and weight<=4 and (GetSkillCN("莺鸣柳")>0 or this_player.nCurrentRage >50) then
            return true
        end
        if buff("梦泉虎跑") or buff("玉泉鱼跃") then
            return false
        end
        if rseeme(25) > 0 and statep("免控") == false and GetSkillSCD("梦泉虎跑")>0.5 and GetSkillSCD("玉泉鱼跃")>0.5 then
            --print("rseeme(25)>0 ")
            return true
        end

        if this_player.nCurrentRage >= 90 and statep("免控") == false and GetSkillSCD("梦泉虎跑")>0.5 and dis() <= 4 then
            --print("this_player.nCurrentRage>=90")
            return true
        end

        return false
    else
        if rseeme(25) > 0 and buff("啸日") == false then
            return true
        end
        if dis() > 8 and GetSkillSCD("松舍问霞")>0.5 and GetSkillSCD("鹤归孤山")>0.5 and GetCastTime(this_player,14910)> 1 and GetCastTime(this_player,18322)> 1  then
            return true
        end
        ---山居剑意
        if this_player.nCurrentRage < 15 and not yingmingliu(weight) then
            return true
        end
        return false
    end
end
function yunfeiyuhuang(weight)
    ---云飞玉皇
    if this_player.nCurrentRage < 20 or cdEX("云飞玉皇") then
        return false
    end
    if dis() <= 23 and buff("云景") then
        return true
    end
    if dis() > 8 then
        return false
    end
    if buff("夜雨") and (weight < 10 or bufftime("夜雨") < 2) then
        return true
    end
    if dis() <= 4 and  kongzhiTimeEX(1) then
        return true
    end
    if dis() <= 4 and  tstate("站立") then
        return true
    end
    return false
end
function xizhaoleifeng()
    ---夕照雷锋
    if dis() > 8 or this_player.nCurrentRage < 15 then
        return false
    end
    if dis() <= 4 and buff("声趣") and (GetSkillSCD("云飞玉皇")<2 or bufftime("声趣")<5) then
        return true
    end
    if dis() <= 4 and buff("凤鸣") then
        return true
    end
    if dis() > 4 then
        return true
    end
    return false
end
function heguigushan()
    ---鹤归孤山
    if dis() > 21 or cdEX("鹤归孤山") or not cdEX("松舍问霞") or this_player.nCurrentRage < 20 or tstate("冲刺") then
        return false
    end
    if isPositive() and dis2() >= 6 and dis2() <= 20 then
        return true
    end
    --if life()<40 then
    --	return true
    --end
    return false
end
function fenglaiwushan(weight)
    ---风来吴山
    if  this_player.nCurrentRage < 50 or cdEX("风来吴山") then
        return false
    end
    if HaveTalent("浮云") and dis()<=6 and life() <= 80 and kongzhi() then
        return true
    end
    if dis() <=8 and ((death(target) and kongzhi() )or tota("千蝶吐瑞")) and life() <= 50 then
        return true
    end
    if  dis() <=4 and target ~= nil and target.nRunSpeed < 22 and not cdEX("峰插云景")  and weight <= 5 then
        return true
    end
    if HaveTalent("层云") == false and dis() <=4 and life() <= 50 and not tstatep("免控") then
        return true
    end
    return false
end
function fengchayunjing(weight)
    ---峰插云景
    if dis() > 6 or this_player.nCurrentRage < 10 or cdEX("峰插云景") or tstatep("免推") then
        return false
    end
    if ttarget ~= nil and IsParty(ttarget) and (ttlife() < 60 or ttlife()< 40)then
        return true
    end
    if needTui(target) then
        return true
    end
    ---风来吴山
    local npc,count = FindNpc(this_player, "57739", 10, "自己")
    if count>0 and objIsZhengmian(npc) and GetDist(this_player,npc)<=6 and objIsZhengmian(target) then
        return true
    end
    local npc,count = FindNpc(this_player, "57739", 10, "队友")
    if count>0 and objIsZhengmian(npc) and GetDist(this_player,npc)<=6 and objIsZhengmian(target) then
        return true
    end
    local npc,count = FindNpc(this_player, "57739", 10, "敌对")
    if count>0 and GetFace(npc)>=0 and GetFace(npc)<=80 and GetDist(this_player,npc)<=6 then
        return true
    end
    if cdEX("云飞玉皇") or weight > 8 or tstate("眩晕|定身|爬起")  or lastSkill(1647,1) or lastSkill(1649,1) then
        return false
    end
    --if weight >= 6 and weight <= 8 and buff("凤鸣")  and (tstatep("免控") or (tmount("山居剑意") and (cdEX("惊涛") or HaveTalent("惊涛")) and cdEX("醉月")) or (tmount("问水诀") and cdEX("醉月")) ) then
    --    return true
    --end
    if weight <= 2 and (tstatep("免控") or ((tmount("山居剑意") and (cdEX("惊涛") or HaveTalent("惊涛")) and cdEX("醉月")) or (tmount("问水诀") and cdEX("醉月")))) then
        return true
    end
    return false
end
function yingmingliu(weight)
    ---莺鸣柳
    if buff("莺鸣") or dis() > 4 or cdEX2("莺鸣柳")  then
        return false
    end
    if this_player.nCurrentRage < 10 and weight<=8 and mount("山居剑意") then
        return true
    end
    if weight <= 6 and mount("山居剑意") then
        print("莺鸣", weight)
        return true
    end
    if life() < 10 then
        return true
    end
    return false
end
--[[支持判断的集合：
无免控、免控、无爆发、有爆发、无免伤、有免伤、无沉默、有沉默
无减伤、有减伤、无闪避、有闪避、无减疗、有减疗、无减速、有减速
无封内、有封内、无封轻功、有封轻功、可控制、可行动、非被控
有免封内，无免封内，有免推，无免推，有免拉，无免拉
--]]
function quanningyue()
    ---泉凝月
    if buff("梦泉虎跑") then
        return true
    end
    -----泉凝月
    if rseeme(25) == 0 then
        return false
    end
    --if life()<80 then
    --	return true
    --end
    return true
end
function yunxisong()
    ---云稀松
    if rseeme(25) < 1 or statep("免外伤") or statep("减伤") or statep("单次免伤") then
        return false
    end
    if life() <= 50 then
        return true
    end
    return false
end
function fengchuihe()
    ---风吹荷
    if HaveTalent("风吹荷") == false or cdEX("风吹荷") or dis() > 6 or tmount("补天诀|离经易道|相知|云裳心经") then
        return false
    end
    if ttarget ~= nil and IsParty(ttarget) and ttlife() < 80 and ttstatep("封内") then
        return true
    end
    if ttlife() <= 60 then
        return true
    end
    if life() < 70 then
        return true
    end
    return false
end
function jingtao()
    ---惊涛
    if HaveTalent("惊涛") == false or this_player.nCurrentRage < 10 or cdEX("惊涛") or dis() > 8 or haveMiankong() or tstatep("免控") or tstatep("闪避") then
        return false
    end
    if tnostate("冲刺") and tstate("定身|爬起") and death(target)  and seeObj(target)>0 and jiekong()then
        --print("惊涛1111")
        return true
    end
    if tnostate("冲刺") and tstatep("免控") == false and tstate("击倒|倒地|眩晕|定身") == false then
        --print("惊涛2222")
        return true
    end
    --print(tstate("击倒|倒地|眩晕|定身"))
    return false
end
function xieliubaoshi(weight)
    ---霞流宝石
    if HaveTalent("霞流宝石") == false or cdEX("霞流宝石") or dis() > 5 or tstate("冲刺") or tstatep("免缴械") then
        --print("霞流宝石")
        return false
    end
    -- 内功列表："洗髓经","易筋经","紫霞功","太虚剑意","花间游","离经易道","傲血战意","铁牢律","云裳心经","冰心诀","问水诀","山居剑意","毒经","补天诀","惊羽诀","天罗诡道","焚影圣诀","明尊琉璃体","铁骨衣","分山劲","笑尘诀","莫问","相知","北傲诀"
    if ttarget ~= nil and IsParty(ttarget) and ttlife() < 60 then
        return true
    end
    if weight <= 10 and tmount("补天诀|离经易道|相知|云裳心经") and kongzhi() then
        return true
    end
    if tlife() <= 70 then
        return true
    end
    return false
end
function tanmei()
    ---探梅
    if HaveTalent("探梅") == false or dis() > 15 or (ttarget ~= nil and IsParty(ttarget) and ttdis() > 15) then
        return false
    end
    if target ~= nil and IsParty(target) then
        return true
    end
    if ttarget ~= nil and IsParty(ttarget) and ttlife() < 80 and ttstate("眩晕|定身") then
        return true
    end
    return false
end
function jiuximiyan()
    ---九溪弥烟
    if dis() > 4 then
        return false
    end
    return true
end
function songshewenxia(weight)
    ---松舍问霞
    if HaveTalent("松舍问霞") == false or dis() > 20 or cdEX("松舍问霞") or tstate("冲刺") then
        return false
    end
    -- 内功列表："洗髓经","易筋经","紫霞功","太虚剑意","花间游","离经易道","傲血战意","铁牢律","云裳心经","冰心诀","问水诀","山居剑意","毒经","补天诀","惊羽诀","天罗诡道","焚影圣诀","明尊琉璃体","铁骨衣","分山劲","笑尘诀","莫问","相知","北傲诀"
    --print("tmount")
    --if tmount("惊羽诀|天罗诡道|莫问|相知|凌海决")then
    --	--if buff("凤鸣") then
    --	--	return true
    --	--end
    --
    --else
    --
    --	if dis()>8 then
    --		return true
    --	end
    --
    --	if weight<8 then
    --		return true
    --	end
    --end

    if his() > 8 and tstatep("免控") == false  then
        return true
    end
    --if buff("凤鸣") then
    --    return true
    --end
    if dis() > 8 then
        return true
    end
    if weight <= 5 then
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

function wenshui(weight)
    ---问水诀
    --kotabreak(5, 24, "玉虹贯日")
    --print("问水")
    ---醉月
    if zuiyue() then
        CastTo("醉月", target, true)
        --return 1
    end

    ---梦泉虎跑
    if hupao() then
        --print("虎跑")
        skillEX("梦泉虎跑")
    end
    ---玉泉鱼跃
    if yuyue() then
        Cast("玉泉鱼跃", true)
    end
    ---啸日
    if xiaori(weight) then
        Cast("啸日", true,true)
    end
    if tinglei() then
        skill("听雷")
    end
    ---玉虹贯日
    if yuhongguanri() then
        skill("玉虹贯日")
    end
    ---平湖断月
    if pinghuduanyue() then
        skill("平湖断月")
    end
    if huanglongtucui() then
        skill("黄龙吐翠")
    end
    -----九溪弥烟
    --if jiuximiyan() then
    --	skill("九溪弥烟")
    --end
    ---听雷


end
function shanjujianyi(weight)
    ---山居剑意
    if xieliubaoshi(weight) then
        --print("霞流宝石")
        skillEX2("霞流宝石")
        return
    end
    if zuiyue() then
        CastTo("醉月", target, true)
    end
    if jingtao() then
        --print("惊涛")
        CastTo("惊涛", target, true)
        --return

        --return 1
    end


    if fengchayunjing(weight) then
        --print("峰插云景")
        skillEX2("峰插云景")
        --return
    end
    ---风来吴山
    if fenglaiwushan(weight) then
        --print("风来吴山")
        skillEX2("风来吴山")
        return 1
    end
    if yunfeiyuhuang(weight) then
        --print("云飞玉皇")
        CastTo("云飞玉皇", target, false)
        return 1
    end
    ---鹤归孤山
    if heguigushan() then
        --print("鹤归孤山")
        CastTo("鹤归孤山", target, false)
        --return 1
    end
    ---松舍问霞
    if songshewenxia(weight) then
        --print("松舍问霞")
        skillEX("松舍问霞")
        --return 1
    end

    ---夕照雷锋
    if xizhaoleifeng() then
        --print("夕照雷峰")
        skillEX("夕照雷峰")
    end
    ---啸日
    if xiaori(weight) then
        --print("啸日")
        Cast("啸日", true,false)
    end


    ---听雷
    if tinglei() then
        --print("听雷")
        skill("听雷")
    end
end

function DPS(weight)
    ---莺鸣柳
    if yingmingliu(weight) then
        Cast("莺鸣柳", true, true)
    end



    --print("判断心法")
    if mount("问水诀") then
        wenshui(weight)
    else
        --print("山居")
        shanjujianyi(weight)
    end
    if shuyunzhuyue() then
        CastTo("蹑云逐月", target, false)
    end

    if cdEX("扶摇直上") == false then
        Cast("扶摇直上", true, true)
    end
end


function tab(weight)
    if objState(target, "重伤")  then
        findTargetforRange(30)
        print("目标重伤")

    end
    if  target and  IsParty(target) then
        if target ~=nil then
            SetTarget(save_target)
        end
    else
        if target ~=nil then
            save_target = target
        end
    end
    --if  target == nil and save_target~=nil then
    --    save_target = target
    --end
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
    if HaveTalent("探梅") and cdEX("探梅") == false then
        ---如果探梅没CD 并且目标是敌对
        local target
        --遍历队伍成员
        for k, v in ipairs(GetAllMember()) do
            if IsPlayer(v.dwID) and IsParty(v) and objState(v, "重伤")==false and GetDist(this_player, v) < 15 and IsVisible(this_player, v) and v~=this_player  and objNotWudi(v) then
                local tate = GetState(v)
                if (string.find("眩晕|定身", tate)~=nil and objLife(v) <= 80) or objLife(v) <= 60 then
                    --先保存当前对象
                    if ota("风来吴山") then
                        CastTo("探梅", v, true)
                    else
                        CastTo("探梅", v, false)
                    end
                    --return 1
                end
            end
        end
    end
    if HaveTalent("松舍问霞") and cdEX("松舍问霞") == false  then
        ---如果探梅没CD 并且目标是敌对
        local target
        --遍历队伍成员
        for k, v in ipairs(GetAllMember()) do
            if IsPlayer(v.dwID) and IsEnemy(v.dwID) and GetDist(this_player, v) < 20 and objState(v, "重伤")==false and GetHeight(v)>8 and IsVisible(this_player, v)  and objNotWudi(v) then
                local tate = GetState(v)
                if (string.find("冲刺", tate) ==nil and not state("锁足")) or (state("锁足") and string.find("冲刺", tate) ==nil and IsBack(v) ) then
                    --先保存当前对象
                    if ota("风来吴山") then
                        CastTo("松舍问霞", v, true)
                    else
                        CastTo("松舍问霞", v, false)
                    end
                    print("松舍问霞")
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
    if weight>=50 and (GetTickCount() - lastSelectTime)>5000 then
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
function seurvival(weight)
    ---生存向技能
   if xiaori(weight) then
    Cast("啸日", true,true)
    end
    ---泉凝月
    if quanningyue() then
        Cast("泉凝月", true, false)
    end
    ---云稀松
    if yunxisong() then
        Cast("云栖松", true, true)
    end
    ---探梅
    if tanmei() then
        skillEX("探梅")
    end
    if fengchuihe() then
        skill("风吹荷")
    end


end
--Main函数，1个参数是自己的玩家对象，每秒调用16次
function Main(player)
    this_player = player
    InteractNpc("遗失的货物")
    target = setAll(player)
    if target then
        ttarget, ttclass = GetTarget(target)
    end
    local weight = getWeight(true)
    if weight>3 and femgche(player, "敌对") then
            if target then
                if femgche(target, "敌对") then
                    BackTo(target)
                end
            end
        MoveForwardStart()
        if state("眩晕|击倒|定身") then
            Cast("啸日", true, true)
        end
        Cast("扶摇直上", true, true)
        Jump()
        Cast("蹑云逐月", true, true)
        Cast("玉泉鱼跃", true,true)
        Cast("鹤归孤山",true,true)

        --Cast(3973, true, true)
    end


    --print("weight:",weight)
    tab(weight)

    --wuminghunsuo(weight)
    seurvival(weight)
    if target and  femgche(target, "敌对") then
        if isRun then
            MoveAction_StopAll()
            isRun=false
        end
        return
    else
        isRun= true
        TurnTo(target)
        MoveForwardStart()
        ---风来吴山
        local npc,count = FindNpc(this_player, "57739", 10, "自己")
        if count>0 then
            toRao()
        else
            StrafeLeftStop()
            toBack()
        end
    end
    if tbuff("盾立") or tbuff("无明魂锁") then
        StopAction()
        return
    end
    if ota("云飞玉皇") then
        if dis()>8 then
            StopAction()
            return
        end
        MoveAction_StopAll()
        return
    end
    --跟随当前目标




    if his() > 6 and buff("弹跳") then
        Jump()
    end
    if GetHeight(player) > 6 and dis() <= 4 then
        Jump()
    end




        --if GetHeight(player)>0 then
        --	Jump()
        --end

    if ota("风来吴山") then
        --如果风车就不执行后面的
        return
    end
    if target and IsParty(target) then
        return
    end
    if target==nil then
        return
    end
        DPS(weight)
    --else
    --    if save_target~=nil then
    --        SetTarget(save_target)
    --    end
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