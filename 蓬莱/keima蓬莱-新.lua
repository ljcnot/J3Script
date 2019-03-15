local save_target
local target
local tclass
local this_player
local mbuff
local tbuffList
local ttarget
local ttclass
local ttbuffList
local gcdsj = 0.2 --gcd时间
local help = false
local lastSelectTime = 0
local isprint = true
--local youxian3 ={}
AddOption("自动切残血")
szScriptDesc = "作者：keima\n说明：脚本说明\n奇穴：[渊壑][扶桑][乘龙][遥思][冯夷][遨宇][鸿轨][跃潮][溯徊][翔极碧落][穹庐][澹然若海]"
function ota(desc)
    local mota, motatime, motaratio = GetPrepare()
    return string.find(desc, mota)~=nil
end
function tota(desc)
    local mota, motatime, motaratio = GetPrepare(target)
    return string.find(desc, mota)~=nil
end
function totaEX()
    local mota, motatime, motaratio = GetPrepare(target)
    return motatime>0
end
function objLife(obj)
    if obj == nil then
        return 999
    end
    local bfb = (obj.nCurrentLife / obj.nMaxLife) * 100
    return bfb
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
    return face()>=0 and face()<=15
end
function buff(list)
    mbuff = GetBuff(this_player)
    return GetBuffTime(mbuff, list) > 0
end
function tbuff(list)
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
    CastTo(skillid,target,true)
end
function skillEX2(skillid)
    ---打断当前读条
    Cast(skillid,true,true)
end

function dis()
    return GetDist(target)
end
function his()
    if target == nil or  tclass == NPC then
        return 0
    end
    return GetHeight(target)
end
function mhis()
    return GetHeight(this_player)

end
function dis2()
    return GetDist2D(target)
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
    ----print(school)
    return string.find(desc, school)~=nil
end
function tmount(desc)
    if tclass == NPC then
        return false
    end

    local school = GetMount(target)
    ----print(school)
    if school == nil then
        return false
    end
    return string.find(desc, school)~=nil
end

function statep(desc)
    ----print(desc)
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
    ----print(desc)
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
    local wudi = {203,9695,10212,9934,377}
    for k, v in ipairs(wudi) do
        if obj.IsHaveBuff(v, 0) then
            return false
        end

    end
return true
end
---权重计算
function getWeight()
    --获取自己的buff数据
    --local mbuff = GetBuff(player)
    --获取目标的buff数据
    --local tbuffList = GetBuff(target)

    local wudi = "镇山河|平沙落雁|鬼斧神工|散流霞|笼花|盾立|南风吐月|笑醉狂|太虚|力挽狂澜|啸如虎|浴火|不动|蚀心蛊"
    local jianshang80 = "9696|7119|368|10307"
    --清绝影歌 轮回 守如山 笑傲光阴
    local jianshang70 = "8421|10493|1802|384"
    --坚韧 无相决 御天 转乾坤
    local jianshang60 = "6264|11319|8300|13044|9836|9206|6200"
    --春泥护花 临渊蹈河 盾墙 无相诀 摩咭 万籁之寂  龙啸九天
    local jianshang50 = "9810|6315|10014|8427|9803|6306|2983|1412|3068"
    --舍身 零落 绝歌 荣辉 无相诀 光明相 无我 屹立不倒 雾体
    local jianshang40 = "9873|2953|1187|399|9693|6279|11920|8839|6637|6636|6257|5744|6163|9874|9293|12530|122|6240|12656|9208|8495|6248"
    --曳光 圣手织天 西宗 无相决 清绝影歌 贪魔体 春泥护花 圣手织天 圣手织天 圣手织天 春泥护花 贪魔体 守如山 散影 残影 乘龙戏水 春泥护花 玄水蛊 水榭花盈 万籁之寂 捍卫 枯残蛊
    local jianshang30 = "9510|11457|9895|9745|9896|8302|12286|2177|10051|9510|5641|6262|6160|5806|5705|2813|6247"
    --青霄飞羽 易水 志酬 朝圣 盾舞 肃列 左旋右转 正骨 杯水留影 青霄飞羽 金甲 金屋 雷心 大明 舍身 随风 蛊影
    local jianshang20 = "2983|7790|7171|6378|6209|5746"
    --无我 龙战 善护 驯致 无相决 流光囚影
    local jianshang10 = "11272|9904|9763|11344|6333|6610|5750|10024|12411|8424|6540|6337|6237|5770|4479|6113"
    --初熟 叠泉 春辞 春辞 上将军印 纵横 归去来 归寂道 袈裟 乘龙戏水 坚定 归山 贞护 圣涌 桃僵 折冲 千机神速
    local miankong = "菩提身|青阳|突|零落|笑醉狂|出渊|吞日月|龙跃于渊|蛊虫献祭|碧蝶献祭|风蜈献祭|不工|力拔|飞鸢逐月|秘影|浮空|浮空|星楼月影|归酣|素衿|超然|灵辉|生死之交|素衿|啸日|星楼月影|转乾坤|转乾坤|圣体|流火飞星|宽野|霸体|千斤坠|须弥|烟雨行|霸体|酒中仙|纵轻骑|任驰骋|生太极|生太极|行天道|蛊虫狂暴|松烟竹雾·miankong|斗室无尘|斗室无尘|捣衣|石间意|尘身|尘身|破重围|音韵|探梅|捣衣|孤影|净果|捍卫|劫化|西楚悲歌|盾墙|绝伦逸群|千蝶吐瑞|盾毅|千险|无惧|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|尘身|破月|青霄飞羽|浮空|青蒂|水月无间|折骨|蚀心蛊|玉泉鱼跃|蛊影|噬蛊|免疫控制|青霄飞羽|遁影"
    local shanbi80 = "10619|9846|9783"
    --雾雨|惊鸿游龙 鹊踏枝
    local shanbi60 = "6434|9783|5668|9736"
    --醉逍遥 鹊踏枝 风吹荷 慈悲愿

    local shanbi50 = "2065|6299|8866|677"
    --云稀松 御风而行 鹊踏枝 鹊踏枝
    local shanbi40 = "6174|4028|10618"
    --两生 圣月佑 雾雨
    local shanbi30 = "4931|6146"
    --龙悔 日升
    local shanbi20 = "4710|6142|3310|948"
    --旷劫 冰天 游龙 花月凌风六阵
    local shanbi10 = "857|10465|6289|10617"
    --闪躲 鸟翔碧空 慈悲 雾雨

    local fengnei = { "八卦洞玄|抢珠式|厥阴指|寒月耀|清音长啸|梅花针|凄切|蟾啸夺命|蟾啸枯残|蟾啸迷心|蟾啸迷心|缠竹|剑破虚空|沉默|雷霆震怒" }
    local chenmo = "雷云|剑飞惊天|兰摧玉折|沉默|剑飞惊天|止息|井仪|沉默|风切|剑心通明|震慑"
    local jianliao = "活祭|禁疗|息疗|清绝影歌|玄一|盾击|地龙钻|减疗|神龙降世|穿心弩|霹雳|蝎蛰|恒河劫沙|尘息|吞楚|百足夺命|百足枯残|百足迷心|楚济|清绝影歌"
    local jidao = { "割据秦宫|踏宴扬旗|击倒" }
    local suozu = { "擒龙|冻土|割据秦宫|逐星箭|琴音|复征|物我|影狱|钟林毓秀|剑·羽|落雁|滞|五方行尽|碎冰|百足|太阴指|禁缚|伏夜·缠|流光囚影|幽月|圣蝎献祭|刖足|铁爪|孔雀翎|袖手|天蛛献祭|影滞|百足夺命|百足枯残|百足迷心|五方行尽|三才化生|吐故纳新|绕足|止水|影痕|锁足" }
    local dingshen = { "缠心|点苍|定身|无助|安患|金针|天绝地灭|迷影|大道无术|伏夜·定|丝牵|幻蛊|绛唇珠袖|松涛|同归|破势|太阴指|完骨|帝骖龙翔|傍花随柳|芙蓉并蒂|七星拱瑞|余音|幻蛊|定身|剑神无我|大道无术" }
    local yunxuan = { "眩晕|千斤坠|裁骨|割据秦宫|迷神钉|薄伐|贯木流华|无名魂锁|盾猛|盾毅|撼地|醉逍遥|净世破魔击|幻光步|虎贲|弩击|善护|镇魔|伏夜·晕|重伤|雷震子|日影|剑冲阴阳|北斗|蝎心夺命|蝎心枯残|蝎心迷心|断魂刺|碧王|鹤归孤山|危楼|醉月|当头一敲|中注|破坚阵|蝎毒针|震慑|大狮子吼|五蕴皆空|突|战吼眩晕|追魂|日劫|峰插云景|崩" }
    local jiaoxie = "浮云|霞流|怖畏暗刑|缴械"
    local youxian3 = { "补天诀", "花间游", "相知" }
    local youxian2 = { "莫问", "焚影圣决", "惊羽诀", "天罗诡道", "傲血战意", "紫霞功", "笑尘决" }
    local youxian1 = { "离经易道", "云裳心经", "太虚剑意", "冰心诀" }

    local weight = 10
    --OutputinGame("---------------------------------")
    if GetBuffTime(tbuffList, wudi) > 0 then
        weight = weight + 100
    end
    if tstatep("无敌") then		--如果目标可控制
        weight= weight +100
    end
    if tstatep("不死") then		--如果目标可控制
        weight= weight +100
    end
    if GetBuffTime(tbuffList, wudi) > 0 then
        weight = weight + 100
    end
    if GetBuffTime(tbuffList, jianshang80) > 0 then
        weight = weight + 8
        --OutputinGame("jianshang80")
    end
    if GetBuffTime(tbuffList, jianshang70) > 0 then
        weight = weight + 7
        --OutputinGame("jianshang70")
    end
    if GetBuffTime(tbuffList, jianshang60) > 0 then
        weight = weight + 6
        --OutputinGame("jianshang60")

    end
    if GetBuffTime(tbuffList, jianshang50) > 0 then
        weight = weight + 5
        --OutputinGame("jianshang50")
    end
    if GetBuffTime(tbuffList, jianshang40) > 0 then
        weight = weight + 4
        --OutputinGame("jianshang40")
    end
    if GetBuffTime(tbuffList, jianshang30) > 0 then
        weight = weight + 3
        --OutputinGame("jianshang30")
    end
    if GetBuffTime(tbuffList, jianshang20) > 0 then
        weight = weight + 2
        --OutputinGame("jianshang20")
    end
    if GetBuffTime(tbuffList, jianshang10) > 0 then
        weight = weight + 1
        --OutputinGame("jianshang10")
    end
    if GetBuffTime(tbuffList, shanbi80) > 0 then
        weight = weight + 8
        --OutputinGame("shanbi80")
    end
    if GetBuffTime(tbuffList, shanbi60) > 0 then
        weight = weight + 6
        --OutputinGame("shanbi60")
    end
    if GetBuffTime(tbuffList, shanbi50) > 0 then
        weight = weight + 5
        --OutputinGame("shanbi50")
    end
    if GetBuffTime(tbuffList, shanbi40) > 0 then
        weight = weight + 4
        --OutputinGame("shanbi40")
    end
    if GetBuffTime(tbuffList, shanbi30) > 0 then
        weight = weight + 3
        --OutputinGame("shanbi30")
    end
    if GetBuffTime(tbuffList, shanbi20) > 0 then
        weight = weight + 2
        --OutputinGame("shanbi20")
    end
    if GetBuffTime(tbuffList, shanbi10) > 0 then
        weight = weight + 1
        --OutputinGame("shanbi10")
    end

    if GetBuffTime(tbuffList, jianliao) > 0 then
        weight = weight - 3
        --OutputinGame("shanbi10")
    end
    if tstatep("沉默") then		--如果目标可控制
        weight= weight -3
    end
    if tstatep("缴械") then		--如果目标可控制
        weight= weight -3
    end
    if tstatep("封内") then		--如果目标可控制
        weight= weight -3
    end
    if tstatep("禁疗") then		--如果目标可控制
        weight= weight -3
    end
    if tstatep("定身") then		--如果目标可控制
        weight= weight -1
    end
    if tstatep("眩晕") then		--如果目标可控制
        weight= weight -1
    end
    if tstatep("击倒") then		--如果目标可控制
        weight= weight -2
    end
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

function cdEX(skill)
    ---通过已经释放的技能时间来判断技能是否cd
    --if skill()
    --print(skill)
    return GetSkillSCD(skill) > 0
end
function cdEX2(skill)
    ---充能技能判断
    return GetSkillCN(skill)==0
end

function kongzhiTimeEX(time)
    ----print(time)
    return dingshenTime() >= time or yunxuanTime() >= time or jidaoTime() >= time
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
    return (fengneiTime() > 0 and fengneiTime() > time) or (chenmoTime() > 0 and chenmoTime() > time) or (jiaoxieTime() > 0 and jiaoxieTime() > time)
end
function jiekong()
    if (GetSkillGCD("醉月") + gcdsj) > dingshenTime() then
        return false
    end
    if (GetSkillGCD("醉月") + gcdsj) > yunxuanTime() then
        return false
    end
    if (GetSkillGCD("醉月") + gcdsj) > jidaoTime() then
        return false
    end
    return true
end
function wuhuatianxing(weight)
    ---物化天行
    if dis()>30 or dis()<2 or cdEX2("物化天行") or (tstatep("免控") and weight>8) then
        return false
    end

    return true
end
function minghaiyubo()
    ---溟海御波
    if dis()>8 or cdEX2("溟海御波")   then
        return false
    end
    return true
end
function nanhaiyunming()
    ---海运南冥
    if   cdEX("海运南冥") or GetSkillCN("溟海御波")>=2 or dis()>8  then
        return false
    end
    return true
end
function yichenbuxu()
    ---逸尘步虚
    if cdEX2("逸尘步虚") then
        return false
    end
    --if cdEX2("溟海御波") and cdEX2("物化天行") then
    --    ----print(GetCastTime(this_player,20288))
    --    return true
    --end
    --if cdEX2("物化天行") and buff("13735") and GetCastTime(this_player,20285)>2 then
    --    return true
    --end
    --if cdEX2("物化天行") and GetCastTime(this_player,20949)< 1 and GetCastTime(this_player,20285)>2  then
    --    return  true
    --end
    --if dis()>30 and isPositive() then
    --    return true
    --end
    if isPositive() and cdEX2("物化天行")==false and GetCastTime(this_player,20949)> 0.4 and GetCastTime(this_player,20949)< 0.6 and (GetCastTime(this_player,20285)<=0 or GetCastTime(this_player,20285)>2)   then
        ----print(GetCastTime(this_player,20288))
        return true
    end
    if isPositive() and cdEX2("物化天行") and buff("13735") and (GetCastTime(this_player,20285)<=0 or GetCastTime(this_player,20285)>2) then
        return true
    end
    return false
end
function shangsheng()
    if cdEX2("逸尘步虚") and cdEX2("物化天行") then
        return false
    end
    ---物化天行 上升
    if cdEX("溟海御波") or dis()>8 then
        ----print(GetCastTime(this_player,20288))
        return true
    end
    return false
end
function zhubolingyou(weight)
    ---逐波灵游
    if dis()>5 or cdEX("逐波灵游") or tstate("冲刺") or tstatep("免控") then
        return false
    end
    if weight< 8 then
        return true
    end
    if his()>8 then
        return true
    end
    return false
end
function fuyoutiandi()
    ---浮游天地
    if cdEX2("浮游天地") or buff("浮游天地") or (GetHeight(this_player)>10 and GetHeight(this_player)<20 ) then
        return false
    end
    return true
end
function yuechaozhanbo()
    ---跃潮斩波
    if dis()>25 then
        return false
    end
    if tstatep("免控") or tstate("冲刺") then
        return false
    end

    if buff("浮游天地") and cdEX2("浮游天地") and  cdEX2("物化天行") and cdEX2("逸尘步虚") and buff(13735) then
        return true
    end

    if buff("浮游天地") ==false  then
        return true
    end
    return false
end
function muluoyangui()
    ---木落雁归
    if dis()>6 then
        return false
    end
    if buff("浮游天地") and cdEX("跃潮斩波") and buff(13735)  and cdEX2("逸尘步虚") and cdEX2("物化天行") and cdEX("浮游天地")==false then
        return true
    end
    if buff("浮游天地") ==false then
        return true
    end
    return false
end
function yijueyuntian()
    ---翼绝云天
    if buff("翼绝云天") then
        return false
    end
    return true
end
function yuyuchifeng()
    ---驭羽骋风
    if cdEX("驭羽骋风") then
        return false
    end
    if state("眩晕|定身|爬起") then
        return true
    end
    if buff("浮游天地")==false and cdEX("浮游天地") and mhis()>8 then
        return true
    end
    return false
end
function zhenchitunan(weight)
    ---振翅图南
    if cdEX("振翅图南") or dis()>20 then
        return false
    end
    if kongzhiTimeEX(1.5) then
        return true
    end
    if weight<5 then
        return true
    end
    return false
end
function jidianchiyu()
    ---疾电叱羽
    if cdEX("疾电叱羽") then
        return false
    end
    if life()<50 then
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
function xiangjibiluo()
    ---翔极碧落
    if  HaveTalent("翔极碧落")==false or cdEX("翔极碧落") then
        return false
    end
    if tstatep("免打断") and totaEX()  then
        return true
    end
    return false
end
function hongjianyufei(weight)
    ---鸿渐于飞
    if HaveTalent("鸿渐于飞")==false or cdEX("鸿渐于飞") or dis()>25 then
        return false
    end
    if buff("浮游天地") then
        if cdEX2("物化天行") and buff(13735) then
            return true
        end
        if weight<=8 then
            return true
        end
    else
        return true
    end

return false
end
function fuyaojiutian()
    ---扶摇九天
end
function zhanranruohai(weight)
    ---澹然若海
    if cdEX("澹然若海") or dis()>15 then
        return false
    end
    if cdEX2("物化天行") and FindNpc(this_player, "驰风震域", 15, "自己") and tstatep("免控")==false  and cdEX2("浮游天地") then
        return true
    end
    if FindNpc(this_player, "驰风震域", 15, "自己") and kongzhiTimeEX(2) and cdEX2("浮游天地") then
        return true
    end
    if weight<=2 and cdEX2("浮游天地") then
        return true
    end

    return false
end
function dingbodilan()
    ---定波砥澜
    if buff("浮游天地") then
        return false
    end
    if cdEX("木落雁归") and cdEX("跃潮斩波") then
        return true
    end
    return false
end

function fly(weight)

    ---浮游状态
    if yichenbuxu() then
        skillEX(20285)
    end
    if wuhuatianxing(weight) then
        ----print("物化天行")
        Cast("物化天行",false,true)
    end
    if zhubolingyou(weight) then
        skillEX("逐波灵游")
    end
    if nanhaiyunming() then
        ----print("海运南冥")
        skillEX("海运南冥")
        --return
    end
    if minghaiyubo() then
        ----print("溟海御波")
        skillEX("溟海御波")
        --return
    end

    if shangsheng() then
        skillEX(20949)
    end

    if zhanranruohai(weight) then
        skillEX("澹然若海")
    end
    --if hongjianyufei(weight) then
    --    skill("鸿渐于飞")
    --end
    if yuechaozhanbo() then
        skill("跃潮斩波")
    end
    if muluoyangui() then
        skill("木落雁归")
    end
end
function ground(weight)
    if mhis()<8 and buff(208) and cdEX("浮游天地") then
        Jump()
    end
    ---地面
    if zhanranruohai(weight) then
        skillEX("澹然若海")
    end
    if fuyoutiandi() then
        skill("浮游天地")
    end
    if hongjianyufei(weight) then
        skill("鸿渐于飞")
    end
    if yuechaozhanbo() then
        skill("跃潮斩波")
    end
    if muluoyangui() then
        skill("木落雁归")
    end
end
function bird(weight)
    ---鸟
    if yijueyuntian() then
        skill("翼绝云天")
    end
    if yuyuchifeng() then
        skill("驭羽骋风")
    end
    if zhenchitunan(weight) then
        skill("振翅图南")
    end
    if xiangjibiluo() then
        skill("翔极碧落")
    end
    if jidianchiyu() then
        skill("疾电叱羽")
    end
end


function DPS(weight)

    bird(weight)
    if  HaveTalent("鸿渐于飞") then
        skill("飞刃破风")
        skill("风云重锁")
    end

    if buff("浮游天地") then
        fly(weight)
    else
        ground(weight)
    end



end
function toBack()
    ---自动绕背
    if GetDist(target) <=2 then
        if IsBack(target) then
            MoveForwardStop()
        else
            MoveForwardStart()
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "敌对") == false and objState(v, "重伤")==false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objNotWudi(v) then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "敌对") == false and objState(v, "重伤")==false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objLife(v) < hp and  objNotWudi(v) then
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
        --print("选择40%血的目标")
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
        if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "重伤")==false  and IsDangerArea(v, "敌对") == false and GetDist(this_player, v) < range and IsVisible(this_player, v) and  objNotWudi(v) then
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

function tab(weight)
    if objState(target, "重伤")  then
        findTargetforRange(30)
        --print("目标重伤")

    end
    if IsParty(target) then
        if target ~=nil then
            SetTarget(save_target)
        end
    else
        if target ~=nil then
            save_target = target
        end
    end
    if  target == nil and save_target~=nil then
        save_target = target
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
    --if HaveTalent("探梅") and cdEX("探梅") == false then
    --    ---如果探梅没CD 并且目标是敌对
    --    local target
    --    --遍历队伍成员
    --    for k, v in ipairs(GetAllMember()) do
    --        if IsPlayer(v.dwID) and GetDist(this_player, v) < 15 and IsVisible(this_player, v) and v~=this_player  and v.IsHaveBuff(9695, 0) == false and v.IsHaveBuff(10212, 0) == false then
    --            local tate = GetState(v)
    --            if string.find("眩晕|定身|爬起|僵直", tate) and objLife(v) < 90 then
    --                --先保存当前对象
    --                if ota("风来吴山") then
    --                    CastTo("探梅", v, true)
    --                else
    --                    CastTo("探梅", v, false)
    --                end
    --                --print("给探梅")
    --                --return 1
    --            end
    --        end
    --    end
    --end
    --if HaveTalent("松舍问霞") and cdEX("松舍问霞") == false  then
    --    ---如果探梅没CD 并且目标是敌对
    --    local target
    --    --遍历队伍成员
    --    for k, v in ipairs(GetAllMember()) do
    --        if IsEnemy(v.dwID) and GetDist(this_player, v) < 20 and GetHeight(v)>8 and IsVisible(this_player, v) and v~=this_player  and v.IsHaveBuff(9695, 0) == false and v.IsHaveBuff(10212, 0) == false then
    --            local tate = GetState(v)
    --            if string.find("冲刺", tate) == false then
    --                --先保存当前对象
    --                if ota("风来吴山") then
    --                    CastTo("松舍问霞", v, true)
    --                else
    --                    CastTo("松舍问霞", v, false)
    --                end
    --                --print("松舍问霞")
    --                --return 1
    --            end
    --        end
    --    end
    --end
    ----print("当前目标是否是队友",IsParty(target))
    --if cdEX("探梅") and IsParty(target) and life() >40 then
    --	if save_target ~= nil then
    --		--换回保存的目标
    --		SetTarget(save_target)
    --		--print("探梅完了,切回原来目标")
    --
    --		return 1
    --	else
    --		findTarget(false)
    --	end
    --	--print("探梅完了")
    --end
    -----上次切换目标大于5秒才会换目标
    if weight>=50 and (GetTickCount() - lastSelectTime)>5000 then
        --print("目标减伤过高")
        lastSelectTime = GetTickCount()
        findTarget(true)
    end

    --if IsDangerArea(target, "敌对") and (GetTickCount() - lastSelectTime) > 5000 then
    --    --print("危险区域切换目标")
    --    lastSelectTime = GetTickCount()
    --    findTarget(true)
    --end
    if GetOption("自动切残血") and tlife() > 40 then
        findTargetforHp(40)
    end
end

--Main函数，1个参数是自己的玩家对象，每秒调用16次
function Main(player)
    this_player = player
    mbuff = GetBuff(player)
    target, tclass = GetTarget(player)
    if target ~= nil then
        --if tclass == NPC then
        --    return
        --end


        tbuffList = GetBuff(target)
        ttarget, ttclass = GetTarget(target)
        if ttarget ~= nil then
            ttbuffList = GetBuff(ttarget)
        end
        local weight = getWeight()
        ----print("weight:",weight)
        tab(weight)
        if tbuff("盾立") then
            StopAction()
            return
        end
        --if ota("云飞玉皇") then
        --    MoveAction_StopAll()
        --    return
        --end
        ----跟随当前目标
        --if IsDangerArea(target, "敌对") then
        --    MoveAction_StopAll()
        --else
            TurnTo(target)
        --    MoveForwardStart()
        --    toBack()
        --end



        --if GetHeight(player)>0 then
        --	Jump()
        --end

        --if ota("风来吴山") then
        --    如果风车就不执行后面的
            --return
        --end
        if cdEX("扶摇直上") == false then
            Cast("扶摇直上",true,false)
        end
        DPS(weight)
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

    ----print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --输出释放信息
end


--开始读条回调函数，任意对象开始读条时调用
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end