LoadLib("Macro\\封装函数.txt")

function jiekong()
    if (GetSkillGCD("虹气长空") + gcdsj) > dingshenTime() then
        return false
    end
    if (GetSkillGCD("虹气长空") + gcdsj) > yunxuanTime() then
        return false
    end
    return true
end
function chuanyun()
    ---穿云
    if dis()>4 or cdEX("穿云") then
        return false
    end
return true
end
function longying()
    ---龙吟
    local distance = 4
    if HaveTalent("穿") then
        distance = 8
    end
    if dis()>distance or cdEX("龙吟") then
        return false
    end
    return true
end
function longya(weight)
    ---龙牙
    if dis()>4 or zhanyi()<3 or cdEX("龙牙") then
        return false
    end
    if weight<=10 then
        return true
    end
    return false
end

function cangyue(weight,target)
    ---沧月
    if dis()>4 or cdEX("沧月") or tstatep("免控") or tstate("冲刺") then
        return false
    end
    if target and needTui(target) then
        return true
    end
    if weight<=10 then
        return true
    end
    return false
end
function jirufeng(weight)
    ---疾如风
    if cdEX("疾如风") then
        return false
    end
    if state("眩晕|击倒|僵直|定身") and (life()<80 or weight<=8)then
        return true
    end
    return false
end
function hanrulei(weight)
    ---撼如雷
    if HaveTalent("激雷") ==false or cdEX("撼如雷") then
        return false
    end
    if weight<=6 then
        return true
    end
return false
end
function shourushan()
    ---守如山
    if  cdEX("守如山") or statep("不死") or statep("无敌") then
        return false
    end
    if life()<=60 then
        return true
    end
    return false
end
function xiaoruhu()
    ---啸如虎
    if  cdEX("啸如虎") or statep("不死") or statep("无敌") then
        return false
    end
    if life()<=40 then
        return true
    end
    return false
end
function yu()
    ---御
    if onHorse() or cdEX("御") or (not onHorse()) then
        return false
    end
    if boom()>2 then
        return true
    end
    return false
end
function tu(weight)
    ---突
    if (onHorse()) or dis()<8 or dis()>25 or cdEX2("突") or tstatep("免控") or tstate("冲刺") then
        return false
    end
    if weight<=10 then
        return true
    end
    return false
end
function ji(weight)
    ---疾
    if (onHorse()) or dis()>30 or  cdEX("疾") or tstatep("免控") or tstate("冲刺") then
        return false
    end
    if weight<=10 then
        return true
    end
    return false
end
function mie(weight)
    ---灭
    if (onHorse()) or dis()>25 or  cdEX("灭")  then
        return false
    end
    if weight<=8 then
        return true
    end
    return false
end
function zhanbafang()
    ---战八方
    if (not onHorse() and HaveTalent("出云")==false) or dis()>6 or  cdEX("战八方") then
        return false
    end

    return true
end
function duanhunci()
    ---断魂刺
    if dis()<8 or dis()>27  or cdEX("断魂刺") or tstatep("免控") or tstate("冲刺") then
        return false
    end
    if tstate("眩晕|定身") and seeObjForPart(target)>0 and jiekong() then
        return true
    end
    if tstate("击倒|眩晕|定身") == false then
        return true
    end
    return false
end
function renchicheng()
    ---任驰骋
    if  cdEX2("任驰骋") then
        return false
    end
    if dis()>4 and statep("免控")==false then
        return true
    end
    if cdEX("灭") and cdEX("龙吟") then
        return true
    end
    return false
end
function pojianzhen()
    ---破坚阵
    if dis()>4  or cdEX("破坚阵") or tstatep("免控") or tstate("冲刺") then
        return false
    end
    if tstate("击倒|眩晕|定身") and seeObjForPart(target)>0 and jiekong() then
        return true
    end
    if tstate("击倒|眩晕|定身") == false then
        return true
    end
    return false
end
function pili(weight)
    ---霹雳
    if onHorse() or dis()>4 or cdEX("霹雳") then
        return false
    end
    if weight<= 6 then
        return true
    end
    if tstatep("减疗") then
        return false
    end
    if tstatep("减疗")==false and weight<=8 then
        return true
    end
    return false
end
function pochongwei(weight)
    ---破重围
    if (not onHorse()) or dis()>4 or cdEX("破重围") then
        return false
    end
    if weight<= 3 then
        return true
    end
    if tstate("击倒") and weight<=8 then
        return true
    end
    return false
end
function mashang(weight)
    if pochongwei(weight) then
        skillEX("破重围")
    end
    if duanhunci() then
        skillEX("断魂刺")
    end
    if zhanbafang() then
        skill("战八方")
    end
    if pojianzhen() then
        skill("破坚阵")
    end
end
function maxia(weight)
    ---步兵
    if tu(weight) then
        skillEX("突")
    end
    if ji(weight) then
        skillEX("疾")
    end
    if pili(weight) then
        skillEX("霹雳")
    end
    if mie(weight) then
        skill("灭")
    end
end
function DPS(weight,target)
    --if renchicheng() then
    --    skill("任驰骋")
    --end
    if onHorse() then
        ---在马上
        mashang(weight)
    else
        ---步兵形态
        maxia(weight)
    end
    if cangyue(weight,target) then
        skill("沧月")
    end
    if longya(weight) then
        skill("龙牙")
    end
    if longying() then
        skill("龙吟")
    end
    if chuanyun() then
        skill("穿云")
    end
end
function seurvival(weight)
    ---生存向技能
    if yu() then
        Cast("御",true,true)
    end
    if jirufeng(weight) then
        Cast("疾如风",true,true)
    end
    if hanrulei(weight) then
        Cast("撼如雷",true,true)
    end
    if shourushan() then
        Cast("守如山",true,true)
    end
    if xiaoruhu() then
        Cast("啸如虎",true,true)
    end
end
function tab(player)
    local target, tclass = GetTarget(player)
    if objState(target, "重伤") then
        findTargetforRange(30)
        --print("目标重伤")

    end
end
--Main函数，1个参数是自己的玩家对象，每秒调用16次
function Main(player)
    --if IsHotKeyDown(1) then
    --    local mbuff = GetBuff(player)
    --    CancelBuff(mbuff, "骑御")
    --    Jump()
    --end
   local target =  setAll(player)
    tab(player)
    --if target then
    --    TurnTo(target)
    --    MoveForwardStart()
    --    toBack()
    --end

    local weight = getWeight(true)
    seurvival(weight)
    DPS(weight,target)

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