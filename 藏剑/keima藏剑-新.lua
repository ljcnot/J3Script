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

function ota(desc)
    local mota, motatime, motaratio = GetPrepare()
    return string.find(desc, mota)
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
function buff(list)
    return GetBuffTime(mbuff, list) > 0
end
function tbuff(list)
    return GetBuffTime(tbuffList, list) > 0

end
function bufftime(id)
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
    if target == nil then
        return 0
    end
        return GetHeight(target)
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
    return string.find(desc, tate)
end
function tstate(desc)
    if target == nil then
        return false
    end
    local tstate = GetState(target)
    return string.find(desc, tstate)
end
function mount(desc)
    local school = GetMount(this_player)
    --print(school)
    return string.find(desc, school)
end
function tmount(desc)
    if tclass == NPC then
        return false
    end

    local school = GetMount(target)
    --print(school)
    if school == nil then
        return false
    end
    return string.find(desc, school)
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
    local time = GetTypeTime(tbuffList, "缴械")
    if time then
        return time
    end
    return 0
end
---眩晕时间
function yunxuanTime()
    local time = GetTypeTime(tbuffList, "眩晕")
    if time then
        return time
    end
    return 0
end
---定身时间
function dingshenTime()
    local time = GetTypeTime(tbuffList, "定身")
    if time then
        return time
    end
    return 0
end
---锁足时间
function suozuTime()
    local time = GetTypeTime(tbuffList, "锁足")
    if time then
        return time
    end
    return 0
end
---击倒时间
function jidaoTime()
    local time = GetTypeTime(tbuffList, "击倒")
    if time then
        return time
    end
    return 0
end
---减疗时间
function jianliaoTime()
    local time = GetTypeTime(tbuffList, "减疗")
    if time then
        return time
    end
    return 0
end
---封内时间
function fengneiTime()
    local time = GetTypeTime(tbuffList, "封内")
    if time then
        return time
    end
    return 0
end
---沉默时间
function chenmoTime()
    local time = GetTypeTime(tbuffList, "沉默")
    if time then
        return time
    end
    return 0
end

function cdEX(skill)
    ---通过已经释放的技能时间来判断技能是否cd
    --if skill()
    print(skill)
    return GetSkillSCD(skill) > 0
end
function cdEX2(skill)
    ---充能技能判断
    return GetSkillCN(skill)==0
end

function kongzhiTimeEX(time)
    --print(time)
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
    if dis() >= 5 then
        return true
    end
    return false
end

function pinghuduanyue()
    ---平湖断月
    if dis() > 8 or GetSkillSCD("平湖断月") or tstate("冲刺") then
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
function pinghuduanyue()
    ---黄龙吐翠
    if dis() > 6 or GetSkillSCD("黄龙吐翠") then
        return false
    end
    --if tstatep("免控")==false then
    --	return true
    --end
    return true
end
function zuiyue()
    ---醉月
    if dis() > 6 or cdEX("醉月") or this_player.nCurrentRage < 10 or tstatep("免控") or (mount("山居剑意") and cdEX("惊涛") == false) then
        return false
    end
    if tnostate("冲刺") and tstate("眩晕|定身|爬起") and jiekong() then
        return true
    end
    if tnostate("冲刺") and tstatep("免控") == false and tstate("击倒|眩晕|定身") == false then
        return true
    end
    return false
end

function xiaori(weight)
    ---啸日
    if cdEX2("啸日") then
        return false
    end
    if mount("问水诀") then
        if buff("梦泉虎跑") then
            return false
        end
        if rseeme(25) > 0 and statep("免控") == false and cdEX("梦泉虎跑") and cdEX("玉泉鱼跃") then
            --print("rseeme(25)>0 ")
            return true
        end
        if this_player.nCurrentRage >= 90 and statep("免控") == false and dis() <= 4 then
            --print("this_player.nCurrentRage>=90")
            return true
        end
        if state("击倒|眩晕|定身|锁足|僵直") and (weight <= 8 or life() <= 70) then
            --print("state(击倒|眩晕|定身|锁足|僵直)")
            return true
        end
        return false
    else
        if rseeme(25) > 0 and statep("免控") == false then
            return true
        end
        if dis() > 8 and cdEX("松舍问霞") then
            return true
        end
        ---山居剑意
        if this_player.nCurrentRage < 10 and GetSkillSCD("莺鸣柳") then
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
    if dis() <= 4 and  kongzhiTimeEX(1.44) then
        return true
    end
    return false
end
function xizhaoleifeng()
    ---夕照雷锋
    if dis() > 8 or this_player.nCurrentRage < 15 then
        return false
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
    if dis() > 21 or cdEX("鹤归孤山") or this_player.nCurrentRage < 20 or tstate("冲刺") then
        return false
    end
    if dis2() >= 6 and dis2() <= 20 then
        return true
    end
    --if life()<40 then
    --	return true
    --end
    return false
end
function fenglaiwushan(weight)
    ---风来吴山
    if dis() > 6 or this_player.nCurrentRage < 50 or cdEX("风来吴山") then
        return false
    end
    if (kongzhiTimeEX(1.5) or noSkillTime(1.5)) and weight <= 8 then
        return true
    end
    if HaveTalent("层云") and target ~= nil and target.nRunSpeed < 22 and weight <= 5 then
        return true
    end
    if HaveTalent("层云") == false and weight <= 5 then
        return true
    end
    return false
end
function fengchayunjing(weight)
    ---峰插云景
    if dis() > 6 or this_player.nCurrentRage < 10 or cdEX("峰插云景") or tstatep("免推") then
        return false
    end
    if target ~= nil and CastTime(2226, 4) then

        return true
    end
    if tbuff("枭泣|曳光") then
        return true
    end
    if cdEX("云飞玉皇") or weight > 8  then
        return false
    end
    if weight >= 6 and weight <= 8 and buff("凤鸣")  and (tstatep("免控") or (cdEX("惊涛") and cdEX("醉月"))) then
        return true
    end
    if weight <= 2 and (tstatep("免控") or (cdEX("惊涛") and cdEX("醉月"))) then
        return true
    end
    return false
end
function yingmingliu(weight)
    ---莺鸣柳
    if buff("莺鸣") or dis() > 4 then
        return false
    end
    if this_player.nCurrentRage < 10 and mount("山居剑意") then
        return true
    end
    if weight <= 5 and mount("山居剑意") then
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
    if ttlife() < 50 then
        return true
    end
    if life() < 50 then
        return true
    end
    return false
end
function jingtao()
    ---惊涛
    if HaveTalent("惊涛") == false or this_player.nCurrentRage < 10 or cdEX("惊涛") or dis() > 8 or tstatep("免控") then
        return false
    end
    if tnostate("冲刺") and tstate("定身|爬起") and jiekong()then
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

    if (weight <= 10 or tmount("补天诀|离经易道|相知|云裳心经")) and kongzhiTimeEX(1) then
        return true
    end
    if weight <= 6 then
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
    if buff("凤鸣") then
        return true
    end
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
        return 1
    end
    ---啸日
    if xiaori(weight) then
        Cast("啸日", true)
    end
    ---梦泉虎跑
    if hupao() then
        --print("虎跑")
        skill("梦泉虎跑")
    end
    ---玉泉鱼跃
    if yuyue() then
        Cast("玉泉鱼跃", true)
    end
    ---玉虹贯日
    if yuhongguanri() then
        skill("玉虹贯日")
    end
    ---平湖断月
    if pinghuduanyue() then
        skill("平湖断月")
    end
    if pinghuduanyue() then
        skill("黄龙吐翠")
    end
    -----九溪弥烟
    --if jiuximiyan() then
    --	skill("九溪弥烟")
    --end
    ---听雷
    if tinglei() then
        skill("听雷")
    end

end
function shanjujianyi(weight)
    ---山居剑意
    if zuiyue() then
        print("醉月")

        CastTo("醉月", target, true)
        --return 1
    end
    if jingtao() then
        print("惊涛")
        CastTo("惊涛", target, true)
        --return 1
    end
    if xieliubaoshi(weight) then
        print("霞流宝石")

        skill("霞流宝石")
    end

    if fengchayunjing(weight) then
        print("峰插云景")

        skillEX2("峰插云景")
    end
    ---风来吴山
    if fenglaiwushan(weight) then
        print("风来吴山")
        skillEX2("风来吴山")
        return 1
    end
    if yunfeiyuhuang(weight) then
        print("云飞玉皇")
        CastTo("云飞玉皇", target, false)
    end
    ---鹤归孤山
    if heguigushan() then
        print("鹤归孤山")

        CastTo("鹤归孤山", target, false)
    end
    ---云飞玉皇

    if songshewenxia(weight) then
        print("松舍问霞")

        skillEX("松舍问霞")
    end

    ---夕照雷锋
    if xizhaoleifeng() then
        print("夕照雷峰")
        skill("夕照雷峰")
    end
    ---啸日
    if xiaori(weight) then
        print("啸日")
        Cast("啸日", true,false)
    end


    ---听雷
    if tinglei() then
        print("听雷")

        skill("听雷")
    end
end

function DPS(weight)
    ---莺鸣柳
    if yingmingliu(weight) then
        Cast("莺鸣柳", true, false)
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
        skill("探梅")
    end
    if fengchuihe() then
        skill("风吹荷")
    end
    if shuyunzhuyue() then
        CastTo("蹑云逐月", target, false)
    end
    --print("判断心法")
    if mount("问水诀") then
        wenshui(weight)
    else
        --print("山居")
        shanjujianyi(weight)
    end

end
function toBack()
    ---自动绕背
    if GetDist(target) < 2 then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "敌对") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and v.IsHaveBuff(9695, 0) == false and v.IsHaveBuff(10212, 0) == false then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "敌对") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objLife(v) < hp and v.IsHaveBuff(203, 0) == false and v.IsHaveBuff(9695, 0) == false and v.IsHaveBuff(10212, 0) == false then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "敌对") == false and GetDist(this_player, v) < range and IsVisible(this_player, v) and v.IsHaveBuff(9695, 0) == false and v.IsHaveBuff(10212, 0) == false then
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
        print("目标重伤")

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
    if HaveTalent("探梅") and cdEX("探梅") == false then
        ---如果探梅没CD 并且目标是敌对
        local target
        --遍历队伍成员
        for k, v in ipairs(GetAllMember()) do
            if IsPlayer(v.dwID) and GetDist(this_player, v) < 15 and IsVisible(this_player, v) and v~=this_player  and v.IsHaveBuff(9695, 0) == false and v.IsHaveBuff(10212, 0) == false then
                local tate = GetState(v)
                if string.find("眩晕|定身|爬起|僵直", tate) and objLife(v) < 90 then
                    --先保存当前对象
                    if ota("风来吴山") then
                        CastTo("探梅", v, true)
                    else
                        CastTo("探梅", v, false)
                    end
                    print("给探梅")
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
            if IsEnemy(v.dwID) and GetDist(this_player, v) < 20 and GetHeight(v)>8 and IsVisible(this_player, v) and v~=this_player  and v.IsHaveBuff(9695, 0) == false and v.IsHaveBuff(10212, 0) == false then
                local tate = GetState(v)
                if string.find("冲刺", tate) == false then
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
    --if weight>=15 and (GetTickCount() - lastSelectTime)>5000 then
    --	print("目标减伤过高")
    --	lastSelectTime = GetTickCount()
    --	findTarget(true)
    --end

    if IsDangerArea(target, "敌对") and (GetTickCount() - lastSelectTime) > 5000 then
        print("危险区域切换目标")
        lastSelectTime = GetTickCount()
        findTarget(true)
    end
    if tlife() > 40 then
        findTargetforHp(40)
    end
end

--Main函数，1个参数是自己的玩家对象，每秒调用16次
function Main(player)
    this_player = player
    mbuff = GetBuff(player)
    target, tclass = GetTarget(player)
    if target ~= nil then
        tbuffList = GetBuff(target)
        ttarget, ttclass = GetTarget(target)
        if ttarget ~= nil then
            ttbuffList = GetBuff(ttarget)
        end
        local weight = getWeight()
        --print("weight:",weight)
        tab(weight)

        if ota("云飞玉皇") then
            MoveAction_StopAll()
            return
        end
        --跟随当前目标
        if IsDangerArea(target, "敌对") then
            MoveAction_StopAll()
        else
            FollowTarget()
            toBack()
            TurnTo(target)
        end



        --if GetHeight(player)>0 then
        --	Jump()
        --end
        if ota("风来吴山") then
            --如果风车就不执行后面的
            return
        end
        if tbuff("盾立") then
            StopAction()
            return
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

    --print(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)  --输出释放信息
end


--开始读条回调函数，任意对象开始读条时调用
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end