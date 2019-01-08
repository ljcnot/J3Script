--初始化部分，载入的时候会执行，不要放在函数里面
--设置一些选项
AddOption("选项一")
AddOption("选项二")
AddOption("选项三")

--脚本描述和说明，比如设置哪些些奇穴之类的，换行用\n
--这个在插件菜单中的脚本说明中会显示
szScriptDesc = "啸日手动"

----g_player自己的对象（全局）
   local me = GetMyPlayer() --自己
   local ta, taclass = GetTarget(me) --我的焦点，焦点类型 
	

-----------查询当前我是什么心法
function isxinfa()
return GetMount(GetMeState()) 
end	
	
	
-----------获取我的对象	
function GetMeState()
	return GetMyPlayer()
end
-------------获取焦点对象
function GetTaState()
	local ta,taclass = GetTarget(GetMeState())
	if taclass == NONE then return nil end
	return ta
end
--------------我的buff剩余时间
function GetMeBuffTime(buff) 
	return (GetTypeTime(GetBuff(GetMeState()),buff))
end
--------------焦点buff类型剩余时间
function GetTaBuffTime(buff)
	local tabufftime = -1
	if nil ~= GetTaState() then 
	tabufftime = GetTypeTime(GetBuff(GetTaState()),buff)
	return tabufftime
	end
	return tabufftime
end
-------------获取我的生命值
function GetMelife()
	return (GetMeState().nCurrentLife/GetMeState().nMaxLife)*100
end
------------获取焦点的生命值
function GetTalife()
	local talife = -1
	if nil ~= GetTaState() then
	talife = (GetTaState().nCurrentLife/GetTaState().nMaxLife)*100
	return talife
	end
	return talife
end

-----------技能释放前判断 (返回 true false)
function isTopSkill()
    local ta = GetTaState()
	if nil == ta  then return false end
	--判断目标是否是敌对
	if IsEnemy(ta) == false then return false end
	--判断目标是否无敌中
	local wudiList = "镇山河|平沙落雁|鬼斧神工|散流霞|盾立|南风吐月|笑醉狂|太虚|力挽狂澜|浴火|不动|蚀心蛊"
	local wudiTime = GetBuffTime(GetBuff(ta),wudiList)
	if wudiTime > 0 then return false end
	--判断目标是否中重伤
	local taState = GetState(ta)
	if string.find("重伤",taState) then return false end
	return true
end

-----------技能距离判断(在距离中返回 true 不在距离中返回 false)
function islengthSkill(length)
	local ta = GetTaState()
	if nil == ta  then return false end
	--我与焦点的距离
	local beforelength = GetDist(ta)
	if beforelength > length then return false end
	return true
end

---------判断技能cd剩余时间(在cd中返回false 不在cd中返回true)
function isSkillcd(mySkill)
	local time = GetSkillGCD(mySkill)
	if time > 0 then return false end
	return true
end

---------当前10尺焦点自己的外功(返回个数)
function pointMewaigong ()
	local waigongnumber = 0
	local seemecount,seemet = GetSeeMe(10)
	--超过一个人目标是我
	if seemecount > 0 then 
		--目标敌人有鲸鱼
		if seemet["惊羽诀"] then waigongnumber = waigongnumber+1 end
		--目标敌人有剑纯
		if seemet["太虚剑意"] then waigongnumber = waigongnumber+1 end
		--目标敌人有天策
		if seemet["傲血战意"] then waigongnumber = waigongnumber+1 end
		--目标敌人有丐帮
		if seemet["笑尘决"] then waigongnumber = waigongnumber+1 end
		--目标敌人有藏剑
		if seemet["问水决"] then waigongnumber = waigongnumber+1 end
		if seemet["山居剑意"] then waigongnumber = waigongnumber+1 end
		--目标敌人有苍云
		if seemet["分山劲"] then waigongnumber = waigongnumber+1 end
		--目标敌人有霸刀
		if seemet["北傲决"] then waigongnumber = waigongnumber+1 end
		--目标敌人有蓬莱
		if seemet["凌海决"] then waigongnumber = waigongnumber+1 end
	end
	return waigongnumber
end

----------轻剑 惊涛释放前buff判断
function isqingjianjingtao()
	--判断焦点身上是否有 免控buff类型
	if GetTaBuffTime("免控") ~= 0 then return false end
	--判断焦点身上是否有 减速buff类型
	if GetTaBuffTime("减速") ~= 0 then return false end
	--判断焦点身上是否有 锁足buff类型
	if GetTaBuffTime("锁足") ~= 0 then return false end
	--判断焦点身上是否有 定身buff类型
	if GetTaBuffTime("定身") ~= 0 then return false end
	--判断焦点身上是否有 眩晕buff类型
	if GetTaBuffTime("眩晕") ~= 0 then return false end
	--判断焦点身上是否有 击倒buff类型
	if GetTaBuffTime("击倒") ~= 0 then return false end
	--判断焦点身上是否有 单次免伤buff类型
	if GetTaBuffTime("单次免伤") ~= 0 then return false end
	--判断焦点身上是否有 封轻功buff类型
	if GetTaBuffTime("封轻功") ~= 0 then return false end
	return true
end

----------重剑 惊涛释放前buff判断
function iszhongjianjingtao()
	--判断焦点身上是否有 免控buff类型
	if GetTaBuffTime("免控") ~= 0 then return false end
	--判断焦点身上是否有 定身buff类型
	if GetTaBuffTime("定身") ~= 0 then return false end
	--判断焦点身上是否有 眩晕buff类型
	if GetTaBuffTime("眩晕") ~= 0 then return false end
	--判断焦点身上是否有 击倒buff类型
	if GetTaBuffTime("击倒") ~= 0 then return false end
	--判断焦点身上是否有 单次免伤buff类型
	if GetTaBuffTime("单次免伤") ~= 0 then return false end
	return true
end


---------- 醉月释放前buff判断 (惊涛接醉月)
function iszuiyue()
	if GetTaBuffTime("免控") == 0 and 
	GetTaBuffTime("定身") == 0 and 
	GetTaBuffTime("眩晕") == 0 and 
	GetTaBuffTime("单次免伤") == 0 
	then return true end	
	if GetTaBuffTime("定身") > 0 
	and GetTaBuffTime("定身") <= 0.2 
	then return true end
	return false
end

---------- 云飞释放前buff判断 (大于1.5秒)
function isyunfei()
	if GetTaBuffTime("定身") > 1.6 or GetTaBuffTime("眩晕") > 1.6 or GetTaBuffTime("击倒") > 1.6  then
		return true
	end
		return false
end

--------------------------------------------技能

---------------听雷 (四尺)
function tinglei()
	fengchayunfei()
	local length = 4
	--技能释放前判断
	if false == isTopSkill() then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	Cast("听雷")
end

--------------平湖断月,黄龙吐翠(8尺)
function pinghuduanyue()
	local length = 8
	--技能释放前判断
	if false == isTopSkill() then return end
	--判断技能cd剩余时间
	if false == GetSkillSCD("平湖断月") then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	Cast("平湖断月")
	huanglongtucui()

end

--------------黄龙吐翠(6尺)
function huanglongtucui()
	local length = 6
	--技能释放前判断
	if false == isTopSkill() then return end
	--判断黄龙cd剩余时间 (黄龙是单独的cd)
	if GetSkillSCD("黄龙吐翠") ~= 0 then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	Cast("黄龙吐翠")
end

--------------玉虹贯日(5-24尺)
function yuhongguanri()
	--技能释放前判断
	if false == isTopSkill() then return end
	local length = 15
	--梦泉虎跑优先(非gcd)
	if GetSkillSCD("梦泉虎跑") == 0 and islengthSkill(length) then mengquanhupao() return end
	--判断技能cd剩余时间
	if false == isSkillcd("玉虹贯日") then return end
	--技能距离判断
	local ta = GetTaState()
	if nil == ta  then return false end
	--焦点离我的距离
	local beforelength = GetDist(ta)
	if beforelength < 9 then return end
	Cast("玉虹贯日")
end

-------------梦泉虎跑 (15尺)
function mengquanhupao()
	local length = 15
	--技能释放前判断
	if false == isTopSkill() then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	Cast("梦泉虎跑")
end

------------泉凝月(减伤)
function quanningyue()
	--判断是否是敌人
	if GetTaState() == nil or IsEnemy(GetTaState()) == false then return end
	--判断 6143泉凝月的buff
	local quanBuff = GetMeState().IsHaveBuff(6143,0)
	if quanBuff then return end
	Cast("泉凝月")
end

------------ 风吹荷 6尺 (闪避60%)
function fengchuihe()
	local length = 6
	--技能释放前判断
	if false == isTopSkill() then return end
	--当前10尺焦点自己的外功个数
	local tanumber = pointMewaigong()
	if tanumber == 0 then return end
	--判断风吹荷的cd
	if GetSkillSCD("风吹荷") ~= 0 then return end  
	--技能距离判断
	if false == islengthSkill(length) then return end
	Cast("风吹荷")
end

----------- 轻剑惊涛 8尺 (轻剑减速 持续12秒)

function qingjingtao()
	local length = 8
	--技能释放前判断
	if false == isTopSkill() then return end
	--轻剑惊涛释放前buff判断
	if isqingjianjingtao() == false then return end
	--判断惊涛的cd
	if isSkillcd("惊涛") ~= 0 then return end  
	--判断醉月用过没
	if GetSkillSCD("醉月") == 0 then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	Cast("惊涛")
end

----------- 重剑惊涛 8尺 (重剑定身 3秒)

function zhongjingtao()
	local length = 8
	--技能释放前判断
	if false == isTopSkill() then return end
	--判断惊涛的cd
	if GetSkillSCD("惊涛") ~= 0 then return end  
	--重剑惊涛释放前buff判断
	if iszhongjianjingtao() == false then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	--如果2秒钟之内放过 峰插(1613) 不能放惊涛
	if GetCastCount(GetMeState(),1613,2) ~= 0 then return end
	Cast("惊涛")
	xizhaoleifeng()
end

----------- 醉月 8尺 (眩晕 4秒)
function zuiyue()
	local length = 8
	--技能释放前判断
	if false == isTopSkill() then return end
	--判断醉月的cd
	if GetSkillSCD("醉月") ~= 0 then return end  
	--醉月释放前buff判断
	if iszuiyue() == false then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	--如果2秒钟之内放过 峰插(1613) 不能放醉月
	if GetCastCount(GetMeState(),1613,2) ~= 0 then return end
	Cast("醉月")
	yunfei()
end

---------- 峰插云景 6 尺 (封轻功2秒，击退15尺)
function fengcha()
	local length = 4
	--技能释放前判断
	if false == isTopSkill() then return end
	--判断峰插云景的cd
	if GetSkillSCD("峰插云景") ~= 0 then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	--峰插云景 释放前buff判断
	if GetTaBuffTime("免推") ~= 0 then return end
	if GetTaBuffTime("眩晕") ~= 0 then return end
	Cast("峰插云景")
	--云飞玉皇 技能释放前判断
	if false == isTopSkill() then return end
	Cast("云飞玉皇")
end

-------- 夕照雷峰 8尺
function xizhaoleifeng()
	fengchayunfei()
	local length = 8
	--技能释放前判断
	if false == isTopSkill() then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	Cast("夕照雷峰")
end

------- 云飞玉皇 后打听雷 
function yunfei()
	local length = 8
	--技能释放前判断
	if false == isTopSkill() then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	--云飞 释放前buff 判断 是否大于1.6秒
	if false == isyunfei() then return end
	--面向指定目标
	TurnTo(GetTaState())
	Cast("云飞玉皇")
	tinglei()
end



--------- 云栖松 (闪避50%)      血量低于30 焦点我的外功大于1 使用
function yunxisong()
	--当前10尺焦点自己的外功个数
	local tanumber = pointMewaigong()
	--我的当前血量(百分比)
	local mylife = GetMelife()
	if mylife < 30 and tanumber > 0 then
		Cast("云栖松")
	end
end

------峰插接云飞
function fengchayunfei()
	--如果3秒钟之内放过 峰插(1613) 
	local fengchatime = GetCastTime(GetMeState(),1613)
	if fengchatime >= 0 and fengchatime < 3 then
		print("zuihou")
	Cast("云飞玉皇")
	end
end

------鹤归孤山 15尺

function hegui()
	local length = 15
	--技能释放前判断
	if false == isTopSkill() then return end
	--我离焦点的距离
	local beforelength = GetDist(GetTaState())
	--判断落地是不是风车,群攻
	if IsDangerArea(GetTaState(),"敌对") then return end
	--判断13尺到17尺之间
	if beforelength > 12 and beforelength < 18 then
	CastTo("鹤归孤山",GetTaState(),true)
	end
end

------松舍问霞
function songshe()
	local length = 15
	--技能释放前判断
	if false == isTopSkill() then return end
	--判断松舍的cd
	if GetSkillSCD("峰插云景") ~= 0 then return end
	--技能距离判断
	if false == islengthSkill(length) then return end
	--判断是否免控,冲刺状态下
	if GetTaBuffTime("免控") ~= 0 then return end
	if GetTaBuffTime("单次免伤") ~= 0 then return end
	local taState = GetTaState()
	if string.find("冲刺",GetState(taState)) then return end
	--判断落地是不是风车,群攻
	if IsDangerArea(GetTaState(),"敌对") then return end
	Cast("松舍问霞")
end




--Main函数，1个参数是自己的玩家对象，每秒调用16次
function Main(player)
	yunxisong()
	quanningyue()
	--轻剑
	if isxinfa() == "问水诀" then
	yuhongguanri()
	zuiyue()
	pinghuduanyue()
	tinglei()
    fengchuihe()
	return
	end
	--重剑
	if isxinfa() == "山居剑意" then
	songshe()
	hegui()
	zuiyue()
	yunfei()
	zhongjingtao()
	xizhaoleifeng()
	tinglei()
	fengcha()
	return
	end
	
end


















































