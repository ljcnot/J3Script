--dolib("Evde.lib")--规避伤害逻辑
--dolib("Tab.lib")--切目标逻辑
--dolib("js.lib")--减伤逻辑

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
	if tbuff("追命无声") then
		return true
	end
	if life()<45 then
		return true
	end
	return false
end


function mubiaobeikong()
	return (tstate("击倒|眩晕|定身|锁足"))
end

function mubiaobeikongEX()--不带锁足
	return (tstate("击倒|眩晕|定身"))
end
---skill:技能id;time:调息时间


local dutiao=false
function Thomas()--托马斯
	-- 跟随目标()
	if kcastfl()and nocd("蹑云逐月")  then --如果自己被风来吴山打到了 并且自己的蹑云已经调息好了
		--背对目标()
		skill("扶摇直上")
		jumpf()
		skill("蹑云逐月")
		return
	end
	if tota("风来吴山")  then -- 如果对方dutiao转风车
		sceneb()
		skill("蹑云逐月")
		return  --直接返回 不执行下面的跟随和面对目标
	end
	scenef()
end
--function sleep(n)
--	if n > 0 then
--		os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL")
--	end
--end

function kongqueling()
	local qusan2={"681","680","112","631","213","673"}
	--上元点餐(感觉可以不要) 翔舞(同左) 清心静气 握针 蝶弄足 秀气
	local qusan1="755|684|6174|112|122|坐忘无我|般若诀|舍生"
	if tbuff(qusan1) then
		return true
	end
	local num=0;
	for key,value in ipairs(qusan2)
		do
			if tbuff(value) then
				--OutputinGame(value)
				num=num+1
				-- Output("找到啦"..value..";"..a)
				if (num>=2) then
					return true
				end
			end
			-- Output(value)
		end
		return false
	end
	
	function Dps()--输出循环
        local player = GetClientPlayer()
        local stateEX = GetState(player)

		if rlast2(0, 30, "献祭", "敌对", 4, 30) then
            kskill(0, 25, "迷神钉", "离经易道|云裳心经|补天诀|相知")
		end
		--减伤
		--if ( buff("浮光掠影")==true) then
        --
		--	----OutputinGame("追命箭")
		--end
        if getWeight()<=10 and buff("浮光掠影")==true then
            skill("3096")--追名剑
            skill("18801")
            return
        end
		if otatype("right") or otatype("left") then
			return
		end
		--驱散
		if (life()<50 or (whmax() and life()<70))and statep("无减伤") then
			skill("惊鸿游龙")
		end
		if state("击倒|眩晕|定身|锁足") and statep("无免控") then
            skill("17587")--拉盘子1
			--if(mSkillCharge("飞星遁影")>1) then
            --skill("17587")--拉盘子1
			--end
		end
		if (((getWeight()<=5 or life()<30)and nocd("追命箭")) or (whmax() and life()<50 and buff("3206")==false ))and nocd("浮光掠影") and buff("浮光掠影")==false and dis()<=20 then
			StopCurrentAction()
			skill("浮光掠影")
			return
		end
		
		
		
		if nocd("3118") and buff("浮光掠影")==false then
			skill("3118")
		end
		if buff("3217")  and (otatype("right") ==false and otatype("left")==false  ) then
			if theig()<3 then
				jumph()
				Delay(500)
			end
			if theig()>3.5 then
				jumph()
				Delay(500)
			end
			if theig()>6 then
				jumph()
				Delay(500)
				skill("3119")--鸟翔浮空
			end
		end
		if bufftime("12481")<1  then
            StopCurrentAction()
			skill("3120",2)--鸟翔落地
		end
		--免控
		if buff("连星")==false then
			skill("3103")
			--Delay(500)
		end
		--if buffTime("11886")<2 then
		--		skill("17587")--拉盘子1
		--end
		
		if kongqueling() then
			skill("3091")--孔雀翎
			----OutputinGame("孔雀翎")
		end
		----OutputinGame("权重:.."..血量减伤权重())
		
		if getWeight()<=6 then
			skill("3094")--心无|隐身|追命|3112|3096
			--skill("3112")--隐身
		end
		if (getWeight()<10  and (buff("3276")==true or buff("无遗")==true)) or buff("碎屏沉星")==true then
			
			
			skill("3096")--追名剑
			skill("18801")--追名剑
			--OutputinGame("追命箭")
		end
		
		
		
		if buff("惊心")==true then
			skill("3095")
			skill("18779")
		end
		
		if tstatep("无免推")  and dis()>10 and dis()<25 then
			skill("3101")--逐星箭
			skill("18810")--逐星箭
			--OutputinGame("逐星箭")
			
		end
		--输出
		if  (dis()<10 and dis()<25 and buff("逐星")==false)  then
			skill("3101")--逐星箭
			skill("18810")--逐星箭
			--OutputinGame("逐星箭")
			
		end
		if  (dis()>10 and dis()<25 and tstatep("无免控"))  then
			skill("3101")--逐星箭
			skill("18810")--逐星箭
			--OutputinGame("逐星箭")
		end
		
		
		--爆发
		
		
		--减疗
		if  getWeight()<8 and nocd("3098") then
			skill("3098")--穿心弩
			skill("18811")--穿心弩
			--OutputinGame("穿心弩")
			
		end
		
		--控制
		if  tstatep("无免控")  and energy()>50 then
			--skill("迷神钉")
			skill("雷震子")
			--OutputinGame("雷震子")
			
		end
		
		
		
		if (tbuff("穿心")==false or tbufftime("穿心")<3 or tbuffsn("穿心")<3 )then
			skill("6450")--裂石弩
			skill("18812")--裂石弩
			--OutputinGame("裂石弩")
			
		end
		--print(stateEX)
		if stateEX==1 or buff("12481") or  buff("12481") then
			--OutputinGame("夺魄箭")
			skill("3095")--夺魄箭
			skill("18779")--夺魄箭
		else
			skill("6450")--裂石弩
			skill("18812")--裂石弩
			--OutputinGame("裂石弩")
			
		end
		
		
	end
	function FullMonitor(Info)--全屏监控
		
		
	end

	
	function Main()
		
		if tstateid() == 16  then--目标死亡则什么也不执行
			return
		end
		--if tstatep("有免伤") then--目标无敌则什么也不执行
		--	return
		--end
		-- --OutputinGame(TLTriggerBomdis())
		if  tbuff("盾立")==false and tbuff("迷神钉|雷霆震怒")==false then
			--GetFullMonitorInfo()
			--Tab()
			Thomas()
			--sleep(1)
			Dps()
		else
            StopCurrentAction()
		end
		--StopCurrentAction()
		
	end