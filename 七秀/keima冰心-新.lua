--local save_target
--local target
--local tclass
--local this_player
--local mbuff
--local tbuffList
--local ttarget
--local ttclass
--local ttbuffList
--local gcdsj = 0.2 --gcd时间
--local help = false
--local lastSelectTime = 0
--local move = true
--local laststate
--AddOption("自动进8尺跟随")
--
--function ota(desc)
--	local mota, motatime, motaratio = GetPrepare()
--	return string.find(desc, mota)~=nil
--end
--
--function objLife(obj)
--	if obj == nil then
--		return 999
--	end
--	local bfb = (obj.nCurrentLife / obj.nMaxLife) * 100
--	return bfb
--end
--
--function life()
--	if this_player == nil then
--		return 999
--	end
--	local bfb = (this_player.nCurrentLife / this_player.nMaxLife) * 100
--	return bfb
--end
--function tlife()
--	if target == nil then
--		return 999
--	end
--	local bfb = (target.nCurrentLife / target.nMaxLife) * 100
--	return bfb
--end
--function ttlife()
--	if ttarget == nil then
--		return 999
--	end
--	local bfb = (ttarget.nCurrentLife / ttarget.nMaxLife) * 100
--	return bfb
--end
--function buff(list)
--	return GetBuffTime(mbuff, list) > 0
--end
--function tbuff(list)
--	return GetBuffTime(tbuffList, list) > 0
--
--end
--function bufftime(id)
--	return GetBuffTime(mbuff, id)
--end
--function skill(skillid)
--	--print(skillid)
--	Cast(skillid, false, false)
--end
--function skillEX(skillid)
--	---打断当前读条
--	CastTo(skillid,target,true)
--end
--function dis()
--	return GetDist(target)
--end
--function his()
--	return GetHeight(target)
--end
--function dis2()
--	return GetDist2D(target)
--end
--function ttdis()
--	return GetDist(this_player, ttarget)
--end
--
--function rseeme(seeme)
--	local seemecount, seemet = GetSeeMe(20)
--	return seemecount
--end
--
--function state(desc)
--	local tate = GetState(this_player)
--	if tate~=laststate then
--		laststate = tate
--		print("当前",tate,"寻找",desc)
--	end
--	return string.find(desc, tate)~=nil
--end
--function tstate(desc)
--	if target == nil then
--		return false
--	end
--	local tstate = GetState(target)
--	return string.find(desc, tstate)~=nil
--end
--function mount(desc)
--	local school = GetMount(this_player)
--	--print(school)
--	return string.find(desc, school)~=nil
--end
--function tmount(desc)
--	if tclass == NPC then
--		return false
--	end
--
--	local school = GetMount(target)
--	--print(school)
--	if school == nil then
--		return false
--	end
--	return string.find(desc, school)~=nil
--end
--
--function statep(desc)
--	--print(desc)
--	return GetTypeTime(mbuff, desc) > 0
--end
--
--function ttstatep(desc)
--	if ttarget == nil then
--		return false
--	end
--	return GetTypeTime(ttbuffList, desc) > 0
--end
--
--function tstatep(desc)
--	if target == nil then
--		return false
--	end
--	return GetTypeTime(tbuffList, desc) > 0
--end
--function tstate(desc)
--	if target == nil then
--		return false
--	end
--	local tstate = GetState(target)
--	return string.find(desc, tstate) ~= nil
--end
--function objState(obj, desc)
--	if obj == nil then
--		return false
--	end
--	local tstate = GetState(obj)
--	return string.find(desc, tstate) ~= nil
--end
--function ttstate (desc)
--	if ttarget == nil then
--		return false
--	end
--	local tstate = GetState(ttarget)
--	return string.find(desc, tstate) ~= nil
--end
--function tnostate(desc)
--	if target == nil then
--		return false
--	end
--	local tstate = GetState(target)
--	return string.find(desc, tstate) == nil
--end
--function CastTime(skillid, time)
--	if target == nil then
--		return false
--	end
--	return GetCastTime(target, skillid) > 0 and GetCastTime(target, skillid) <= time
--end
-----权重计算
--function getWeight()
--	--获取自己的buff数据
--	--local mbuff = GetBuff(player)
--	--获取目标的buff数据
--	--local tbuffList = GetBuff(target)
--
--	local wudi = "镇山河|平沙落雁|鬼斧神工|散流霞|笼花|盾立|南风吐月|笑醉狂|太虚|力挽狂澜|啸如虎|浴火|不动|蚀心蛊"
--	local jianshang80 = "9696|7119|368|10307"
--	--清绝影歌 轮回 守如山 笑傲光阴
--	local jianshang70 = "8421|10493|1802|384"
--	--坚韧 无相决 御天 转乾坤
--	local jianshang60 = "6264|11319|8300|13044|9836|9206|6200"
--	--春泥护花 临渊蹈河 盾墙 无相诀 摩咭 万籁之寂  龙啸九天
--	local jianshang50 = "9810|6315|10014|8427|9803|6306|2983|1412|3068"
--	--舍身 零落 绝歌 荣辉 无相诀 光明相 无我 屹立不倒 雾体
--	local jianshang40 = "9873|2953|1187|399|9693|6279|11920|8839|6637|6636|6257|5744|6163|9874|9293|12530|122|6240|12656|9208|8495|6248"
--	--曳光 圣手织天 西宗 无相决 清绝影歌 贪魔体 春泥护花 圣手织天 圣手织天 圣手织天 春泥护花 贪魔体 守如山 散影 残影 乘龙戏水 春泥护花 玄水蛊 水榭花盈 万籁之寂 捍卫 枯残蛊
--	local jianshang30 = "9510|11457|9895|9745|9896|8302|12286|2177|10051|9510|5641|6262|6160|5806|5705|2813|6247"
--	--青霄飞羽 易水 志酬 朝圣 盾舞 肃列 左旋右转 正骨 杯水留影 青霄飞羽 金甲 金屋 雷心 大明 舍身 随风 蛊影
--	local jianshang20 = "2983|7790|7171|6378|6209|5746"
--	--无我 龙战 善护 驯致 无相决 流光囚影
--	local jianshang10 = "11272|9904|9763|11344|6333|6610|5750|10024|12411|8424|6540|6337|6237|5770|4479|6113"
--	--初熟 叠泉 春辞 春辞 上将军印 纵横 归去来 归寂道 袈裟 乘龙戏水 坚定 归山 贞护 圣涌 桃僵 折冲 千机神速
--	local miankong = "菩提身|青阳|突|零落|笑醉狂|出渊|吞日月|龙跃于渊|蛊虫献祭|碧蝶献祭|风蜈献祭|不工|力拔|飞鸢逐月|秘影|浮空|浮空|星楼月影|归酣|素衿|超然|灵辉|生死之交|素衿|啸日|星楼月影|转乾坤|转乾坤|圣体|流火飞星|宽野|霸体|千斤坠|须弥|烟雨行|霸体|酒中仙|纵轻骑|任驰骋|生太极|生太极|行天道|蛊虫狂暴|松烟竹雾·miankong|斗室无尘|斗室无尘|捣衣|石间意|尘身|尘身|破重围|音韵|探梅|捣衣|孤影|净果|捍卫|劫化|西楚悲歌|盾墙|绝伦逸群|千蝶吐瑞|盾毅|千险|无惧|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|鹊踏枝|尘身|破月|青霄飞羽|浮空|青蒂|水月无间|折骨|蚀心蛊|玉泉鱼跃|蛊影|噬蛊|免疫控制|青霄飞羽|遁影"
--	local shanbi80 = "10619|9846|9783"
--	--雾雨|惊鸿游龙 鹊踏枝
--	local shanbi60 = "6434|9783|5668|9736"
--	--醉逍遥 鹊踏枝 风吹荷 慈悲愿
--
--	local shanbi50 = "2065|6299|8866|677"
--	--云稀松 御风而行 鹊踏枝 鹊踏枝
--	local shanbi40 = "6174|4028|10618"
--	--两生 圣月佑 雾雨
--	local shanbi30 = "4931|6146"
--	--龙悔 日升
--	local shanbi20 = "4710|6142|3310|948"
--	--旷劫 冰天 游龙 花月凌风六阵
--	local shanbi10 = "857|10465|6289|10617"
--	--闪躲 鸟翔碧空 慈悲 雾雨
--
--	local fengnei = { "八卦洞玄|抢珠式|厥阴指|寒月耀|清音长啸|梅花针|凄切|蟾啸夺命|蟾啸枯残|蟾啸迷心|蟾啸迷心|缠竹|剑破虚空|沉默|雷霆震怒" }
--	local chenmo = "雷云|剑飞惊天|兰摧玉折|沉默|剑飞惊天|止息|井仪|沉默|风切|剑心通明|震慑"
--	local jianliao = "活祭|禁疗|息疗|清绝影歌|玄一|盾击|地龙钻|减疗|神龙降世|穿心弩|霹雳|蝎蛰|恒河劫沙|尘息|吞楚|百足夺命|百足枯残|百足迷心|楚济|清绝影歌"
--	local jidao = { "割据秦宫|踏宴扬旗|击倒" }
--	local suozu = { "擒龙|冻土|割据秦宫|逐星箭|琴音|复征|物我|影狱|钟林毓秀|剑·羽|落雁|滞|五方行尽|碎冰|百足|太阴指|禁缚|伏夜·缠|流光囚影|幽月|圣蝎献祭|刖足|铁爪|孔雀翎|袖手|天蛛献祭|影滞|百足夺命|百足枯残|百足迷心|五方行尽|三才化生|吐故纳新|绕足|止水|影痕|锁足" }
--	local dingshen = { "缠心|点苍|定身|无助|安患|金针|天绝地灭|迷影|大道无术|伏夜·定|丝牵|幻蛊|绛唇珠袖|松涛|同归|破势|太阴指|完骨|帝骖龙翔|傍花随柳|芙蓉并蒂|七星拱瑞|余音|幻蛊|定身|剑神无我|大道无术" }
--	local yunxuan = { "眩晕|千斤坠|裁骨|割据秦宫|迷神钉|薄伐|贯木流华|无名魂锁|盾猛|盾毅|撼地|醉逍遥|净世破魔击|幻光步|虎贲|弩击|善护|镇魔|伏夜·晕|重伤|雷震子|日影|剑冲阴阳|北斗|蝎心夺命|蝎心枯残|蝎心迷心|断魂刺|碧王|鹤归孤山|危楼|醉月|当头一敲|中注|破坚阵|蝎毒针|震慑|大狮子吼|五蕴皆空|突|战吼眩晕|追魂|日劫|峰插云景|崩" }
--	local jiaoxie = "浮云|霞流|怖畏暗刑|缴械"
--	local youxian3 = { "补天诀", "花间游", "相知" }
--	local youxian2 = { "莫问", "焚影圣决", "惊羽诀", "天罗诡道", "傲血战意", "紫霞功", "笑尘决" }
--	local youxian1 = { "离经易道", "云裳心经", "太虚剑意", "冰心诀" }
--
--	local weight = 10
--	--OutputinGame("---------------------------------")
--	if GetBuffTime(tbuffList, wudi) > 0 then
--		weight = weight + 100
--	end
--	if GetBuffTime(tbuffList, jianshang80) > 0 then
--		weight = weight + 8
--		--OutputinGame("jianshang80")
--	end
--	if GetBuffTime(tbuffList, jianshang70) > 0 then
--		weight = weight + 7
--		--OutputinGame("jianshang70")
--	end
--	if GetBuffTime(tbuffList, jianshang60) > 0 then
--		weight = weight + 6
--		--OutputinGame("jianshang60")
--
--	end
--	if GetBuffTime(tbuffList, jianshang50) > 0 then
--		weight = weight + 5
--		--OutputinGame("jianshang50")
--	end
--	if GetBuffTime(tbuffList, jianshang40) > 0 then
--		weight = weight + 4
--		--OutputinGame("jianshang40")
--	end
--	if GetBuffTime(tbuffList, jianshang30) > 0 then
--		weight = weight + 3
--		--OutputinGame("jianshang30")
--	end
--	if GetBuffTime(tbuffList, jianshang20) > 0 then
--		weight = weight + 2
--		--OutputinGame("jianshang20")
--	end
--	if GetBuffTime(tbuffList, jianshang10) > 0 then
--		weight = weight + 1
--		--OutputinGame("jianshang10")
--	end
--	--if GetBuffTime(tbuffList, shanbi80) > 0 then
--	--	weight = weight + 8
--	--	--OutputinGame("shanbi80")
--	--end
--	--if GetBuffTime(tbuffList, shanbi60) > 0 then
--	--	weight = weight + 6
--	--	--OutputinGame("shanbi60")
--	--end
--	--if GetBuffTime(tbuffList, shanbi50) > 0 then
--	--	weight = weight + 5
--	--	--OutputinGame("shanbi50")
--	--end
--	--if GetBuffTime(tbuffList, shanbi40) > 0 then
--	--	weight = weight + 4
--	--	--OutputinGame("shanbi40")
--	--end
--	--if GetBuffTime(tbuffList, shanbi30) > 0 then
--	--	weight = weight + 3
--	--	--OutputinGame("shanbi30")
--	--end
--	--if GetBuffTime(tbuffList, shanbi20) > 0 then
--	--	weight = weight + 2
--	--	--OutputinGame("shanbi20")
--	--end
--	--if GetBuffTime(tbuffList, shanbi10) > 0 then
--	--	weight = weight + 1
--	--	--OutputinGame("shanbi10")
--	--end
--	--if GetBuffTime(tbuffList,miankong) then
--	--    weight = weight + 4
--	--    --OutputinGame("shanbi10")
--	--end
--	--if GetBuffTime(tbuffList,jiaoxie) then
--	--	weight = weight -3
--	--	--OutputinGame("shanbi10")
--	--end
--	--if tstate("击倒|眩晕|定身|锁足|僵直") then
--	--	weight = weight -3
--	--end
--
--
--	--if tstatep("免控") then		--如果目标可控制
--	--    weight= weight +5
--	--end
--	if GetBuffTime(tbuffList, jianliao) > 0 then
--		weight = weight - 3
--		--OutputinGame("shanbi10")
--	end
--	--if tstatep("有封轻功") then		--如果目标可控制
--	--    weight= weight -3
--	--end
--	--if GetBuffTime(tbuffList,chenmo) then
--	--	weight = weight -3
--	--	--OutputinGame("shanbi10")
--	--end
--	if tlife() < 10 then
--		weight = weight - 10
--	end
--	if tlife() >= 10 and tlife() < 20 then
--		weight = weight - 9
--	end
--	-- Output("5")
--	if tlife() >= 20 and tlife() < 30 then
--		weight = weight - 8
--	end
--	-- Output("6")
--	if tlife() >= 30 and tlife() < 40 then
--		weight = weight - 7
--	end
--	-- Output("7")
--	if tlife() >= 40 and tlife() < 50 then
--		weight = weight - 6
--	end
--	-- Output("8")
--	if tlife() >= 50 and tlife() < 60 then
--		weight = weight - 5
--	end
--	if tlife() >= 60 and tlife() < 70 then
--		weight = weight - 4
--	end
--	if tlife() >= 70 and tlife() < 80 then
--		weight = weight - 3
--	end
--	if tlife() >= 80 and tlife() < 90 then
--		weight = weight - 2
--	end
--	if tlife() >= 90 and tlife() < 100 then
--		weight = weight - 1
--	end
--
--	return weight
--end
--
--
--
--
--
----function duobi()
----	local jineng= {"雷震子" , "生死劫" , "撼地" , "千斤坠" , "疾" , "七星拱瑞" , "龙跃于渊" , "龙战于野" , "棒打狗头" , "盾猛" , "突" , "剑冲阴阳" , "封渊震煞" , "擒王六式" , "割据秦宫" , "断魂刺" , "醉月" , "惊涛"}
----	for key, value in ipairs(jineng)
----	do
----		if rlast(value, "敌对", 1) then
----			return true
----		end
----		if isme() and tlast(value, 1) then			--如果目标的目标是我
----			return true
----		end
----	end
----	return false
----end
-----缴械时间
--function jiaoxieTime()
--	local time = GetTypeTime(tbuffList, "缴械")
--	if time then
--		return time
--	end
--	return 0
--end
-----眩晕时间
--function yunxuanTime()
--	local time = GetTypeTime(tbuffList, "眩晕")
--	if time then
--		return time
--	end
--	return 0
--end
-----定身时间
--function dingshenTime()
--	local time = GetTypeTime(tbuffList, "定身")
--	if time then
--		return time
--	end
--	return 0
--end
-----锁足时间
--function suozuTime()
--	local time = GetTypeTime(tbuffList, "锁足")
--	if time then
--		return time
--	end
--	return 0
--end
-----击倒时间
--function jidaoTime()
--	local time = GetTypeTime(tbuffList, "击倒")
--	if time then
--		return time
--	end
--	return 0
--end
-----减疗时间
--function jianliaoTime()
--	local time = GetTypeTime(tbuffList, "减疗")
--	if time then
--		return time
--	end
--	return 0
--end
-----封内时间
--function fengneiTime()
--	local time = GetTypeTime(tbuffList, "封内")
--	if time then
--		return time
--	end
--	return 0
--end
-----沉默时间
--function chenmoTime()
--	local time = GetTypeTime(tbuffList, "沉默")
--	if time then
--		return time
--	end
--	return 0
--end
--
--function cdEX(skill)
--	---通过已经释放的技能时间来判断技能是否cd
--	--if skill()
--	--print(skill,GetSkillSCD(skill))
--	return GetSkillSCD(skill) > 0
--end
--function cdEX2(skill)
--	---充能技能判断
--	return GetSkillCN(skill)==0
--end
--
--function kongzhiTimeEX(time)
--	--print(time)
--	return dingshenTime() >= time or yunxuanTime() >= time or jidaoTime() >= time
--end
--function jiekongTimeEX(time)
--	return (dingshenTime() > 0 and dingshenTime() < time) or (yunxuanTime() > 0 and yunxuanTime() < time) or (jidaoTime() > 0 and jidaoTime() < time)
--end
--function jiekongTimeEX2(time)
--	---接空时间不带击倒
--	return (dingshenTime() > 0 and dingshenTime() < time) or (yunxuanTime() > 0 and yunxuanTime() < time)
--end
--function jiekongTimeEX3(time)
--	---接空时间只有定身
--	return (dingshenTime() > 0 and dingshenTime() < time)
--end
-----不能丢技能的时间
--function noSkillTime(time)
--	return (fengneiTime() > 0 and fengneiTime() > time) or (chenmoTime() > 0 and chenmoTime() > time) or (jiaoxieTime() > 0 and jiaoxieTime() > time)
--end
--function noskill()
--	return fengneiTime() > 0 or chenmoTime() > 0 or jiaoxieTime() > 0
--
--end
--function jiekong()
--	if (GetSkillGCD("帝骖龙翔") + gcdsj) > dingshenTime() then
--		return false
--	end
--	if (GetSkillGCD("帝骖龙翔") + gcdsj) > yunxuanTime() then
--		return false
--	end
--	if (GetSkillGCD("帝骖龙翔") + gcdsj) > jidaoTime() then
--		return false
--	end
--	return true
--end


function daiyuanjiqu()
	---玳弦急曲
	if dis()>25 or state("站立")== false then
		return false
	end
	return true
end
function jianqichangjiang()
	---剑气长江
	if dis()>20 or state("站立") then
		return false
	end
	return true
end
function jianpoxukong(weight)
	---剑破虚空
	if dis()>20 or cdEX("剑破虚空")  then
		return false
	end
	if GetBuffStack(tbuffList,"急曲",true)< 3 then
		return true
	end
	if weight <5 and (noskilltime(0.5) or noskill()==false) then
		return true
	end
	return false
end
function jianyingliuhen(weight)
	---剑影留痕
	if dis()>8 or cdEX("剑影留痕") or tstatep("免推")  then
		return false
	end
	---如果在碟池里-------------------------------
	if target ~= nil and CastTime(2226, 4) then
		return true
	end
	if tbuff("枭泣|曳光") then
		return true
	end
	------------------------------------------------
	if GetBuffStack(tbuffList,"急曲",true)>2 then
		return false
	end
	if GetBuffStack(tbuffList,"急曲",true) == 2 then
		return true
	end
	if weight <5 then
		return true
	end
	return false
end
function dicanlongxiang()
	---帝骖龙翔
	if dis()>8 or cdEX("帝骖龙翔") or tstatep("免控")  then
		return false
	end
	if tnostate("冲刺") and tstate("定身|爬起") and jiekong() and jiekongTimeEX3(0.5) then
		return true
	end
	if tnostate("冲刺") and tstate("击倒|倒地|眩晕|定身") == false then
		return true
	end
	return false
end
function jianghainingguang(weight)
	---江海凝光
	if dis()>24 then
		return false
	end
	
	if GetBuffStack(tbuffList,"急曲",true)>2 and weight<10 then
		return true
	end
	return false
end
function tiandidiang()
	---天地低昂
	if cdEX("天地低昂") or statep("无敌") or statep("闪避") or statep("免内伤") or statep("减内伤") or statep("闪避") or statep("免外伤") or statep("减伤") or statep("单次免伤") then
		return false
	end
	if life() <= 50 then
		return true
	end
	return false
end
function shuixiehuaying()
	---水榭花盈
	if GetSkillCD("水榭花盈") or statep("免控") then
		return false
	end
	if state("击倒|眩晕|定身|锁足|僵直") then
		print("水榭花盈")
		shuixieFind()
		return true
	end
return false
end
function shuixieFind()
	---寻找适合的目标放水榭花盈(20尺以内任意目标)
	local players = GetAllPlayer()
	local lastTar
	local lastDis  = 100  ---上一个目标的距离
	for k,v in ipairs(players) do	--v是玩家对象
		local this_dis = GetDist(this_player, v)
		if IsDangerArea(v, "敌对")==false and objState(v, "重伤")==false  and this_dis <20 and IsVisible(this_player, v) and v~=this_player then	--如果不是我
			if this_dis < lastDis then
				lastDis = this_dis
				lastTar = v
			end
		end
	end
	if lastTar ~=nil then
		CastTo("水榭花盈", lastTar, true)
	end
end
function leitingzhennu(weight)
	---雷霆震怒
	if cdEX("雷霆震怒") then
		return false
	end
	if weight <=5 then
		local naima = FindPlayer(17, "离经易道|云裳心经|补天诀|相知", "敌对")
		if naima and naima~=target and objState(naima,"眩晕|击倒|冲刺")==false then
			CastTo("雷霆震怒", naima,true)
		end
	end
	return false
end
function fanyinjijie(weight)
	---繁音急节
	if cdEX2("繁音急节") or buff("繁音急节") then
		return false
	end
	if weight <=8 and GetBuffStack(tbuffList,"急曲",true)==2 then
		return true
	end
	if weight <=5 then
		return true
	end
	return false
end
function poluomen()
	---婆罗门(袖气)
	if cdEX("婆罗门") or buff("袖气") then
		return false
	end
	return true
end
function dienongzu(weight)
	---蝶弄足
	if cdEX2("蝶弄足") or statep("免控") then
		return false
	end
	if state("击倒|眩晕|定身|锁足|僵直") and (life()<80 or weight<=8) then
		return true
	end
	if life()<60 and statep("闪避")==false then
		return true
	end
	return false
end
function quetazhi(weight)
	---鹊踏枝
	if cdEX2("鹊踏枝") or statep("免控")  then
		return false
	end
	if state("击倒|眩晕|定身|锁足|僵直") and (life()<80 or weight<=8) then
		return true
	end
	if statep("无敌") or statep("闪避") or statep("免内伤") or statep("减内伤") or statep("闪避") or statep("免外伤") or statep("减伤") or statep("单次免伤") then
		return false
	end
	if life()<=50 then
		return true
	end
	return false
end
function jianzhuanliuyun()
	---剑转流云(驱散)
	if dis()>20 then
		return false
	end
	--上元点餐(感觉可以不要) 翔舞(同左) 清心静气 握针 蝶弄足 秀气
	local qusan="680|681|112|631|213|673"
	if HaveTalent("剑转流云") == false or cdEX("剑转流云") then
		return false
	end
	if tbuff(qusan) then
		return true
	end
	return false
end
function jianzhuanliuyun2()
	---剑转流云(驱散)
	if dis()>20 then
		return false
	end
	--上元点餐(感觉可以不要) 翔舞(同左) 清心静气 握针 蝶弄足 秀气
	local qusan="755|684|6174|112|122|坐忘无我|般若诀|舍生"
	if HaveTalent("剑转流云") == false or cdEX("剑转流云") then
		return false
	end
	if tbuff(qusan) then
		return true
	end
	return false
end
function jianxintongming(weight)
	---剑心通明
	if cdEX("剑心通明") or dis()>20  then
		return false
	end
	if weight <=6 then
		local naima = FindPlayer(20, "离经易道|云裳心经|补天诀|相知", "敌对")
		if naima~=nil and tmount("补天诀|离经易道|相知|云裳心经")==false then
			if  naima~=target and objState(naima,"眩晕|击倒|冲刺")==false then
				CastTo("剑心通明", naima,true)
				return false
			end
		else
			return true
		end
	end
	return false
end

function shuyunzhuyue()
	---蹑云逐月
	if cdEX("蹑云逐月") or not GetOption("自动进8尺跟随") then
		return false
	end
	if dis2()>18 then
		return true
	end
	return false
end


function DPS(weight)

	if shuyunzhuyue() then
		CastTo("蹑云逐月",target,false)
	end
	---天地低昂
	if tiandidiang() then
		print("天地低昂")
		Cast("天地低昂",true,true)
	end
	---繁音急节
	if fanyinjijie(weight) then
		print("繁音急节")
		Cast("繁音急节",true,true)
	end
	---水榭花盈
	if shuixiehuaying() then
		print("水榭花盈")
		skill("水榭花盈")
	end
	---蝶弄足
	if dienongzu(weight) then
		print("蝶弄足")
		Cast("蝶弄足",true,true)
		return 1
	end
	---鹊踏枝
	if quetazhi(weight) then
		print("鹊踏枝")
		Cast("鹊踏枝",true,true)
		return 1
	end
	---剑心通明
	if jianxintongming(weight) then
		--skillEX("剑心通明")
		--print("剑心通明")
	end
	---剑转流云
	if jianzhuanliuyun2() then
		print("剑转流云")
		skill("剑转流云")
	end
	---江海凝光
	if jianghainingguang(weight) then
		print("江海凝光")
		skillEX("江海凝光")
	end
	---雷霆震怒
	if leitingzhennu(weight) then
		skillEX("雷霆震怒")
	end
	---帝骖龙翔
	if dicanlongxiang() then
		skillEX("帝骖龙翔")
	end
	---剑影留痕
	if jianyingliuhen(weight) then
		skillEX("剑影留痕")
	end
	---剑破虚空
	if jianpoxukong(weight) then
		skill("剑破虚空")
		return 1
	end
	---剑转流云
	if jianzhuanliuyun() then
		print("剑转流云")
		skill("剑转流云")
	end
	---玳弦急曲
	if daiyuanjiqu() then
		skill("玳弦急曲")
	end
	---剑气长江
	if jianqichangjiang() then
		skill("剑气长江")
	end
	---婆罗门
	if poluomen() then
		Cast("婆罗门",true)
	end
end
function toBack()
	---自动绕背
	if GetDist(target)<2 then
		if IsBack(target) then
			MoveForwardStop()
		else
			MoveForwardStart()
		end
	end
end


function findTarget(outTarger)---是否排除当前目标
---寻找适合的目标
	local players = GetAllPlayer()
	local lastTar
	local lastWeight  = 100
	for k,v in ipairs(players) do	--v是玩家对象
		local weight = 10
		if IsPlayer(v.dwID) and IsEnemy(v) and objState(v, "重伤")==false  and IsDangerArea(v, "敌对")==false and GetDist(this_player, v) <20 and IsVisible(this_player, v) and objNotWudi(v) then	--如果不是我
			if outTarger==false or v ~= target then	---如果需要排除当前目标
				if objLife(v) ==0 or objState(v,"重伤")then
					weight = weight+ 100
				end
				if objLife(v)>80 and objLife(v)<=90 then
					weight = weight - 1
				end
				if objLife(v)>70 and objLife(v)<=80 then
					weight = weight - 2
				end
				if objLife(v)>60 and objLife(v)<=70 then
					weight = weight - 3
				end
				if objLife(v)>50 and objLife(v)<=60 then
					weight = weight - 4
				end
				if objLife(v)>40 and objLife(v)<=50 then
					weight = weight - 5
				end
				if objLife(v)>30 and objLife(v)<=40 then
					weight = weight - 6
				end
				if objLife(v)>20 and objLife(v)<=30 then
					weight = weight - 7
				end
				if objLife(v)>10 and objLife(v)<=20 then
					weight = weight - 8
				end
				if objLife(v)>0 and objLife(v)<=10 then
					weight = weight- 9
				end
				if objState(v,"眩晕|击倒|僵直|定身") then
					weight = weight - 3
				end
				if lastWeight>weight then
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
	local lastTar =nil
	local lastWeight  = 100
	for k,v in ipairs(players) do	--v是玩家对象
		local weight = 10
		if IsPlayer(v.dwID)  and IsEnemy(v) and objState(v, "重伤")==false  and IsDangerArea(v, "敌对")==false  and GetDist(this_player, v) <20 and IsVisible(this_player, v) and objLife(v)<hp and objNotWudi(v) then	--如果不是我
			if objLife(v) ==0 or objState(v,"重伤")then
				weight = weight+ 100
			end
			if objLife(v)>80 and objLife(v)<=90 then
				weight = weight - 1
			end
			if objLife(v)>70 and objLife(v)<=80 then
				weight = weight - 2
			end
			if objLife(v)>60 and objLife(v)<=70 then
				weight = weight - 3
			end
			if objLife(v)>50 and objLife(v)<=60 then
				weight = weight - 4
			end
			if objLife(v)>40 and objLife(v)<=50 then
				weight = weight - 5
			end
			if objLife(v)>30 and objLife(v)<=40 then
				weight = weight - 6
			end
			if objLife(v)>20 and objLife(v)<=30 then
				weight = weight - 7
			end
			if objLife(v)>10 and objLife(v)<=20 then
				weight = weight - 8
			end
			if objLife(v)>0 and objLife(v)<=10 then
				weight = weight- 9
			end
			if objState(v,"眩晕|击倒|僵直|定身") then
				weight = weight - 3
			end
			if lastWeight>weight then
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
	local lastTar
	local lastWeight  = 100
	for k,v in ipairs(players) do	--v是玩家对象
		local weight = 10
		if IsPlayer(v.dwID)  and IsEnemy(v) and objState(v, "重伤")==false  and IsDangerArea(v, "敌对")==false and GetDist(this_player, v) <range and IsVisible(this_player, v) and objNotWudi(v) then	--如果不是我
			if objLife(v) ==0 or objState(v,"重伤")then
				weight = weight+ 100
			end
				if objLife(v)>80 and objLife(v)<=90 then
					weight = weight - 1
				end
				if objLife(v)>70 and objLife(v)<=80 then
					weight = weight - 2
				end
				if objLife(v)>60 and objLife(v)<=70 then
					weight = weight - 3
				end
				if objLife(v)>50 and objLife(v)<=60 then
					weight = weight - 4
				end
				if objLife(v)>40 and objLife(v)<=50 then
					weight = weight - 5
				end
				if objLife(v)>30 and objLife(v)<=40 then
					weight = weight - 6
				end
				if objLife(v)>20 and objLife(v)<=30 then
					weight = weight - 7
				end
				if objLife(v)>10 and objLife(v)<=20 then
					weight = weight - 8
				end
				if objLife(v)>0 and objLife(v)<=10 then
					weight = weight- 9
				end
				if objState(v,"眩晕|击倒|僵直|定身") then
					weight = weight - 3
				end
				if lastWeight>weight then
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
	if target == nil or objState(target,"重伤") then
		findTargetforRange(30)
		--print("目标重伤")
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
	--if cdEX("探梅") ==false and IsEnemy(target) then  ---如果探梅没CD 并且目标是敌对
	--	local target
	--	--遍历队伍成员
	--	for k,v in ipairs(GetAllMember()) do
	--		if IsPlayer(v.dwID) and GetDist(this_player, v) <20 and IsVisible(this_player, v) and v.IsHaveBuff(9695, 0)==false and v.IsHaveBuff(10212, 0)==false then
	--			local tstate = GetState(v)
	--			if string.find("眩晕|定身|爬起|僵直", tstate) and objLife(v)<90 then
	--				--先保存当前对象
	--				CastTo("探梅",v,true)
	--				print("给探梅")
	--				return 1
	--			end
	--		end
	--	end
    --
	--end
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
	---上次切换目标大于5秒才会换目标
	if weight>=15 and (GetTickCount() - lastSelectTime)>5000 then
		print("目标减伤过高")
		lastSelectTime = GetTickCount()
		findTarget(true)
	end

	--if IsDangerArea(target, "敌对") and (GetTickCount() - lastSelectTime)>5000 then
	--	print("危险区域切换目标")
	--	lastSelectTime = GetTickCount()
	--	findTarget(true)
	--end
	if tlife() >40 then
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
		local weight=getWeight()
		--print("weight:",weight)
		tab(weight)
		--跟随当前目标
		TurnTo(target)
        if GetOption("自动进8尺跟随") then
            if dis()>8 and GetSkillSCD("剑破虚空")<2 then
                move= true
                MoveForwardStart()
            end
            if dis()>22 then
                move= true

                MoveForwardStart()
            end
            if dis()<=8 and move then
                MoveForwardStop()
            end
        end

		--toBack()
		--if GetHeight(player)>0 then
		--	Jump()
		--end
		--if ota("风来吴山") then  --如果风车就不执行后面的
		--	return
		--end
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