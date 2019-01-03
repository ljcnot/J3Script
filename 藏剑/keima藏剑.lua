local skillCD = {
	["云飞玉皇"] = 4,
	["风吹荷"] = 25,
	["惊涛"] = 12,
	["醉月"] = 15,
	["霞流宝石"] = 60,
	["松舍问霞"] = 15,
	["梦泉虎跑"] = 24,
	["玉虹贯日"] = 15,
	["平湖断月"] = 8,
	["黄龙吐翠"] = 8,
	["玉泉鱼跃"] = 30
}
local gcdsj=1.44 --gcd时间

local lastWeight =0
---权重计算
function getWeight()

	local wudi = "镇山河|平沙落雁|鬼斧神工|散流霞|笼花|盾立|南风吐月|笑醉狂|太虚|力挽狂澜|啸如虎|浴火|不动|蚀心蛊"
	local jianshang80 = "9696|7119|367|368|10307|10414|11313|14105|837|1173|1557|1870"
	--清绝影歌 轮回 守如山 笑傲光阴 入定 盾牌护持 定波砥澜 金刚
	local NGjianshang80 = "12041"
	local WGjianshang80 = "12041"
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
	--if tbuff(jiaoxie) then
	--	weight = weight -3
	--	--OutputinGame("shanbi10")
	--end
	--if tstate("击倒|眩晕|定身|锁足|僵直") then
	--	weight = weight -3
	--end
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
	--if tbuff(chenmo) then
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

function dis()
	local target, tclass = GetTarget(player)
	return GetDist(target)
end

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


function cdEX(skill)
	---通过已经释放的技能时间来判断技能是否cd
	return explast(skill, skillCD[skill])
end


function kongzhiTimeEX(time)
	return (dingshenTime() >0 and dingshenTime() >= time) or (yunxuanTime() >0 and yunxuanTime() >= time) or (jidaoTime()>0 and jidaoTime() >= time)
end
function jiekongTimeEX(time)
	return  (dingshenTime() >0 and dingshenTime()< time) or (yunxuanTime() >0 and yunxuanTime() < time) or (jidaoTime()>0 and jidaoTime() < time)
end
function jiekongTimeEX2(time)
	---接空时间不带击倒
	return  (dingshenTime() >0 and dingshenTime()< time) or (yunxuanTime() >0 and yunxuanTime() < time)
end
function jiekongTimeEX3(time)
	---接空时间只有定身
	return  (dingshenTime() >0 and dingshenTime()< time)
end
---不能丢技能的时间
function noSkillTime(time)
	return (fengneiTime() >0 and fengneiTime() > time) or (chenmoTime() >0 and chenmoTime() > time) or (jiaoxieTime()>0 and jiaoxieTime() > time)
end
function jiekong()
	if (gcdtime("醉月")+gcdsj)>dingshenTime() then
		return true
	end
	if (gcdtime("醉月")+gcdsj)>yunxuanTime() then
		return true
	end
	if (gcdtime("醉月")+gcdsj)>jidaoTime() then
		return true
	end
	return false
end


function tinglei()
	---听雷
	if dis()>4 then
		return false
	end
	if buff("凤鸣") and rage()>=10 then
		return false
	end
	return true
end

function hupao()
	---梦泉虎跑
	if statep("有免控")or cdEX("梦泉虎跑") then
		return false
	end
	if  rseeme(25) > 0 then
		return true
	end
	if dis()>4 then
		return true
	end
	return false
end
function yuyue()
	---玉泉鱼跃
	if dis()>15 then
		return true
	end
	if statep("有免控") or buff("梦泉虎跑")then
		return false
	end
	if cdEX("梦泉虎跑")  and (rseeme(25) > 0 or dis()>8) then
		return true
	end
	return false
end
function yuhongguanri()

	---玉虹贯日
	if dis() <5 or dis()>24 or cdEX("玉虹贯日") then
		return false
	end
	if dis()>=5 then
		return true
	end
	return false
end

function pinghuduanyue()
	---平湖断月
	if dis() >8 or cd("平湖断月") then
		return false
	end
	if dis()>=4 then
		return true
	end
	--if totatype("right") or totatype("left") then
	--	return true
	--end
	return false
end
function pinghuduanyue()
	---黄龙吐翠
	if dis() >6 or cd("黄龙吐翠") then
		return false
	end
	--if tstatep("无免控") then
	--	return true
	--end
	return true
end
function zuiyue()
	---醉月
	if dis() >6 or cdEX("醉月") or rage()<10 or tstatep("有免控") or (mount("山居剑意")and cdEX("惊涛")==false) then
		return false
	end

	if tstate("眩晕|定身") and jiekong() and jiekongTimeEX2(0.5) then
		return true
	end
	if tstatep("无免控") and tnostate("击倒|倒地|眩晕|定身") then
		return true
	end
	return false
end

function xiaori(weight)
	---啸日
	if mount("问水诀") then
		if buff("梦泉虎跑") then
			return false
		end
		if rseeme(25)>0 and statep("无免控") and cdEX("梦泉虎跑") and cdEX("玉泉鱼跃") then
			return true
		end
		if rage()>=90 and cdEX("梦泉虎跑") and dis()<=4 then
			return true
		end
		if state("击倒|眩晕|定身|锁足|僵直") and (weight<=8 or life()<=70) then
			return true
		end
		return false
	else
		if rseeme(25)>0 and statep("无免控") then
			return true
		end
		---山居剑意
		if rage()<10 and cd("莺鸣柳") then
			return true
		end
		if dis()>8 then
			return true
		end
		return false
	end
end
function yunfeiyuhuang(weight)
	---云飞玉皇
	if rage()<20 then
		return false
	end
	if dis()<=23 and (buff("云景")) then
		return true
	end
	if dis()>8 then
		return false
	end
    if buff("夜雨") and (weight<10 or bufftime("夜雨")<2) then
        return true
    end
	if dis()<=4 and (tstateid()==1 or kongzhiTimeEX(1.75)) then
		return true
	end
	return false
end
function xizhaoleifeng()
	---夕照雷锋
	if dis()>8 or rage()<15 then
		return false
	end
	if dis()<=4 and buff("凤鸣") then
		return true
	end
	if dis()>4 then
		return true
	end
	return false
end
function heguigushan()
	---鹤归孤山
	if dis()>21 or rage()<20 then
		return false
	end
	if dis2()>=6 and dis2()<=20 and face()>=0 and face()<=15 then
		return true
	end
	if life()<40 then
		return true
	end
	return false
end
function fenglaiwushan(weight)
	---风来吴山
	if dis()>6 or  rage()<50 then
		return false
	end
	if (kongzhiTimeEX(1.5) or noSkillTime(1.5)) and weight<=8 then
		 return true
	end
	if weight <4 then
		return true
	end
	return false
end
function fengchayunjing(weight)
	---峰插云景
	if dis()>6 or rage()<10  or tstatep("有免推") or weight>8 or cdEX("云飞玉皇") then
		return false
	end
	if 	weight>=6 and weight<=8 and buff("凤鸣") then
		return true
	end
	if 	weight<=2 then
		return true
	end
	return false
end
function yingmingliu(weight)
	---莺鸣柳
	if buff("莺鸣")then
		return false
	end
	if rage()<10 and mount("山居剑意") then
		return true
	end
	if weight<=6 then
		return true
	end
	return false
end
--[[支持判断的集合：
无免控、有免控、无爆发、有爆发、无免伤、有免伤、无沉默、有沉默
无减伤、有减伤、无闪避、有闪避、无减疗、有减疗、无减速、有减速
无封内、有封内、无封轻功、有封轻功、可控制、可行动、非被控
有免封内，无免封内，有免推，无免推，有免拉，无免拉
--]]
function quanningyue()
	---泉凝月
	if buff("梦泉虎跑")then
		return true
	end
	-----泉凝月
	if rseeme(25)==0  then
		return false
	end
	--if life()<80 then
	--	return true
	--end
	return true
end
function yunxisong()
	---云稀松
	if rseeme(25)<1 or statep("有免伤|有闪避|有减伤") then
		return false
	end
	if life()<=50 then
		return true
	end
	return false
end
function fengchuihe()
	---风吹荷
	if cdEX("风吹荷") or dis()>6 then
		return false
	end
	if ttnorela("友好|队友") and ttlife()<80  and ttstatep("有封内") then
		return true
	end
	if ttlife()<50 then
		return true
	end
	if life()<50 then
		return true
	end
	return false
end
function jingtao()
	---惊涛
	if cdEX("惊涛") or dis()>8 or tstatep("有免控") then
		return false
	end
	if tstate("定身")and tstatep("无免控") and jiekong() and jiekongTimeEX3(0.5) then
		return true
	end
	if tstatep("无免控") and tnostate("击倒|倒地|眩晕|定身") then
		return true
	end
	return false
end
function xieliubaoshi(weight)
	---霞流宝石
	if cdEX("霞流宝石") or dis()>6 then
		return false
	end
	if weight<=6 then
		return true
	end
	return false
end
function tanmei()
	---探梅
	if dis()>15 and ttdis()>15 then
		return false
	end
	if rela("队友") then
		return true
	end
	if ttrela("队友") and ttlife()<80 and ttstate("眩晕|定身") then
		return true
	end
	return false
end
function jiuximiyan()
	---九溪弥烟
	if dis()> 4 then
		return false
	end
	return true
end
function songshewenxia(weight)
	---松舍问霞
	if dis()>20 or cdEX("松舍问霞") then
		return false
	end
	-- 内功列表："洗髓经","易筋经","紫霞功","太虚剑意","花间游","离经易道","傲血战意","铁牢律","云裳心经","冰心诀","问水诀","山居剑意","毒经","补天诀","惊羽诀","天罗诡道","焚影圣诀","明尊琉璃体","铁骨衣","分山劲","笑尘诀","莫问","相知","北傲诀"

	if tmount("惊羽诀|天罗诡道|莫问|相知|凌海决")then
		--if buff("凤鸣") then
		--	return true
		--end
		if dis()>8 then
			return true
		end
		if weight<5 then
			return true
		end
	else
		if buff("凤鸣") then
			return true
		end
		if dis()>8 then
			return true
		end

		if weight<8 then
			return true
		end
	end

	return false
end

function wenshui(weight)
	---问水诀
	 kotabreak(5, 24, "玉虹贯日")

	---醉月
	if zuiyue() then
		skill("醉月")
		return 1
	end
	---啸日
	if xiaori(weight) then
		skill("啸日")
	end
	---梦泉虎跑
	if hupao() then
		skill("梦泉虎跑")
	end
	---玉泉鱼跃
	if yuyue() then
		skill("玉泉鱼跃")
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
		skill("醉月")
		return 1
	end
	if jingtao() then
		skill("惊涛")
		return 1
	end
	if xieliubaoshi(weight)then
		skill("霞流宝石")
	end
	---风来吴山
	if fenglaiwushan(weight) then
		skill("风来吴山")
	end
    if songshewenxia(weight) then
        skill("松舍问霞")
    end
	---鹤归孤山
	if heguigushan() then
		skill("鹤归孤山")
	end
	---云飞玉皇
	if  yunfeiyuhuang(weight) then
		skill("云飞玉皇")
		return 1
	end
    ---夕照雷锋
    if xizhaoleifeng() then
        skill("夕照雷峰")
    end
	---啸日
	if xiaori() then
		skill("啸日")
	end


	if fengchayunjing(weight) then
		skill("峰插云景")
	end

	---听雷
	if tinglei() then
		skill("听雷")
	end
end



function DPS(weight)
	---莺鸣柳
	if yingmingliu(weight) then
		skill("莺鸣柳")
	end
	---泉凝月
	if quanningyue() then
		skill("1666")
	end
	---云稀松
	if yunxisong() then
		skill("云栖松")
	end
	---探梅
	if tanmei() then
		skill("探梅")
	end
	if fengchuihe() then
		skill("风吹荷")
	end
	if mount("问水诀") then
		wenshui(weight)
	else
		shanjujianyi(weight)
	end

end


function Tab()
	if  rela("敌对") and cdEX("探梅")==false then
		if rela("敌对") then
			savetar(1)
		end
		ktarget("队友", 15, 80, "击倒|倒地|眩晕|定身")
		return 1
	end
	if cdEX("探梅")and rela("队友") then
		settar(1)
	end
end

function Main(player)
local weight =  getWeight()
	if lastWeight~=weight then
		lastWeight= weight
		print("权重",weight)
	end
	scenef()--面向目标

	if  tbuff("盾立")==true  then
		StopCurrentAction()
		return 1
	end

	if checkype("nil") then
		return 1
	end
    if tstateid() == 16 then
        --选择指定范围内视线可达的敌人， 2个参数：最小距离，最大距离。
        crtar(0, 20)		--选择0-15尺内的敌人，优先选玩家，没有的话选NPC
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
	if ota("风来吴山") then
		return 1
	end
	if duobi() and statep("无免控") then --如果周围有人对我用了憾地
		--OutputinGame("老子被:"..Skill.."打了！")
		if dis()<15 then
			skill("梦泉虎跑")
		end
		skill("玉泉鱼跃")
		skill("凌霄揽胜")
		skill("瑶台枕鹤")
		skill("迎风回浪")
		--skill("后跳")
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



DPS(weight)

	-- for infoi, Obj in pairs((info)) do --这个不要删 用来遍历周围目标用的删了就失效了
	-- 	--Output(Obj.szName)
	-- 	OutputinGame("角色名:"..Obj.Kongfu.."打了！")
		
	-- end
end