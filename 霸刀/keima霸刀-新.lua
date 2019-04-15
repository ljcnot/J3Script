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
local isQiaqinlong = false
local isShiziqiang = false
function jiekong()
    if (GetSkillGCD("虹气长空") + gcdsj) < dingshenTime() then
        return true
    end
    return false
end
function shiziqiang(weight)
        if dis()>6  or this_player.nCurrentSunEnergy<25 or cdEX3("封渊震煞") or cdEX("坚壁清野") or  cdEX("楚河汉界") then
            return false
        end
        if weight <=10 and tstate("击倒|眩晕|定身|锁足") then
            return true
        end

        if weight<=7 then
            return true
        end
        return false
    end
    function longxianghubu(weight)
        ---龙骧虎步
        local distance = 6
        if buff("松烟") then
            distance=12
        end
        if dis()>distance or shiziqiang(weight) or xiangwangjiding(weight) then
            return false
        end
        return true
    end
    function tayanyangqi(weight)
        ---踏宴扬旗
        if dis()>6 or cdEX3("踏宴扬旗") or tstatep("免控") or shiziqiang(weight) then
            return false
        end
        if tstate("击倒|眩晕|定身") and seeObjForPart(target)>0 and jiekong() then
            return true
        end
        if not tstate("击倒|眩晕|定身") then
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
    function qusan(obj)

        return GetBuffType(obj,"混元性气劲")>0 or GetBuffType(obj,"阴性气劲")>0
                or GetBuffType(obj,"阳性气劲")>0 or GetBuffType(obj,"毒性气劲")>0
    end
    function leizoufengqie()
        ---雷走风切
        if dis()>6 or cdEX3("雷走风切") or tstatep("免打断") or tstatep("免封内")  then
            return false
        end
        local tbuffList = GetBuff(target)
        if qusan(tbuffList) then
            return true
        end
        if not tmount("离经易道|云裳心经|补天诀|相知") then
            local diduinaima = FindPlayer(6, "离经易道|云裳心经|补天诀|相知", "敌对")
            if diduinaima ~= nil and objIsota(diduinaima) then
                CastXYZ("雷走风切",diduinaima.nX,diduinaima.nY,diduinaima.nZ,false)
            end
        end
        return false
    end
    function xichubeige(weight)
        ---西楚悲歌
        if  cdEX("西楚悲歌") then
            return false
        end
        local distance = 6
        if HaveTalent("疏狂") then
            distance = 12
        end
        local feitian = FindPlayer(distance, "凌海决", "敌对")
        if feitian ~= nil and GetCastTime(feitian,19828)>0 and GetCastTime(feitian,19828)<20 then
            return true
        end
        if life()<=60 and not statep("减伤") then
            return true
        end
        if weight<=5 then
            return true
        end
        return false
    end
    function xiangwangjiding(weight)
        ---项王击鼎
        if  this_player.nCurrentRage<5 then
            return false
        end
        if not statep("免控") and seeObjForEnemy(this_player)>0  then
            return true
        end
        if dis()>6 or shangjiangjunying(weight) then
            return false
        end
        --if findRangeCount(6)>=2 then
        --    return true
        --end
        return true
    end

    function pofuchenzhou(weight)
        ---破釜沉舟
        if dis()>8 or this_player.nCurrentRage<10 then
            return false
        end
        if HaveTalent("击瑕") and tstate("锁足|眩晕|击倒") and weight<=10 then
            return true
        end
        if weight<=7 then
            return true
        end
        if findRangeCountAndFace(8,90)>=2 then
            return true
        end
        return false
    end
    function shangjiangjunying(weight)
        ---上将军印
        local xiaohao = 10
        if HaveTalent("归酣") then
            xiaohao = 5
        end
        if dis()>10 or cdEX("上将军印") or this_player.nCurrentRage<xiaohao then
            return false
        end
        if life()<=70 and not statep("减伤") then
            return true
        end
        --if weight<=7 then
        --    return true
        --end
        --if findRangeCountAndFace(8,90)>=2 then
        --    return true
        --end
        return false
    end
    function shangjiangjunliu()
        ---上将军印
        local xiaohao = 10
        if HaveTalent("归酣") then
            xiaohao = 5
        end
        if dis()>10 or not HaveTalent("分疆") or  cdEX("上将军印") or this_player.nCurrentRage<xiaohao then
            return false
        end
        if tstate("击倒|眩晕|定身|锁足") then
            return true
        end
        if life()<=70 and not statep("减伤") then
            return true
        end
        --if weight<=7 then
        --    return true
        --end
        if findRangeCountAndFace(8,90)>=2 then
            return true
        end
        return false
    end
    function gejuqinggong()
        ---割据秦宫
        if dis()>6 or cdEX3("割据秦宫") or tstatep("免控") or this_player.nCurrentRage<10  then
            return false
        end
        --if tstate("击倒|眩晕|定身") and seeObjForPart(target)>0 and jiekong() then
        --    return true
        --end
        if not tstate("击倒|眩晕|定身") then
            return true
        end
        return false
    end
    function qinglongliuzhan()
        ---擒龙六斩
        if dis()>15 or cdEX("擒龙六斩") then
            return false
        end
        if dis()>6 and not tstatep("免控") then
            isQiaqinlong = false
            return true
        end
        if this_player.nCurrentRage<50 then
            isQiaqinlong = false
            return true
        end
        if dis()> 6 and tstatep("免控") then
            isQiaqinlong = true
            save_target = target
            --SetTarget(this_player)
            --local func = function(a)
            --    SetTarget(save_target)
            --end
            --DelayCall(500, func, 123)
            return true
        end

        --if dis>10 and seeObjForEnemy(this_player)>0 then
        --    isQiaqinlong
        --end
        return false
    end
    function naoxumi()
        ---闹须弥
        if dis()>15 or cdEX("闹须弥") or this_player.nCurrentEnergy<10 then
            return false
        end
        if not tbuff("闹须弥") then
            return true
        end
        return false
    end
    function suijiangtian()
        ---碎江天
        if dis()>8 or not buff("碎江天") or this_player.nCurrentEnergy<5 then
            return false
        end
        if not tstatep("减疗") then
            return true
        end
        if life()<=70 and not buff("流影") then
            return true
        end
        return false
    end
    function sanliuxia(weight)
        ---散流霞
        if buff("散流霞") or cdEX3("散流霞") or ObjCastTime(this_player,16608,2) then
            return false
        end
        if boom() >= 3 and life() <= 90 and not statep("减伤") then
            return true
        end
        if boom() >= 2 and life() <= 70 and not statep("减伤") then
            return true
        end
        if state("眩晕|击倒|僵直|定身") and (life()<80 or weight<=8) then
            return true
        end
        if life()<=50  then
            return true
        end
        return false
    end
    function daoxiaofengyin()
        ---刀啸风吟
        if dis()>22 or this_player.nCurrentSunEnergy<5 or shiziqiang(10) or seeObjForEnemy(this_player)>0  then
            return false
        end
        if dis()>20 and kongzhi() then
            return true
        end
        if dis()<=20 and not zuizhanbaishe() then
            return true
        end
        return false
    end
    function zuizhanbaishe()
        ---醉斩白蛇
        if dis()>22 or this_player.nCurrentSunEnergy<10 or shiziqiang(10) or seeObjForEnemy(this_player)>0   then
            return false
        end
        if tmount("离经易道|笑尘决") then
            return true
        end
        if  this_player.nCurrentRage>50 then
            return true
        end
        if dis()>20 then
            return true
        end
        return false
    end
    function linyuantahe()
        ---临渊蹈河
        if cdEX("临渊蹈河") then
            return false
        end
        if life()<= 60 and not statep("减伤") then
            return true
        end
        return false
    end

    function xiumingchenshen(weight)
        ---秀明尘身
        if xuexujinping(weight) or songyanzhuwu(weight) then
            return false
        end
        if xiangwangjiding(weight) then
            return true
        end
        if  shangjiangjunliu() then
            return true
        end
        if dis()>6 then
            return false
        end

        if this_player.nCurrentRage >=50 then
            return true
        end
        if gejuqinggong() or xichubeige(weight) or shangjiangjunying(weight) then
            return true
        end
        return false
    end

    function songyanzhuwu(weight)
        ---松烟竹雾
        if sanliuxia(weight)  then
            return true
        end
        if dis()>15 or xuexujinping(weight) then
            return false
        end
        if suijiangtian() or naoxumi() then
            return true
        end
        if this_player.nCurrentRage<10 then
            return true
        end
        if ObjCastTime(this_player,16870,5) and not statep("免控") then
            return true
        end
        if dis()>6 and qinglongliuzhan() then
            return true
        end

        return false
    end
    function xuexujinping(weight)
        ---雪絮金屏
        if dis()>22  then
            return false
        end
        if shiziqiang(weight) then
            return true
        end
        if linyuantahe() then
            return true
        end
        if  not qinglongliuzhan() and not naoxumi() and not suijiangtian() and dis()>6 and not (seeObjForEnemy(this_player)>0) then
            return true
        end
        return false
    end
function fengyuanzhensha(weight)
    ---封渊震煞
    if not HaveTalent("封渊震煞") or cdEX3("封渊震煞") then
        return false
    end
    if state("眩晕|击倒|定身") and (life()<80 or weight<=8) then
        return true
    end
    return false
end

    function daoqiao(weight)
        ---刀鞘形态
        if shiziqiang(weight) and GetSkillGCD("坚壁清野")==0 then
            isShiziqiang= true
            MoveAction_StopAll()
            skillEX2("楚河汉界")
            skillEX2("坚壁清野")
            CastAngle("封渊震煞",-50)
        end
        if daoxiaofengyin() then
            skill("刀啸风吟")
        end
        if zuizhanbaishe() then
            skill("醉斩白蛇")
        end

    end
    function shuangdao(weight)
        ---双刀形态
        --if sanliuxia(weight) then
        --    skill("散流霞")
        --end
        if suijiangtian() then
            skillEX("碎江天")
        end
        if naoxumi() then
            skill("闹须弥")
        end
        if qinglongliuzhan() then
            skill(16870)
        end
    end
    function dadao(weight)
        ---大刀形态

        if gejuqinggong() then
            skill("割据秦宫")
        end
        if pofuchenzhou(weight) then
            skillEX2("破釜沉舟")
        end
        if shangjiangjunliu() then
            skillEX2("上将军印")
            return
        end
        if xiangwangjiding(weight) then
            skillEX2("项王击鼎")
            return
        end
        if shangjiangjunying(weight) then
            skillEX2("上将军印")
        end




    end
    function DPS(weight)
        if xiumingchenshen(weight) then
            skill("秀明尘身")
        end
        if songyanzhuwu(weight) then
            skill("松烟竹雾")
        end
        if xuexujinping(weight) then
            skill("雪絮金屏")
        end
        if leizoufengqie() then
            skill("雷走风切")
        end
        if tayanyangqi(weight) then
            skillEX("踏宴扬旗")
        end

        if buff("秀明尘身") then
            dadao(weight)
        end
        if buff("松烟竹雾") then
            shuangdao(weight)
        end
        if buff("雪絮金屏") then
            daoqiao(weight)
        end
        if longxianghubu(weight) then
            skill("龙骧虎步")
        end
        if target and shuyunzhuyue() then
            CastTo("蹑云逐月", target, false)
        end

        if cdEX("扶摇直上") == false and not shiziqiang(weight) then
            Cast("扶摇直上", true, true)
        end
    end
    function seurvival(weight)
        -----生存向技能
        if xiumingchenshen(weight) then
            skill("秀明尘身")
        end
        if songyanzhuwu(weight) then
            skill("松烟竹雾")
        end
        if xuexujinping(weight) then
            skill("雪絮金屏")
        end
        if linyuantahe() then
            skill("临渊蹈河")
        end
        if sanliuxia(weight) then
            skill("散流霞")
        end
        if fengyuanzhensha(weight) then
            skill("封渊震煞")
        end
        if xichubeige(weight) then
            skill("西楚悲歌")
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
        if isShiziqiang then
            skillEX2("楚河汉界")
            skillEX2("坚壁清野")
            --CastAngle("封渊震煞",-60)
            return
        end
        this_player = player
        InteractNpc("遗失的货物")
        InteractNpc("叹息风碑")
        if life()<=50 then
            Use("金疮药")
        end
        target,tclass = setAll(player)
        local weight = getWeight(false)
        if tstatep("免控") then
            skill(16871)
            skill(16872)
            skill(16873)
            skill(16874)
            skill(16875)
        end



        if target and weight<=5 then
            RemoteCall("集火", target.dwID)	--jihuo相当于指令，是必须的，后面的参数没有或者传多少个都行
        end
        if GetOption("目标切换") then
            tab(weight)
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

    if tbuff("盾立") or tbuff("无明魂锁") or tbuff("雷霆震怒") or objState(target, "重伤") or buff("散流霞")  then
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
    if  tIDnX == g_player.dwID and dwSkillID==16621 then  --如果有人开始读条123技能，目标是自己
        --print(string.find(duobi,dwSkillID))
        isShiziqiang = false
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