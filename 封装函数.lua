AddOption("自动绕背")
AddOption("自动面向")
AddOption("自动跟随")
local save_target
local target
local tclass
local this_player
local mbuff
local tbuffList
local ttarget
local ttclass
local ttbuffList
local gcdsj = 0.1 --gcd时间
local help = false
local lastSelectTime = 0
local isprint = true
local isGensui= GetOption("自动跟随")
local isRaobei= GetOption("自动绕背")
local isMianxiang= GetOption("自动面向")
--szScriptDesc = "作者：keima\n说明：脚本说明\n奇穴：[腾焰飞芒][无往不复][燎原烈火][善法肉身][烈血灼芒][秽孽如形][善恶如梦][超然物外][生灭予夺][秘影诡行][伏明众生][冥月渡心]"
function ota(desc)
    local mota, motatime, motaratio = GetPrepare()
    return string.find(desc, mota)~=nil
end
function tota(desc)
    local mota, motatime, motaratio = GetPrepare(target)
    return string.find(desc, mota)~=nil
end
function tIsota()
    local mota, motatime, motaratio = GetPrepare(target)
    return motatime>0
end
function objIsota(obj)
    local mota, motatime, motaratio = GetPrepare(obj)
    return motatime>0
end
function objLife(obj)
    if obj == nil then
        return 999
    end
    local bfb = (obj.nCurrentLife / obj.nMaxLife) * 100
    return bfb
end
function lastSkill(skill,time)
    local time123 = GetCastTime(this_player, skill)
    --5秒内放过指定技能，注意要判断大于等于0
    return time123 >= 0 and time123 < time
end
function life()
    if this_player == nil then
        return 999
    end
    local bfb = (this_player.nCurrentLife / this_player.nMaxLife) * 100
    return bfb
end
function tlife()
    if target == nil then
        return 999
    end
    local bfb = (target.nCurrentLife / target.nMaxLife) * 100
    return bfb
end
function ttlife()
    if ttarget == nil then
        return 999
    end
    local bfb = (ttarget.nCurrentLife / ttarget.nMaxLife) * 100
    return bfb
end
function face()
    if target == nil then
        return 999
    end
    return GetFace(target)
end
function isPositive()
    return face() >= 0 and face() <= 15
end
function buff(list)
    mbuff = GetBuff(this_player)
    return GetBuffTime(mbuff, list) > 0
end
function tbuff(list)
    if target==nil then
        return false
    end
    tbuffList = GetBuff(target)
    return GetBuffTime(tbuffList, list) > 0
end
function bufftime(id)
    mbuff = GetBuff(this_player)
    return GetBuffTime(mbuff, id)
end
function skill(skillid)
    --print(skillid)
    Cast(skillid, false, false)
end
function skillEX(skillid)
    ---打断当前读条
    CastTo(skillid, target, true)
end
function skillEX2(skillid)
    ---打断当前读条
    Cast(skillid, true, true)
end
function dis()
    if not target then
        return 999
    end
    return GetPreciseDecimal(GetDist(target),2)
end
function his()
    if target == nil or tclass == NPC then
        return 0
    end
    return GetHeight(target)
end
function haveMiankong()
    if target == nil then
        return false
    end
    local talent = GetTalentInfo(target)
    if talent["风身"]~=nil and tbuff("女娲补天") then
        return true
    end
    return false
end
function dis2()
    return GetPreciseDecimal(GetDist2D(target),2)
end
function isyueda()
    return (GetCastTime(this_player,18629)>0 and GetCastTime(this_player,18629)<10)
end
function isguangmingxiang()
    return (GetCastTime(this_player,3969)>0 and GetCastTime(this_player,3969)<1)

end
--function qusan(obj)
--
--    return GetBuffType(obj,"混元性气劲")>0 or GetBuffType(obj,"阴性气劲")>0
--            or GetBuffType(obj,"混元性不利效果")>0 or GetBuffType(obj,"毒性不利效果")>0 or
--            GetBuffType(obj,"点穴不利效果")>0
--end
function GetPreciseDecimal(nNum, n)
    if type(nNum) ~= "number" then
        return nNum;
    end
    n = n or 0;
    n = math.floor(n)
    if n < 0 then
        n = 0;
    end
    local nDecimal = 10 ^ n
    local nTemp = math.floor(nNum * nDecimal);
    local nRet = nTemp / nDecimal;
    return nRet;
end
function ttdis()
    return GetDist(this_player, ttarget)
end

function rseeme(seeme)
    local seemecount, seemet = GetSeeMe(20)
    return seemecount
end

function state(desc)
    local tate = GetState(this_player)
    return string.find(desc, tate)~=nil
end
function tstate(desc)
    if target == nil then
        return false
    end
    local tstate = GetState(target)
    return string.find(desc, tstate)~=nil
end
function mount(desc)
    local school = GetMount(this_player)
    --print(school)
    return string.find(desc, school)~=nil
end
function objmount(obj,desc)
    if obj == NPC or obj==nil then
        return false
    end
    local school = GetMount(obj)
    --print(school)
    return string.find(desc, school)~=nil
end
function tmount(desc)
    if tclass == NPC or target==nil then
        return false
    end

    local school = GetMount(target)
    --print(school)
    if school == nil then
        return false
    end
    return string.find(desc, school)~=nil
end

function statep(desc)
    --print(desc)
    return GetTypeTime(mbuff, desc) > 0
end

function ttstatep(desc)
    if ttarget == nil then
        return false
    end
    return GetTypeTime(ttbuffList, desc) > 0
end

function tstatep(desc)
    if target == nil then
        return false
    end
    tbuffList = GetBuff(target)
    return GetTypeTime(tbuffList, desc) > 0
end
function tstate(desc)
    if target == nil then
        return false
    end
    local tstate = GetState(target)
    return string.find(desc, tstate) ~= nil
end
function objState(obj, desc)
    if obj == nil then
        return false
    end
    local tstate = GetState(obj)
    return string.find(desc, tstate) ~= nil
end
function ttstate (desc)
    if ttarget == nil then
        return false
    end
    local tstate = GetState(ttarget)
    return string.find(desc, tstate) ~= nil
end
function tnostate(desc)
    if target == nil then
        return false
    end
    local tstate = GetState(target)
    return string.find(desc, tstate) == nil
end
function CastTime(skillid, time)
    if target == nil then
        return false
    end
    return GetCastTime(target, skillid) > 0 and GetCastTime(target, skillid) <= time
end
function objNotWudi(obj)
    local wudi = { 203, 9695, 10212, 9934, 377 }
    for k, v in ipairs(wudi) do
        if obj.IsHaveBuff(v, 0) then
            return false
        end

    end
    return true
end
function zhanyi()
    return this_player.nCurrentRage
end
function isManri()
    ---判断是否满日
    return this_player.nSunPowerValue>0
end
function isManyue()
    ---判断是否满月
    return this_player.nMoonPowerValue>0
end
function getSun()
    ---获取日灵
    return (this_player.nCurrentSunEnergy/100)
end
function getMoon()
    ---获取月灵
    return (this_player.nCurrentMoonEnergy/100)
end
---权重计算
function getWeight(isOut)
    ---isOut  如果是外功就判断是否是有闪避
    local weight = 10
    --OutputinGame("---------------------------------")
    --if GetBuffTime(tbuffList, wudi) > 0 then
    --    weight = weight + 100
    --end
    if tstatep("无敌") then
        --如果目标可控制
        weight = weight + 100
    end
    if tstatep("不死") then
        --如果目标可控制
        weight = weight + 100
    end
    if tstatep("减伤90") then
        weight = weight+9
    end
    if tstatep("减伤80") then
        weight = weight+8
    end
    if tstatep("减伤70") then
        weight = weight+7
    end
    if tstatep("减伤60") then
        weight = weight+6
    end
    if tstatep("减伤50") then
        weight = weight+5
    end
    if tstatep("减伤40") then
        weight = weight+4
    end
    if isOut then
        if tstatep("减伤30") then
            weight = weight+3
        end
        if tstatep("闪避100") then
            weight = weight+100
        end
        if tstatep("闪避70") then
            weight = weight+7
        end
        if tstatep("闪避60") then
            weight = weight+6
        end
        if tstatep("闪避50") then
            weight = weight+5
        end
        if tstatep("闪避40") then
            weight = weight+4
        end
        if tstatep("闪避30") then
            weight = weight+3
        end
        if tstatep("闪避20") then
            weight = weight+3
        end

    end
    --if tstatep("沉默") then
    --    --如果目标可控制
    --    weight = weight - 2
    --end
    --if tstatep("缴械") then
    --    --如果目标可控制
    --    weight = weight - 2
    --end
    --if tstatep("封内") then
    --    --如果目标可控制
    --    weight = weight - 2
    --end
    --if tstatep("禁疗") then
    --    --如果目标可控制
    --    weight = weight - 2
    --end
    ----if tstatep("定身") then
    ----    --如果目标可控制
    ----    weight = weight - 1
    ----end
    ----if tstatep("眩晕") then
    ----    --如果目标可控制
    ----    weight = weight - 1
    ----end
    --if tstatep("击倒") then
    --    --如果目标可控制
    --    weight = weight - 1
    --end
    --if GetBuffTime(tbuffList,chenmo) then
    --	weight = weight -3
    --	--OutputinGame("shanbi10")
    --end
    if tlife() < 10 then
        weight = weight - 10
    end
    if tlife() >= 10 and tlife() < 20 then
        weight = weight - 9
    end
    -- Output("5")
    if tlife() >= 20 and tlife() < 30 then
        weight = weight - 8
    end
    -- Output("6")
    if tlife() >= 30 and tlife() < 40 then
        weight = weight - 7
    end
    -- Output("7")
    if tlife() >= 40 and tlife() < 50 then
        weight = weight - 6
    end
    -- Output("8")
    if tlife() >= 50 and tlife() < 60 then
        weight = weight - 5
    end
    if tlife() >= 60 and tlife() < 70 then
        weight = weight - 4
    end
    if tlife() >= 70 and tlife() < 80 then
        weight = weight - 3
    end
    if tlife() >= 80 and tlife() < 90 then
        weight = weight - 2
    end
    if tlife() >= 90 and tlife() < 100 then
        weight = weight - 1
    end

    return weight
end





--function duobi()
--	local jineng= {"雷震子" , "生死劫" , "撼地" , "千斤坠" , "疾" , "七星拱瑞" , "龙跃于渊" , "龙战于野" , "棒打狗头" , "盾猛" , "突" , "剑冲阴阳" , "封渊震煞" , "擒王六式" , "割据秦宫" , "断魂刺" , "醉月" , "惊涛"}
--	for key, value in ipairs(jineng)
--	do
--		if rlast(value, "敌对", 1) then
--			return true
--		end
--		if isme() and tlast(value, 1) then			--如果目标的目标是我
--			return true
--		end
--	end
--	return false
--end
function boom()
    local count = 0
    if bufftime("钟林毓秀")>10 then
        count = count+1
    end
    if bufftime("兰摧玉折")>10 then
        count = count+1
    end
    if bufftime("商阳指")>10 then
        count = count+1
    end
    return count
end
function bufftime(id)
    mbuff = GetBuff(this_player)
    return GetBuffTime(mbuff, id)
end
---缴械时间
function jiaoxieTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "缴械")
    if time then
        return time
    end
    return 0
end
---眩晕时间
function yunxuanTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "眩晕")
    if time then
        return time
    end
    return 0
end
---定身时间
function dingshenTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "定身")
    if time then
        return time
    end
    return 0
end
---锁足时间
function suozuTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "锁足")
    if time then
        return time
    end
    return 0
end
---击倒时间
function jidaoTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "击倒")
    if time then
        return time
    end
    return 0
end
---减疗时间
function jianliaoTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "减疗")
    if time then
        return time
    end
    return 0
end
---封内时间
function fengneiTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "封内")
    if time then
        return time
    end
    return 0
end
---沉默时间
function chenmoTime()
    tbuffList = GetBuff(target)
    local time = GetTypeTime(tbuffList, "沉默")
    if time then
        return time
    end
    return 0
end
function onHorse()
    return this_player.bOnHorse
end
function cdEX(skill)
    ---通过已经释放的技能时间来判断技能是否cd
    --if skill()
    --print(skill)
    return GetSkillSCD(skill) > 0
end
function cdEX2(skill)
    ---充能技能判断
    return GetSkillCN(skill) == 0
end

function kongzhiTimeEX(time)
    --print(time)
    return dingshenTime() >= time or yunxuanTime() >= time or jidaoTime() >= time
end
function kongzhi()
    --print(time)
    return dingshenTime() > 0 or yunxuanTime() >0 or jidaoTime() >0
end
function jiekongTimeEX(time)
    return (dingshenTime() > 0 and dingshenTime() < time) or (yunxuanTime() > 0 and yunxuanTime() < time) or (jidaoTime() > 0 and jidaoTime() < time)
end
function jiekongTimeEX2(time)
    ---接空时间不带击倒
    return (dingshenTime() > 0 and dingshenTime() < time) or (yunxuanTime() > 0 and yunxuanTime() < time)
end
function jiekongTimeEX3(time)
    ---接空时间只有定身
    return (dingshenTime() > 0 and dingshenTime() < time)
end
---不能丢技能的时间
function noSkillTime(time)
    return  fengneiTime() > time or  chenmoTime() > time or  jiaoxieTime() > time
end

function seeObj(obj)
    local count = 0
    if obj ==nil then
        return 0
    end
    --遍历队伍成员
    for k, v in ipairs(GetAllMember()) do
        if IsPlayer(v.dwID) and IsParty(v) and objState(v, "重伤")==false  then
            local z_target, z_tclass = GetTarget(v)
            if z_target and obj.dwID == z_target.dwID then
                count = count+1
            end
        end
    end
    return count
end
function findNoSeediren()
    ---寻找没人看的目标
    local seeObjList = {}
    --遍历队伍成员
    for k, v in ipairs(GetAllMember()) do
        if IsPlayer(v.dwID) and IsParty(v) and objState(v, "重伤")==false  then
            local z_target, z_tclass = GetTarget(v)
            seeObjList[k] = z_target
        end
    end
    for k, v in ipairs(GetAllMember()) do
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "重伤")==false and  GetDist(this_player, v) < 8 and IsVisible(this_player, v)  then
            local nosee = true
            for see_k, see_v in ipairs(seeObjList) do
                if v ==see_v then
                    nosee = false
                end
            end
            if nosee then
                return v
            end
        end
    end
end
function nojiekong(obj,skill,chixu,time)
    return GetCastTime(obj,skill)>chixu and GetCastTime(obj,skill)<time
end
function death(obj)
    ---抓点   化蝶2228
    ---疾如风
    if nojiekong(obj,412,3,50) then
        return true
    end
    ---盅虫献祭    女娲补天
    if objmount(obj,"补天诀") and  nojiekong(obj,2226,4,30) and nojiekong(obj,2230,20,54) then
        return true
    end
    ---锻骨决
    if nojiekong(obj,257,8,35) then
        return true
    end
    ---蝶弄足   鹊踏枝
    if objmount(obj,"冰心诀|云裳心经") and GetCastCount(obj,574,75)>2 and GetCastCount(obj,550,75)>2 then
        return true
    end
    ---星楼  太阴指
    if objmount(obj,"花间游|离经易道") and  nojiekong(obj,100,4,18) and GetCastCount(obj,228,22)>2 then
        return true
    end
    ---散流霞
    if objmount(obj,"北傲诀") and  GetCastCount(obj,16608,40)>3 then
        return true
    end
    return false
end
function needTui(obj)
    ---需要推
    if target ==nil then
        return false
    end
    if tbuff("疾电叱羽")then
        return true
    end
    ---献祭
    local npc,count = FindNpc(target, "59171", 8, "敌对")
    if count>0 then
        return true
    end
    ---生太极,吞日月
    npc,count = FindNpc(target, "气场生太极|气场吞日月", 18, "敌对")
    if count>0 then
        return true
    end
    return false
end
function toBack()
    ---自动绕背
    if target and  GetDist(target) <=4 then
        if IsBack(target) then
            MoveForwardStop()
        else
            MoveForwardStart()
        end
    end
end
function toFor()
    ---自动绕背
    if GetDist(target) <=3 then
        if IsBack(target) then
            StrafeLeftStop()
        else
            StrafeLeftStart()
        end
    end
end
function findTarget(outTarger)
    ---是否排除当前目标
    ---寻找适合的目标
    local players = GetAllPlayer()
    local lastTar = nil
    local lastWeight = 100
    for k, v in ipairs(players) do
        --v是玩家对象
        local weight = 10
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "重伤")==false and IsDangerArea(v, "敌对") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objNotWudi(v) then
            --如果不是我
            if outTarger == false or v ~= target then
                ---如果需要排除当前目标
                if objLife(v) == 0 or objState(v, "重伤") then
                    weight = weight + 100
                end
                if objLife(v) > 80 and objLife(v) <= 90 then
                    weight = weight - 1
                end
                if objLife(v) > 70 and objLife(v) <= 80 then
                    weight = weight - 2
                end
                if objLife(v) > 60 and objLife(v) <= 70 then
                    weight = weight - 3
                end
                if objLife(v) > 50 and objLife(v) <= 60 then
                    weight = weight - 4
                end
                if objLife(v) > 40 and objLife(v) <= 50 then
                    weight = weight - 5
                end
                if objLife(v) > 30 and objLife(v) <= 40 then
                    weight = weight - 6
                end
                if objLife(v) > 20 and objLife(v) <= 30 then
                    weight = weight - 7
                end
                if objLife(v) > 10 and objLife(v) <= 20 then
                    weight = weight - 8
                end
                if objLife(v) > 0 and objLife(v) <= 10 then
                    weight = weight - 9
                end
                if objState(v, "眩晕|击倒|僵直|定身") then
                    weight = weight - 3
                end
                if lastWeight > weight then
                    lastWeight = weight
                    lastTar = v
                end
            end
        end
    end
    ---如果遍历的目标不等于nil
    if lastTar ~= nil then
        SetTarget(lastTar)
    end
end
function findTargetforHp(hp)
    ---获取指定血量的敌对目标

    ---寻找适合的目标
    local players = GetAllPlayer()
    local lastTar = nil
    local lastWeight = 100
    for k, v in ipairs(players) do
        --v是玩家对象
        local weight = 10
        if IsPlayer(v.dwID) and IsEnemy(v) and  objmount(v,"凌海决")==false and objState(v, "重伤")==false and IsDangerArea(v, "敌对") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objLife(v) < hp and objNotWudi(v) then
            --如果不是我
            if objLife(v) == 0 or objState(v, "重伤") then
                weight = weight + 100
            end
            if objLife(v) > 80 and objLife(v) <= 90 then
                weight = weight - 1
            end
            if objLife(v) > 70 and objLife(v) <= 80 then
                weight = weight - 2
            end
            if objLife(v) > 60 and objLife(v) <= 70 then
                weight = weight - 3
            end
            if objLife(v) > 50 and objLife(v) <= 60 then
                weight = weight - 4
            end
            if objLife(v) > 40 and objLife(v) <= 50 then
                weight = weight - 5
            end
            if objLife(v) > 30 and objLife(v) <= 40 then
                weight = weight - 6
            end
            if objLife(v) > 20 and objLife(v) <= 30 then
                weight = weight - 7
            end
            if objLife(v) > 10 and objLife(v) <= 20 then
                weight = weight - 8
            end
            if objLife(v) > 0 and objLife(v) <= 10 then
                weight = weight - 9
            end
            if objState(v, "眩晕|击倒|僵直|定身") then
                weight = weight - 3
            end
            if lastWeight > weight then
                lastWeight = weight
                lastTar = v
            end
        end
    end
    ---如果遍历的目标不等于nil
    if lastTar ~= nil then
        print("选择40%血的目标")
        SetTarget(lastTar)
    end
end

function findTargetforRange(range)
    ---获取指定范围内的敌对目标
    ---range  范围
    if range == nil then
        return nil
    end
    ---寻找适合的目标
    local players = GetAllPlayer()
    local lastTar = nil
    local lastWeight = 100
    for k, v in ipairs(players) do
        --v是玩家对象
        local weight = 10
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "重伤")==false and IsDangerArea(v, "敌对") == false and GetDist(this_player, v) < range and IsVisible(this_player, v) and objNotWudi(v) then
            --如果不是我
            if objLife(v) == 0 or objState(v, "重伤") then
                weight = weight + 100
            end
            if objLife(v) > 80 and objLife(v) <= 90 then
                weight = weight - 1
            end
            if objLife(v) > 70 and objLife(v) <= 80 then
                weight = weight - 2
            end
            if objLife(v) > 60 and objLife(v) <= 70 then
                weight = weight - 3
            end
            if objLife(v) > 50 and objLife(v) <= 60 then
                weight = weight - 4
            end
            if objLife(v) > 40 and objLife(v) <= 50 then
                weight = weight - 5
            end
            if objLife(v) > 30 and objLife(v) <= 40 then
                weight = weight - 6
            end
            if objLife(v) > 20 and objLife(v) <= 30 then
                weight = weight - 7
            end
            if objLife(v) > 10 and objLife(v) <= 20 then
                weight = weight - 8
            end
            if objLife(v) > 0 and objLife(v) <= 10 then
                weight = weight - 9
            end
            if objState(v, "眩晕|击倒|僵直|定身") then
                weight = weight - 3
            end
            if lastWeight > weight then
                lastWeight = weight
                lastTar = v
            end
        end
    end
    ---如果遍历的目标不等于nil
    if lastTar ~= nil then
        SetTarget(lastTar)
    end
end

function setAll(player)
    this_player = player
    --print("111")
    mbuff = GetBuff(player)
    target, tclass = GetTarget(player)
    if target ~= nil then
        tbuffList = GetBuff(target)
        ttarget, ttclass = GetTarget(target)
        if ttarget ~= nil then
            ttbuffList = GetBuff(ttarget)
        end
    return target
    end
end