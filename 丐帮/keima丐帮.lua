--脚本信息="脚本定制加QQ：356151696-作者：keima"

---权重计算
function getWeight()

    local wudi= "镇山河|平沙落雁|鬼斧神工|散流霞|笼花|盾立|冥泽|流影|南风吐月|笑醉狂|太虚|力挽狂澜|wudi|浴火|不动|蚀心蛊"
    local jianshang80= "9696|7119|368|10307|10414"
    --清绝影歌 轮回 守如山 笑傲光阴 入定
    local jianshang70= "8421|10493|1802|384"
    --坚韧 无相决 御天 转乾坤
    local jianshang60= "6264|11319|8300|13044|9836|9206|6200"
    --春泥护花 临渊蹈河 盾墙 无相诀 摩咭 万籁之寂  龙啸九天
    local jianshang50= "9810|6315|10014|8427|9803|6306|2983|1412|3068"
    --舍身 零落 绝歌 荣辉 无相诀 光明相 无我 屹立不倒 雾体
    local jianshang40= "9873|2953|1187|399|9693|6279|11920|8839|6637|6636|6257|5744|6163|9874|9293|12530|122|6240|12656|9208|8495|6248"
    --曳光 圣手织天 西宗 无相决 清绝影歌 贪魔体 春泥护花 圣手织天 圣手织天 圣手织天 春泥护花 贪魔体 守如山 散影 残影 乘龙戏水 春泥护花 玄水蛊 水榭花盈 万籁之寂 捍卫 枯残蛊
    local jianshang30= "9510|11457|9895|9745|9896|8302|12286|2177|10051|9510|5641|6262|6160|5806|5705|2813|6247"
    --青霄飞羽 易水 志酬 朝圣 盾舞 肃列 左旋右转 正骨 杯水留影 青霄飞羽 金甲 金屋 雷心 大明 舍身 随风 蛊影
    local jianshang20= "2983|7790|7171|6378|6209|5746"
    --无我 龙战 善护 驯致 无相决 流光囚影
    local jianshang10= "11272|9904|9763|11344|6333|6610|5750|10024|12411|8424|6540|6337|6237|5770|4479|6113"
    --初熟 叠泉 春辞 春辞 上将军印 纵横 归去来 归寂道 袈裟 乘龙戏水 坚定 归山 贞护 圣涌 桃僵 折冲 千机神速
    local miankong="菩提身|青阳|突|零落|笑醉狂|出渊|吞日月|龙跃于渊|蛊虫献祭|碧蝶献祭|风蜈献祭|不工|力拔|飞鸢逐月|秘影|浮空|浮空|星楼月影|归酣|素衿|超然|灵辉|生死之交|素衿|啸日|星楼月影|转乾坤|转乾坤|圣体|流火飞星|宽野|霸体|千斤坠|须弥|烟雨行|霸体|酒中仙|纵轻骑|任驰骋|生太极|生太极|行天道|蛊虫狂暴|松烟竹雾·miankong|斗室无尘|斗室无尘|捣衣|石间意|尘身|尘身|破重围|音韵|探梅|捣衣|孤影|净果|捍卫|劫化|西楚悲歌|盾墙|绝伦逸群|千蝶吐瑞|盾毅|千险|无惧|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|尘身|破月|青霄飞羽|浮空|青蒂|水月无间|折骨|蚀心蛊|玉泉鱼跃|蛊影|噬蛊|免疫控制|青霄飞羽|遁影"
    local shanbi80="10619|9846|9783"
    --雾雨|惊鸿游龙 鹊踏枝
    local shanbi60="6434|9783|5668|9736"
    --醉逍遥 鹊踏枝 风吹荷 慈悲愿

    local shanbi50="2065|6299|8866|677"
    --云稀松 御风而行 鹊踏枝 鹊踏枝
    local shanbi40="6174|4028|10618"
    --两生 圣月佑 雾雨
    local shanbi30="4931|6146"
    --龙悔 日升
    local shanbi20="4710|6142|3310|948"
    --旷劫 冰天 游龙 花月凌风六阵
    local shanbi10="857|10465|6289|10617"
    --闪躲 鸟翔碧空 慈悲 雾雨

    local weight=10
    --OutputinGame("---------------------------------")
    if tbuff(wudi) then
        weight = weight +100
    end
    if tbuff(jianshang80) then
        weight = weight +8
        --OutputinGame("jianshang80")
    end
    if tbuff(jianshang70) then
        weight = weight +7
        --OutputinGame("jianshang70")
    end
    if tbuff(jianshang60) then
        weight = weight +6
        --OutputinGame("jianshang60")

    end
    if tbuff(jianshang50) then
        weight = weight +5
        --OutputinGame("jianshang50")
    end
    if tbuff(jianshang40) then
        weight = weight +4
        --OutputinGame("jianshang40")
    end
    if tbuff(jianshang30) then
        weight = weight +3
        --OutputinGame("jianshang30")
    end
    if tbuff(jianshang20) then
        weight = weight +2
        --OutputinGame("jianshang20")
    end
    if tbuff(jianshang10) then
        weight = weight +1
        --OutputinGame("jianshang10")
    end
    if tbuff(shanbi80) then
        weight = weight +8
        --OutputinGame("shanbi80")
    end
    if tbuff(shanbi60) then
        weight = weight +6
        --OutputinGame("shanbi60")
    end
    if tbuff(shanbi50) then
        weight = weight +5
        --OutputinGame("shanbi50")
    end
    if tbuff(shanbi40) then
        weight = weight +4
        --OutputinGame("shanbi40")
    end
    if tbuff(shanbi30) then
        weight = weight +3
        --OutputinGame("shanbi30")
    end
    if tbuff(shanbi20) then
        weight = weight +2
        --OutputinGame("shanbi20")
    end
    if tbuff(shanbi10) then
        weight = weight +1
        --OutputinGame("shanbi10")
    end

    if tlife()<10 then
        weight = weight -10
    end
    if tlife()>=10 and  tlife()<20 then
        weight = weight -9
    end
    -- Output("5")
    if tlife()>=20 and  tlife()<30 then
        weight = weight -8
    end
    -- Output("6")
    if tlife()>=30 and  tlife()<40 then
        weight = weight -7
    end
    -- Output("7")
    if tlife()>=40 and  tlife()<50 then
        weight = weight -6
    end
    -- Output("8")
    if tlife()>=50 and  tlife()<60 then
        weight = weight -5
    end
    if tlife()>=60 and  tlife()<70 then
        weight = weight -4
    end
    if tlife()>=70 and  tlife()<80 then
        weight = weight -3
    end
    if tlife()>=80 and  tlife()<90 then
        weight = weight -2
    end
    if tlife()>=90 and  tlife()<100 then
        weight = weight -1
    end

    return weight
end



function avoid() --躲避
	if (whmax() and statep("无免伤|无减伤")) or life()<50 then
		skill("18523")
    end
    if life()<=30 and buff("乘龙戏水")==false and buff("龙啸九天")==false and nocd("笑醉狂")
    then
        --按键(87)
        StopMove()
        skill("笑醉狂")
        Delay(8000)
        return
    end
end


function Thomas()--托马斯
    AutoMove()
end	

function whmax()--万花爆发判断
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
	if tbuff("追命无声") and statep("无免伤|无减伤")then
		return true
	end
	return false
end

function kanglong()
    if dis()<4 and mana()>=30 and ((tstatep("无免伤") and tstatep("无减伤"))or tlife()<20)
    then 
        skill("醉逍遥")
        skill("8490")--亢龙
        return
    end
end

function yanyuxing() --烟雨行判断逻辑

    if explast("", 1.5) then	--如果自己3秒内放过烟雨行
        return false
    end
    if explast("5508", 1.5) then	--如果自己3秒内放过烟雨行
       return false
    end

   if cd("棒打狗头") and dis()<5 and cd("5258") and cd("天下无狗") and mana()<30
    then
        return true
    end

    --if cd("棒打狗头") and dis()>10
    --then
    --    return true
    --end
    return false

end


---缴械时间
function jiaoxieTime()
    local jiaoxie={"浮云","霞流","怖畏暗刑","缴械"}
    local time=0
    for key,value in ipairs(jiaoxie)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---眩晕时间
function yunxuanTime()
    local yunxuan={"眩晕","千斤坠","裁骨","割据秦宫","迷神钉","薄伐","贯木流华","无名魂锁","盾猛","盾毅","撼地","醉逍遥","净世破魔击","幻光步","虎贲","弩击","善护","镇魔","伏夜·晕","重伤","雷震子","日影","剑冲阴阳","北斗","蝎心夺命","蝎心枯残","蝎心迷心","断魂刺","碧王","鹤归孤山","危楼","醉月","当头一敲","中注","破坚阵","蝎毒针","震慑","大狮子吼","五蕴皆空","突","战吼眩晕","追魂","日劫","峰插云景","崩"}
    local time=0
    for key,value in ipairs(yunxuan)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---定身时间
function dingshenTime()
    local dingshen={"缠心","点苍","定身","无助","安患","金针","天绝地灭","迷影","大道无术","伏夜·定","丝牵","幻蛊","绛唇珠袖","松涛","同归","破势","太阴指","完骨","帝骖龙翔","傍花随柳","芙蓉并蒂","七星拱瑞","余音","幻蛊","定身","剑神无我","大道无术"}
    local time=0
    for key,value in ipairs(dingshen)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---锁足时间
function suozuTime()
    local suozu={"擒龙","冻土","割据秦宫","逐星箭","琴音","复征","物我","影狱","钟林毓秀","剑·羽","落雁","滞","五方行尽","碎冰","百足","太阴指","禁缚","伏夜·缠","流光囚影","幽月","圣蝎献祭","刖足","铁爪","孔雀翎","袖手","天蛛献祭","影滞","百足夺命","百足枯残","百足迷心","五方行尽","三才化生","吐故纳新","绕足","止水","影痕","锁足"}
    local time=0
    for key,value in ipairs(suozu)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---缴械时间
function jidaoTime()
    local jidao={"割据秦宫","踏宴扬旗","击倒"}
    local time=0
    for key,value in ipairs(jidao)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---减疗时间
function jianliaoTime()
    local jianliao={"活祭","禁疗","息疗","清绝影歌","玄一","盾击","地龙钻","减疗","神龙降世","穿心弩","霹雳","蝎蛰","恒河劫沙","尘息","吞楚","百足夺命","百足枯残","百足迷心","楚济","清绝影歌"}
    local time=0
    for key,value in ipairs(jianliao)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---封内时间
function fengneiTime()
    local fengnei={"八卦洞玄","抢珠式","厥阴指","寒月耀","清音长啸","梅花针","凄切","蟾啸夺命","蟾啸枯残","蟾啸迷心","蟾啸迷心","缠竹","剑破虚空","沉默","雷霆震怒"}
    local time=0
    for key,value in ipairs(fengnei)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end
---沉默时间
function chenmoTime()
    local chenmo={"雷云","剑飞惊天","兰摧玉折","沉默","剑飞惊天","止息","井仪","沉默","风切","剑心通明","震慑"}
    local time=0
    for key,value in ipairs(chenmo)
    do
        local thisTime = tbufftime(value)
        if thisTime>time then
            time = thisTime
        end
    end
    return time
end

---控制时间带锁足
function kongzhiTime(time)
   return dingshenTime()>time or yunxuanTime()>time or jidaoTime()>time or suozuTime()>time
end
---控制时间不带锁足
function kongzhiTimeEX(time)
    return dingshenTime()>time or yunxuanTime()>time or jidaoTime()>time
end
---不能丢技能的时间
function noSkillTime(time)
    return fengneiTime()>time or chenmoTime()>time or jiaoxieTime()>time
end

function macro()
    if  ota("酒中仙") or ota("5270") or ota("5268")then
        return
    end


    if ally() then		--如果目标是自己、友好，队友
        --如果当前目标是敌对
        plast()
    end
    if attri("tab开关")then
        tab()
    end
    avoid()

    --print(dis())

    scenef()
    if tnoota("风来吴山|项王击鼎") then
        AutoMove()
    end
    if math.abs(theig())>5 and dis()<=4 then
        skill("扶摇直上")
        jumph()
    end
    --if theig()>1 thens
    --    jumpf()
    --end

    if  tbuff("盾立")==true  then
        return
    end
    if checkype("nil") then		--如果自己当前没有目标
        return
    end

    local weight = getWeight()
    local chemmoTime = chenmoTime()
    skill("潜龙勿用")--亢龙
    skill("5362")--亢龙

    skill("见龙在田")--亢龙
    skill("神龙摆尾")--亢龙
    skill("飞龙在天")--亢龙

    if  nocd("酒中仙")
    then
        --按键(87)
        StopMove()
        skill("酒中仙")--酒中仙
        Delay(1000)
        return
    end
    if dis()<=4 and mana()>=30 and  weight<10 then
        --if  buffsn("6381")>3 and buff("7118") == false then
        --else
            skill("醉逍遥")
            skill("8490")--亢龙
        --end
    elseif dis()<=5 and mana()>=40 then
        skill("5367")--蛟龙翻江
        skill("5368")--双龙取水
        skill("5369")--龙游天地
        skill("5370")--龙腾五岳
    else

        if (dis()<=6 and weight<3)  or (life()<70  and buff("龙啸九天")==false)
        then
            skill("龙啸九天")
        end

        if mana()>=20 or (dis()>=4 and dis()<=15 and cd("龙跃于渊")) or buff("亢龙有悔")==false
        then
            skill("龙战于野")
        end


        if dis()<=8 and (kongzhiTime(1.5) or noSkillTime(1.5)) then
            skill("恶狗拦路")
        end

        if dis()<=5  then
            skill("5258")--拨狗
            --if  nocd("天下无狗")
            --then
            skill("天下无狗",4)
            --end
        end

        if  (nocd("棒打狗头") and tstatep("可控制") and ( cd("天下无狗") or (mana()<30 and dis()>=4 and dis()<=20))) or (weight<4 and dis()>4 and dis()<=20) or (tstatep("可控制") and dis()>=5 and dis()<=20)
        then
            skill("棒打狗头")
        end


        if  yanyuxing()
        then
            skill("5508")--烟雨行
        end


        if mana()<30 and dis()<=8  and tstatep("无免控") and (weight<8 or cd("天下无狗"))
        then
            skill("蜀犬吠日")
        end

        if ((dis()>4 or cd("天下无狗") or statep("无免控")  or cd("棒打狗头") ) and dis()<22)or (weight<4 and dis()>4 and dis()<=22) or state("击倒|眩晕|定身|锁足|僵直")
        then
            skill("龙跃于渊")
        end



    end
    --召唤鸟
    if buff("6460") == false then
        skill("6945")--飞镖
    end


end

function tab()
    if rlast2(0, 25, "献祭", "敌对", 0, 30) then		--0-15尺，敌对玩家，放过镇山河，没到8秒，返回真
        ktarget("敌对", 30, 100, nil, "补天诀")
        return
    end
    --获取目标的状态ID
    if tstateid() == 16 then	--如果目标死亡
        ktarget("敌对", 30, 100)
    end
    --ktarget("敌对", 20, 90)
    --ktarget("敌对", 20, 80)
    --ktarget("敌对", 20, 70)
    --ktarget("敌对", 20, 60)
    --ktarget("敌对", 20, 50)
    --ktarget("敌对", 20, 40)
    --ktarget("敌对", 20, 30)
    --ktarget("敌对", 20, 20)
    --ktarget("敌对", 20, 10)
    --ktarget("敌对", 25, 100, nil, "补天诀")
    --ktarget("敌对", 25, 100, nil, "惊羽诀")
    --ktarget("敌对", 25, 100, nil, "离经易道")
    --ktarget("敌对", 25, 100, nil, "傲雪战意")
    --ktarget("敌对", 20, 100, "击倒|眩晕|定身")
    --ktarget("敌对", 20, 90, "击倒|眩晕|定身")
    --ktarget("敌对", 20, 80, "击倒|眩晕|定身")
    --ktarget("敌对", 20, 70, "击倒|眩晕|定身")
    ktarget("敌对", 20, 60, "击倒|眩晕|定身")
    ktarget("敌对", 20, 50, "击倒|眩晕|定身")
    ktarget("敌对", 20, 40, "击倒|眩晕|定身")
    ktarget("敌对", 20, 30, "击倒|眩晕|定身")
    ktarget("敌对", 20, 20, "击倒|眩晕|定身")
    ktarget("敌对", 20, 10, "击倒|眩晕|定身")
end

--脚本选项
attribute = {
    {
        attri_name = "tab开关",
        attri_explain = "tab开关"
    }
}

function Main()


    macro()


end