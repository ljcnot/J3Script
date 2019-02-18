local model = 0;---0:普通模式,1:集火打奶,2:给乘龙,3:保奶
---
--

local selectID
local first = true

---权重计算
function getWeight()

    local wudi = "镇山河|平沙落雁|鬼斧神工|散流霞|笼花|盾立|南风吐月|笑醉狂|太虚|力挽狂澜|啸如虎|浴火|不动|蚀心蛊"
    local jianshang80 = "9696|7119|368|10307|10414"
    --清绝影歌 轮回 守如山 笑傲光阴 入定
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

    local fengnei={"八卦洞玄|抢珠式|厥阴指|寒月耀|清音长啸|梅花针|凄切|蟾啸夺命|蟾啸枯残|蟾啸迷心|蟾啸迷心|缠竹|剑破虚空|沉默|雷霆震怒"}
    local chenmo="雷云|剑飞惊天|兰摧玉折|沉默|剑飞惊天|止息|井仪|沉默|风切|剑心通明|震慑"
    local jianliao="活祭|禁疗|息疗|清绝影歌|玄一|盾击|地龙钻|减疗|神龙降世|穿心弩|霹雳|蝎蛰|恒河劫沙|尘息|吞楚|百足夺命|百足枯残|百足迷心|楚济|清绝影歌"
    local jidao={"割据秦宫|踏宴扬旗|击倒"}
    local suozu={"擒龙|冻土|割据秦宫|逐星箭|琴音|复征|物我|影狱|钟林毓秀|剑·羽|落雁|滞|五方行尽|碎冰|百足|太阴指|禁缚|伏夜·缠|流光囚影|幽月|圣蝎献祭|刖足|铁爪|孔雀翎|袖手|天蛛献祭|影滞|百足夺命|百足枯残|百足迷心|五方行尽|三才化生|吐故纳新|绕足|止水|影痕|锁足"}
    local dingshen={"缠心|点苍|定身|无助|安患|金针|天绝地灭|迷影|大道无术|伏夜·定|丝牵|幻蛊|绛唇珠袖|松涛|同归|破势|太阴指|完骨|帝骖龙翔|傍花随柳|芙蓉并蒂|七星拱瑞|余音|幻蛊|定身|剑神无我|大道无术"}
    local yunxuan={"眩晕|千斤坠|裁骨|割据秦宫|迷神钉|薄伐|贯木流华|无名魂锁|盾猛|盾毅|撼地|醉逍遥|净世破魔击|幻光步|虎贲|弩击|善护|镇魔|伏夜·晕|重伤|雷震子|日影|剑冲阴阳|北斗|蝎心夺命|蝎心枯残|蝎心迷心|断魂刺|碧王|鹤归孤山|危楼|醉月|当头一敲|中注|破坚阵|蝎毒针|震慑|大狮子吼|五蕴皆空|突|战吼眩晕|追魂|日劫|峰插云景|崩"}
    local jiaoxie="浮云|霞流|怖畏暗刑|缴械"
    local youxian3={"补天诀","花间游","相知"}
    local youxian2={"莫问","焚影圣决","惊羽诀","天罗诡道","傲血战意","紫霞功","笑尘决"}
    local youxian1={"离经易道","云裳心经","太虚剑意","冰心诀"}

    local weight = 10
    --OutputinGame("---------------------------------")
    if tbuff(wudi) then
        weight = weight + 100
    end
    if tbuff(jianshang80) then
        weight = weight + 8
        --OutputinGame("jianshang80")
    end
    if tbuff(jianshang70) then
        weight = weight + 7
        --OutputinGame("jianshang70")
    end
    if tbuff(jianshang60) then
        weight = weight + 6
        --OutputinGame("jianshang60")

    end
    if tbuff(jianshang50) then
        weight = weight + 5
        --OutputinGame("jianshang50")
    end
    if tbuff(jianshang40) then
        weight = weight + 4
        --OutputinGame("jianshang40")
    end
    if tbuff(jianshang30) then
        weight = weight + 3
        --OutputinGame("jianshang30")
    end
    if tbuff(jianshang20) then
        weight = weight + 2
        --OutputinGame("jianshang20")
    end
    if tbuff(jianshang10) then
        weight = weight + 1
        --OutputinGame("jianshang10")
    end
    if tbuff(shanbi80) then
        weight = weight + 8
        --OutputinGame("shanbi80")
    end
    if tbuff(shanbi60) then
        weight = weight + 6
        --OutputinGame("shanbi60")
    end
    if tbuff(shanbi50) then
        weight = weight + 5
        --OutputinGame("shanbi50")
    end
    if tbuff(shanbi40) then
        weight = weight + 4
        --OutputinGame("shanbi40")
    end
    if tbuff(shanbi30) then
        weight = weight + 3
        --OutputinGame("shanbi30")
    end
    if tbuff(shanbi20) then
        weight = weight + 2
        --OutputinGame("shanbi20")
    end
    if tbuff(shanbi10) then
        weight = weight + 1
        --OutputinGame("shanbi10")
    end
    --if tbuff(miankong) then
    --    weight = weight + 4
    --    --OutputinGame("shanbi10")
    --end
    if tbuff(jiaoxie) then
        weight = weight -3
        --OutputinGame("shanbi10")
    end
    if tstate("击倒|眩晕|定身|锁足|僵直") then
        weight = weight -3
    end
    --[[支持判断的集合：
无免控、有免控、无爆发、有爆发、无免伤、有免伤、无沉默、有沉默
无减伤、有减伤、无闪避、有闪避、无减疗、有减疗、无减速、有减速
无封内、有封内、无封轻功、有封轻功、可控制、可行动、非被控
有免封内，无免封内，有免推，无免推，有免拉，无免拉
--]]

    --if tstatep("有免控") then		--如果目标可控制
    --    weight= weight +5
    --end
    if tbuff(jianliao) then
        weight = weight -3
        --OutputinGame("shanbi10")
    end
    --if tstatep("有封轻功") then		--如果目标可控制
    --    weight= weight -3
    --end
    if tbuff(chenmo) then
        weight = weight -3
        --OutputinGame("shanbi10")
    end
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

---缴械时间
function jiaoxieTime()
    local jiaoxie = { "浮云", "霞流", "怖畏暗刑", "缴械" }
    local time = 0
    for key, value in ipairs(jiaoxie)
    do
        local thisTime = tbufftime(value)
        if thisTime > time then
            time = thisTime
        end
    end
    return time
end
---眩晕时间
function yunxuanTime()
    local yunxuan = { "眩晕", "千斤坠", "裁骨", "割据秦宫", "迷神钉", "薄伐", "贯木流华", "无名魂锁", "盾猛", "盾毅", "撼地", "醉逍遥", "净世破魔击", "幻光步", "虎贲", "弩击", "善护", "镇魔", "伏夜·晕", "重伤", "雷震子", "日影", "剑冲阴阳", "北斗", "蝎心夺命", "蝎心枯残", "蝎心迷心", "断魂刺", "碧王", "鹤归孤山", "危楼", "醉月", "当头一敲", "中注", "破坚阵", "蝎毒针", "震慑", "大狮子吼", "五蕴皆空", "突", "战吼眩晕", "追魂", "日劫", "峰插云景", "崩" }
    local time = 0
    for key, value in ipairs(yunxuan)
    do
        local thisTime = tbufftime(value)
        if thisTime > time then
            time = thisTime
        end
    end
    return time
end
---定身时间
function dingshenTime()
    local dingshen = { "缠心", "点苍", "定身", "无助", "安患", "金针", "天绝地灭", "迷影", "大道无术", "伏夜·定", "丝牵", "幻蛊", "绛唇珠袖", "松涛", "同归", "破势", "太阴指", "完骨", "帝骖龙翔", "傍花随柳", "芙蓉并蒂", "七星拱瑞", "余音", "幻蛊", "定身", "剑神无我", "大道无术" }
    local time = 0
    for key, value in ipairs(dingshen)
    do
        local thisTime = tbufftime(value)
        if thisTime > time then
            time = thisTime
        end
    end
    return time
end
---锁足时间
function suozuTime()
    local suozu = { "擒龙", "冻土", "割据秦宫", "逐星箭", "琴音", "复征", "物我", "影狱", "钟林毓秀", "剑·羽", "落雁", "滞", "五方行尽", "碎冰", "百足", "太阴指", "禁缚", "伏夜·缠", "流光囚影", "幽月", "圣蝎献祭", "刖足", "铁爪", "孔雀翎", "袖手", "天蛛献祭", "影滞", "百足夺命", "百足枯残", "百足迷心", "五方行尽", "三才化生", "吐故纳新", "绕足", "止水", "影痕", "锁足" }
    local time = 0
    for key, value in ipairs(suozu)
    do
        local thisTime = tbufftime(value)
        if thisTime > time then
            time = thisTime
        end
    end
    return time
end
---缴械时间
function jidaoTime()
    local jidao = { "割据秦宫", "踏宴扬旗", "击倒" }
    local time = 0
    for key, value in ipairs(jidao)
    do
        local thisTime = tbufftime(value)
        if thisTime > time then
            time = thisTime
        end
    end
    return time
end
---减疗时间
function jianliaoTime()
    local jianliao = { "活祭", "禁疗", "息疗", "清绝影歌", "玄一", "盾击", "地龙钻", "减疗", "神龙降世", "穿心弩", "霹雳", "蝎蛰", "恒河劫沙", "尘息", "吞楚", "百足夺命", "百足枯残", "百足迷心", "楚济", "清绝影歌" }
    local time = 0
    for key, value in ipairs(jianliao)
    do
        local thisTime = tbufftime(value)
        if thisTime > time then
            time = thisTime
        end
    end
    return time
end
---封内时间
function fengneiTime()
    local fengnei = { "八卦洞玄", "抢珠式", "厥阴指", "寒月耀", "清音长啸", "梅花针", "凄切", "蟾啸夺命", "蟾啸枯残", "蟾啸迷心", "蟾啸迷心", "缠竹", "剑破虚空", "沉默", "雷霆震怒" }
    local time = 0
    for key, value in ipairs(fengnei)
    do
        local thisTime = tbufftime(value)
        if thisTime > time then
            time = thisTime
        end
    end
    return time
end
---沉默时间
function chenmoTime()
    local chenmo = { "雷云", "剑飞惊天", "兰摧玉折", "沉默", "剑飞惊天", "止息", "井仪", "沉默", "风切", "剑心通明", "震慑" }
    local time = 0
    for key, value in ipairs(chenmo)
    do
        local thisTime = tbufftime(value)
        if thisTime > time then
            time = thisTime
        end
    end
    return time
end

---控制时间带锁足
function kongzhiTime(time)
    return (dingshenTime() >0 and dingshenTime() > time) or (yunxuanTime() >0 and yunxuanTime() > time) or (jidaoTime()>0 and jidaoTime() > time) or (suozuTime() >0 and suozuTime() > time)
end
---控制时间不带锁足
function kongzhiTimeEX(time)
    return (dingshenTime() >0 and dingshenTime() > time) or (yunxuanTime() >0 and yunxuanTime() > time) or (jidaoTime()>0 and jidaoTime() > time)
end
---不能丢技能的时间
function noSkillTime(time)
    return (fengneiTime() >0 and fengneiTime() > time) or (chenmoTime() >0 and chenmoTime() > time) or (jiaoxieTime()>0 and jiaoxieTime() > time)
end




function duobi()
    if bufftime("商阳指")>3 and bufftime("钟林毓秀")>3  then
        return true
    end
    if bufftime("钟林毓秀")>3 and bufftime("兰摧玉折")>3 then
        return true
    end
    if bufftime("商阳指")>3 and bufftime("兰摧玉折")>3 then
        return true
    end
    if  buffsn("急曲")>=2 then
        return true
    end
    if tbuff("追命无声")then
        return true
    end
    if tbuff("莺鸣柳") or tbuff("疾如风") or tbuff("心无旁骛") then
        return true
    end
    --周围是否有人在小于指定时间内使用过指定技能  3个参数：技能名，关系，释放时间（秒）
    if rlast("浮光掠影", "敌对", 3) then		--不是自己的目标，目标是我，是敌对，5秒内使用过雷霆震怒
        return true
    end
    return false
end

function kekongZT()
    ---目标处于可以控制的状态(跑,站,跳)
   return tstateid()==1 or tstateid()==3 or tstateid()==4
end
function yanyuxing(weight) --烟雨行判断逻辑
---丐帮烟雨行 ID  向前5269向后5506 向左5507 向右5508
    if theig()<-5 then
        return false
    end
    scenef()--面向目标
    AutoMove()
    if state("击倒|眩晕|定身|锁足|僵直") and cd("龙跃于渊") and cd("棒打狗头")  then	--如果自己是指定的状态之一
        scenef()--
        AutoMove()
        --Delay(500)
        skill("5269")
    print("烟雨行1")
        return false
    end
    if dis()>20 and face()==0  then
        skill("蹑云逐月")
        skill("5269")
    end
    if cd("棒打狗头") and dis()>5 and cd("龙跃于渊") and (cd("龙战于野")or mana()<20) and face()==0 and tstateid()~=26 and tstateid()~=27 then
        scenef()--面向目标
        AutoMove()
        --Delay(500)
        skill("5269")
        print("烟雨行2")

        return false
    end
    if cd("棒打狗头")and cd("龙跃于渊") and dis()>=15 and face()==0
    then

        skill("5269")
        print("烟雨行3")

        return false
    end
    if dis()>20 and  kekongZT() and face()==0 then
        scenef()--面向目标
        AutoMove()
        --Delay(500)
        skill("5269")
        print("烟雨行4")

        return false
    end

    if cd("棒打狗头") and dis()<5  and cd("天下无狗") and  explast("亢龙有悔",1) and mana()<30  and (tstatep("无免控")or weight<=5)
    then
        skill("5508")
        print("烟雨行6")

        return true
    end





    --if cd("棒打狗头") and dis()>10
    --then
    --    return true
    --end
    return false

end

function longyue(weight)
    if state("击倒|眩晕|定身|锁足|僵直") then
        return true
    end
    --if nocd("棒打狗头") then
    --    return false
    --end
    if theig()<-5  and tstatep("有免控") then
        return false
    end
    if  dis()>22 then
        return false
    end
    if dis()>6 and dis()<=15 and (cd("龙战于野")or mana()<20) and kekongZT() and tstateid()~=26 and tstateid()~=27  then
        return true
    end
    if dis()>15 and  kekongZT() then
        return true
    end
    if dis()>4 and cd("棒打狗头") and cd("天下无狗") and tstatep("可控制")and tstateid()~=26 and tstateid()~=27   then
        return true
    end
    if cd("棒打狗头") and cd("天下无狗") and explast("拨狗朝天", 1) and tstatep("可控制") then
        return true
    end
    if weight <=4 and dis() > 8 then
        return true
    end
return false
end

function bangda(weight)
    if cd("棒打狗头") or dis()>20 then
        return false
    end
    if (tstatep("可控制") and (cd("龙跃于渊") or theig()< -5)and dis() > 5 and dis() <= 20) and kekongZT() then
        return true
    end
    if (cd("天下无狗") and buff("烟霞") and mana()<30) then
        return true
    end
    if (weight <=4 and dis() > 5 and dis() <= 20) then
        return true
    end
    return false
end


function macro(weight)




    kotabreak(0, 20, "棒打狗头")


    if (duobi() or life()<50 or ally())  then
        if norela("队友") then		--如果当前目标不是队友
            skill("乘龙戏水",2)
        else
            skill("乘龙戏水")
        end
    end

    if nocd("酒中仙") and life()>30 and model ~= 2 and weight >4 and (state("锁足") or tstatep("有免控") or dis()>25 or nofight() or (cd("棒打狗头")and cd("烟雨行") and cd("天下无狗")))
    then
        if dis()<=5 then
            skill("5508")--烟雨行
        end
        StopMove()
        skill("酒中仙")--酒中仙
        return 1
    end

    if life()<=30 and buff("乘龙戏水")==false and buff("龙啸九天")==false and nocd("笑醉狂")
    then
        StopMove()
        skill("笑醉狂")
        return 1
    end




    skill("潜龙勿用")--亢龙
    skill("5362")--亢龙

    --skill("5265")--见龙
    --skill("5522")
    if dis() <= 5 and (mana() >= 40 and (tstatep("有免控")and  weight>10 and buffsn("龙头")<4)) then
        skill("5367")--蛟龙翻江
        --skill("5258")--拨狗
    end

    if dis() <= 5 and mana() >= 30 and (weight <= 14  or ((buffsn("龙头")>=4 or tstatep("无免控") )and weight <=10)) then
        skill("醉逍遥")
        if tstatep("无免控")  then
            skill("5258")--拨狗
        end
        skill("8490")--亢龙
        return 1
    end


    if (dis() <= 6 and weight < 3) or ((life() < 70 or duobi()) and buff("龙啸九天") == false and statep("无免伤|无减伤"))
    then
        skill("龙啸九天")
    end

    if mana() >= 20 and kekongZT() and  tstateid()~=26 and tstateid()~=27 and ((dis() >5 and dis() <= 15) or (buff("亢龙有悔") == false and tstatep("有免控")))
    then
        skill("龙战于野")
    end

    if dis() <= 6 and face()==0 and (kongzhiTime(1.8) or noSkillTime(1.8)) then
        skill("恶狗拦路")
    end





     yanyuxing(weight)

    if mana() <30 and dis() <= 8 and tstatep("无免控") and  cd("天下无狗")  and cd("棒打狗头")
    then
        skill("蜀犬吠日")
    end

    if longyue(weight)
    then
        skill("龙跃于渊")
    end
    ----召唤鸟
    --if buff("6460") == false then
    --    skill("6945")--飞镖
    --end
    --if (nocd("棒打狗头") and tstatep("可控制") and  ((cd("天下无狗") and cd("拨狗朝天")) or (mana() < 30 and dis() > 5 and dis() <= 20))) or (weight < 4 and dis() > 4 and dis() <= 20) or (tstatep("可控制") and dis() >= 5 and dis() <= 20)
    if bangda(weight)
    then
        skill("棒打狗头")
        return 1
    end
    skill("5258")--拨狗
    if dis() <= 5 then
        if tstatep("有免控") then
            skill("横打双獒")
        else
            skill("天下无狗", 4)
        end
       --end
    end
    return 1

end
function death()
    ---死亡连招
    local select = rlast2(0, 30, "献祭", "敌对", 4, 30)
    select = rlast2(0, 30, "锻骨决", "敌对", 8, 60)
    select = rlast2(0, 30, "星楼月影", "敌对", 4, 30)
    select = rlast2(0, 30, "星楼月影", "敌对", 4, 30)
    select = rlast2(0, 30, "星楼月影", "敌对", 4, 30)
    select = rlast2(0, 30, "星楼月影", "敌对", 4, 30)
    if select ~= nil then
        local player = GetClientPlayer()
        SetTarget(player,select,4)
    end
end

function tab_youxian()
    local player = GetClientPlayer()
    local t = GetAllPlayer()		--返回一个表，键是索引，值是NPC对象
    print("--------------玩家信息--------------")
    local select
    local lastWeight=1000
    for _,v in ipairs(t) do
        local x,y,z = GetCoords(v)	--对象xyz坐标
        local szName = GetName(v)	--名字
        local dwID = GetID(v)		--玩家对象ID (只能用于NPC)
        print("玩家Id:",dwID)
        local state = GetState(v)   --玩家行为状态
        local life, maxlife = GetLife(v)	--当前，最大气血
        local LifeBfb = (life/maxlife)*100        --血量百分比
        local mana, maxmana = GetMana(v)	--当前，最大内力
        local rage = GetRage(v)				--怒气
        local energy = GetEnergy(v)			--神机值
        local qidian = GetQiDian(v)			--气点
        local sun = GetSun(v)				--日灵
        local moon = GetMoon(v)				--月魂
        local fsun = GetFullSun(v)			--满日
        local fmoon = GetFullMoon(v)		--满月
        local sp = GetSprintPower(v)		--气力值
        local mountID = GetMount(v)			--内功ID
        local face = GetAngle(v)			--面向(0-255)
        local school = GetSchool(v)			--门派
        print(LifeBfb)
        local guanxi = GetRelation(player, v)
        local weight=10                     --权重
        --关系ID对应的关系
        --     [2] = "自己",
        --     [4] = "友好",
        --     [16] = "敌对",
        --     [32] = "同盟",
        --     [68] = "队友"

        --选择敌对
        if guanxi == 16 and selectID~= dwID and state~=16 then

            if LifeBfb>=10 and  LifeBfb<20 then
                weight=weight-9
            end
            -- Output("5")
            if LifeBfb>=20 and  LifeBfb<30 then
                weight=weight-8
            end
            -- Output("6")
            if LifeBfb>=30 and  LifeBfb<40 then
                weight=weight-7
            end
            -- Output("7")
            if LifeBfb>=40 and  LifeBfb<50 then
                weight=weight-6
            end
            -- Output("8")
            if LifeBfb>=50 and  LifeBfb<60 then
                weight=weight-5
            end
            if LifeBfb>=60 and  LifeBfb<70 then
                weight=weight-4
            end
            if LifeBfb>=70 and  LifeBfb<80 then
                weight=weight-3
            end
            if LifeBfb>=80 and  LifeBfb<90 then
                weight=weight-2
            end
            if LifeBfb>=90 and  LifeBfb<100 then
                weight=weight-1
            end
            --站=1
            --跑=3
            --跳=4
            --打坐=8
            --击倒=9
            --被推=10
            --被击飞=11
            --晕=12
            --定身=13
            --锁足=14
            --骑马=15
            --死=16
            --轻功=17
            --被拉=18
            --攻击僵直=26
            --被打僵直=2
            if (state ==9 or state==12 or state ==20 ) then
                weight = weight-5
            end
            if (state ==12 or state ==13) then
                weight = weight-4
            end
            if (state ==14 or state ==11 or state ==11) then
                weight = weight-2
            end
            print(weight,lastWeight)
            if weight<lastWeight then
                select = dwID
                lastWeight = weight
            end

        end
    end
    selectID =  select
    SetTarget(player,select,4)
    Delay(900)
    --print(selectID)
    print("选择目标为:",selectID)

end
--function tab2()
--    local player = GetClientPlayer()
--    local selfId = GetID(player)
--    local t = GetAllPlayer()		--返回一个表，键是索引，值是NPC对象
--    print("--------------玩家信息--------------")
--    for _,v in ipairs(t) do
--        local x,y,z = GetCoords(v)	--对象xyz坐标
--        local szName = GetName(v)	--名字
--        local dwID = GetID(v)		--玩家对象ID (只能用于NPC)
--        local state = GetState(v)   --玩家行为状态
--        local life, maxlife = GetLife(v)	--当前，最大气血
--        local mana, maxmana = GetMana(v)	--当前，最大内力
--        local rage = GetRage(v)				--怒气
--        local energy = GetEnergy(v)			--神机值
--        local qidian = GetQiDian(v)			--气点
--        local sun = GetSun(v)				--日灵
--        local moon = GetMoon(v)				--月魂
--        local fsun = GetFullSun(v)			--满日
--        local fmoon = GetFullMoon(v)		--满月
--        local sp = GetSprintPower(v)		--气力值
--        local mountID = GetMount(v)			--内功ID
--        local face = GetAngle(v)			--面向(0-255)
--        local school = GetSchool(v)			--门派
--        local guanxi = GetRelation(selfId, dwID)
--
--    --关系ID对应的关系
--    --     [2] = "自己",
--    --     [4] = "友好",
--    --     [16] = "敌对",
--    --     [32] = "同盟",
--    --     [68] = "队友"
--
--        if guanxi ~= "敌对"then
--            continue
--        end
--
--
--    end
--
--    --SetTarget(player,目标ID,4)
--
--end

function duobi()
   local jineng= {"雷震子" , "生死劫" , "撼地" , "千斤坠" , "疾" , "七星拱瑞" , "龙跃于渊" , "龙战于野" , "棒打狗头" , "盾猛" , "突" , "剑冲阴阳" , "封渊震煞" , "擒王六式" , "割据秦宫" , "断魂刺" , "醉月" , "惊涛"}
    for key, value in ipairs(jineng)
    do
        if rlast(value, "敌对", 1) then
            return true
        end
        if isme() and tlast(value, 1) then			--如果目标的目标是我
            return true
        end
    end
    return false
end

function tab(weight)
    --local player = GetClientPlayer()
    --local targerType,targerId,targerObj = GetTarget(Player)
    --print(targerId)
    if checkype("nil") then
        --settar("等下还要用")
        if rlast2(0, 20, "化蝶", "敌对", 0, 3) or rlast2(0, 20, "暗影弥撒", "敌对", 0, 3)then
            SetTarget(player,selectID,4)
            return 1
        end
        tab_youxian()
        print("-----------------------目标选择nil")
    else
        --savetar("等下还要用")	--当前目标保存为"等下还要用"
        --selectID = targerId;
    end
    local chaofeng = {"风吹荷",
                      "定军",
                      "万佛朝宗",
                      "摩诃无量",
                      "蟾躁",
                      "归去来棍",
                      "慈悲愿",
                      "朝圣言",
                      "极乐引",
                      "贪魔体",
                      "沧月",
                      "摩诃",
                      "执迷不返",
                      "镇魔极道",
                      "知我罪我",
                      "极乐普渡",
                      "守如山嘲讽",
                      "伐魔忏罪",
                      "碎江天",
                      "盾舞",
                      "撼如雷"

    }


     --ktarget("敌对", 30, 40)		--选择20尺内，血量小于30%的玩家
    if (rela("队友") and cd("乘龙戏水")) then
        print("-----------------------rela(队友) and cd(乘龙戏水)")
        tab_youxian()
    end
    --获取目标的状态ID
    if tstateid() == 16 then
        --如果目标死亡
        print("-----------------------如果目标死亡")
        tab_youxian()
    end
    if theig()<-7 and cd("扶摇直上") and tstatep("有免控") and noexplast("扶摇直上", 3)then
        tab_youxian()
    end

    if weight >30 then
        tab_youxian()
    end
    if nocd("乘龙戏水") and rcheck(0, 20, "队友", "离经易道|云裳心经|补天诀|相知", 0, 60) then
        savetar("乘龙")	--当前目标保存为"等下还要用"
        ktarget("队友", 20, 60)
        --model = 2
    end


end

--脚本选项
attribute = {
    {
        attri_name = "tab开关",
        attri_explain = "tab开关"
    }
}

function Main()
    ---首先确定打谁
    ---再确定怎么打
    ---1:压血线
    ---2:无限连
    ---3:秒奶
    local weight = getWeight()
    tab(weight)
    --print("权重:",weight)
    --print(string.format("权重:%d",weight))

    --判断读条
    if otatype("right") or otatype("left") then
        --print("读条中")
        --tab_youxian()
        return 1
    end
    if buff("降龙伏虎阵") ==false then
        skill("降龙伏虎阵")
    end

    scenef()--面向目标

    if statep("无免控") and duobi() then
        skill("龙跃于渊")
        skill("棒打狗头")
        skill("凌霄揽胜")
        skill("瑶台枕鹤")
        skill("迎风回浪")
        skill("后跳")
    end
    if kcastgroup()and (nocd("蹑云逐月") or nocd("烟雨行")) then		--如果自己被项王
        --背对目标
        sceneb()
        skill("扶摇直上")
        jumpf()
        skill("5508")--烟雨行
        skill("蹑云逐月")
        return 1
    else
        AutoMove()
    end
    --如果看不见目标了
    if novisble() then
        skill("扶摇直上")
        jumpf()
    end
    if theig()<-6 and dis2()<=4 then
        skill("扶摇直上")
        jumph()
    end

    if  tbuff("盾立")==true  then
        return 1
    end

    --if nogcd("天凖击") then
    --    print("GCD")
    --    return 1
    --end
    --print("DPS")
    macro(weight)
end