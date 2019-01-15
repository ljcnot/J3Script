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
szScriptDesc = "作者：keima\n说明：脚本说明\n奇穴：[腾焰飞芒][无往不复][寒月耀][善法肉身][恶秽满路][辉耀红尘][善恶如梦][日月同辉][生灭予夺][寂灭劫灰][伏明众生][冥月渡心]"
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
    return GetDist(target)
end
function his()
    if target == nil or tclass == NPC then
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
    local school = GetMount(obj)
    --print(school)
    return string.find(desc, school)~=nil
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
    if tstatep("减伤30") then
        weight = weight+3
    end

    --if GetBuffTime(tbuffList, shanbi80) > 0 then
    --    weight = weight + 8
    --    --OutputinGame("shanbi80")
    --end
    --if GetBuffTime(tbuffList, shanbi60) > 0 then
    --    weight = weight + 6
    --    --OutputinGame("shanbi60")
    --end
    --if GetBuffTime(tbuffList, shanbi50) > 0 then
    --    weight = weight + 5
    --    --OutputinGame("shanbi50")
    --end
    --if GetBuffTime(tbuffList, shanbi40) > 0 then
    --    weight = weight + 4
    --    --OutputinGame("shanbi40")
    --end
    --if GetBuffTime(tbuffList, shanbi30) > 0 then
    --    weight = weight + 3
    --    --OutputinGame("shanbi30")
    --end
    --if GetBuffTime(tbuffList, shanbi20) > 0 then
    --    weight = weight + 2
    --    --OutputinGame("shanbi20")
    --end
    --if GetBuffTime(tbuffList, shanbi10) > 0 then
    --    weight = weight + 1
    --    --OutputinGame("shanbi10")
    --end

    if GetBuffTime(tbuffList, jianliao) > 0 then
        weight = weight - 3
        --OutputinGame("shanbi10")
    end
    if tstatep("沉默") then
        --如果目标可控制
        weight = weight - 3
    end
    if tstatep("缴械") then
        --如果目标可控制
        weight = weight - 3
    end
    if tstatep("封内") then
        --如果目标可控制
        weight = weight - 3
    end
    if tstatep("禁疗") then
        --如果目标可控制
        weight = weight - 3
    end
    if tstatep("定身") then
        --如果目标可控制
        weight = weight - 1
    end
    if tstatep("眩晕") then
        --如果目标可控制
        weight = weight - 1
    end
    if tstatep("击倒") then
        --如果目标可控制
        weight = weight - 2
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
    print(skill)
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
    if dis() > 4 or cdEX("烈日斩") or isManri() or getSun()>=80 then
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
    if dis() > 4 or cdEX("银月斩") or isManyue() or getMoon()>=80  then
        return false
    end
    return true
end
function shengsijie()
    ---生死劫
    if dis()>4 or GetCastCount(this_player,3966,10)>=2 or (isManyue()==false and isManri()==false) then
        return false
    end
    if tnostate("冲刺") and tstate("眩晕|定身") and jiekong() and tstatep("免控")== false then
        return true
    end
    if tnostate("冲刺") and tstate("击倒|眩晕|定身") == false and tstatep("免控")== false then
        return true
    end
    return false
end
function jingshipomoji()
    ---净世破魔击
    if dis()>15 or (isManyue()==false and isManri()==false) then
        return false
    end
    if isManri() and not shengsijie() then
        return true
    end
    if isManyue() then
        return true
    end
    return false
end
function quyeduanchou()
    ---驱夜断愁
    if dis()>4 or isManyue() or isManri() then
        return false
    end
    if buff("暗尘弥散") or buff("安尘") then
        return true
    end
    return false
end
function buweianxing(weight)
    ---怖畏暗刑
    if  dis()>4 or cdEX("怖畏暗刑") or tstatep("免缴械") or tstatep("免封内") then
        return false
    end
    if weight<=10 and  kongzhiTimeEX(2) then
        if cdEX("怖畏暗刑") and cdEX("生灭予夺")==false then
            skillEX2("生灭予夺")
        end
        return true
    end
    return false
end
function guangmingxiang(weight)
    ---光明相
    if cdEX("光明相") or dis()>4 then
        return false
    end
    if weight<=7 and (isManri() or isManyue()) then
        return true
    end
    return false
end
function fumingzhongsheng(weight)
    ---伏明众生
    if not HaveTalent("伏明众生") or cdEX("伏明众生") or  getSun()<60 then
        return false
    end
    if weight<=10 and kongzhiTimeEX(1) then
        return true
    end
    return false
end
function mingyueduxin(weight)
    ---冥月渡心
    if not HaveTalent("冥月渡心") or cdEX("冥月渡心") or  getMoon()<60 then
        return false
    end
    if weight<=10 and statep("免控")==false then
        return true
    end
    if weight<=5 then
        return true
    end
    return false
end
function hanyueyao()
    ---寒月耀
    if not HaveTalent("寒月耀") or cdEX("寒月耀") or dis()>20 or tstatep("免封内") or tstatep("免打断") then
        return false
    end
    if tIsota() then
        return true
    end
    return false
end
function liuguangqiuying()
    ---流光囚影
    if cdEX2("流光囚影") or dis()>20 then
        return false
    end
    if dis()>4 and isManri()==false and isManyue()==false then
        return true
    end
    return false
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
    if jingshipomoji() then
        skillEX("净世破魔击")
    end
    if shengsijie() then
        skillEX("生死劫")
    end
end
function manyue()

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
    if guangmingxiang(weight) then
        Cast("光明相",true,true)
    end
    if hanyueyao() then
        skillEX("寒月耀")
    end
    if liuguangqiuying() then
        skillEX("流光囚影")
    end
    if buweianxing(weight) then
        skill("怖畏暗刑")
    end

    if fumingzhongsheng(weight) then
        skillEX2("伏明众生")
    end
    if mingyueduxin(weight) then
        skillEX2("冥月渡心")
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
    if cdEX("烈日斩") and getSun()<80 then
        yueling()
    else
        riling()
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "敌对") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objNotWudi(v) then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "敌对") == false and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and objLife(v) < hp and objNotWudi(v) then
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
        if IsPlayer(v.dwID) and IsEnemy(v) and IsDangerArea(v, "敌对") == false and GetDist(this_player, v) < range and IsVisible(this_player, v) and objNotWudi(v) then
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
    if objState(target, "重伤") then
        findTargetforRange(30)
        print("目标重伤")

    end
    if IsParty(target) then
        if target ~= nil then
            SetTarget(save_target)
        end
    else
        if target ~= nil then
            save_target = target
        end
    end
    if target == nil and save_target ~= nil then
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
    if HaveTalent("寒月耀") and cdEX("寒月耀") == false then
        ---如果探梅没CD 并且目标是敌对
        local target
        --遍历队伍成员
        for k, v in ipairs(GetAllMember()) do
            if IsEnemy(v.dwID) and GetDist(this_player, v) < 20 and IsVisible(this_player, v) and v ~= this_player and objNotWudi(v) then
                local tate = GetState(v)
                if string.find("冲刺", tate) == nil and objIsota(v) and objmount(v,"补天诀|离经易道|相知|云裳心经") then
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
        if tbuff("盾立") then
            StopAction()
            return
        end
        --if ota("云飞玉皇") then
        --    MoveAction_StopAll()
        --    return
        --end
        --跟随当前目标
        if isGensui and IsDangerArea(target, "敌对") then
            MoveAction_StopAll()
        else
            if isMianxiang then
                TurnTo(target)
            end
            if isGensui then
                MoveForwardStart()
            end
            if isRaobei then
                toBack()
            end
        end



        --if GetHeight(player)>0 then
        --	Jump()
        --end
        if IsParty(target) then
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