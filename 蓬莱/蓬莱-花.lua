--初始化部分，载入的时候会执行，不要放在函数里面
--设置一些选项
AddOption("选项一")
AddOption("选项二")
AddOption("选项三")

--脚本描述和说明，比如设置哪些些奇穴之类的，换行用\n
--这个在插件菜单中的脚本说明中会显示
szScriptDesc = "作者：某某某\n说明：脚本说明\n奇穴：奇穴1，奇穴2"

----g_player自己的对象（全局）
	m = GetMyPlayer() --自己
    t, tclass = GetTarget(m) --我的目标，类型
---------------------------免控
function tmiankongTime()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return end
	return GetTypeTime(GetBuff(t), "免控")
end
function mmiankongTime()
	return GetTypeTime(GetBuff(GetMyPlayer()), "免控")

end
-----------------------------------减伤
function tjianshangTime()
	local t, tclass = GetTarget(GetMyPlayer())
	if not tclass then return end
	return GetTypeTime(GetBuff(t), "减伤")
end
function mjianshangTime()
	return GetTypeTime(GetBuff(GetMyPlayer()), "减伤")
end
------------------------------------击倒
function tjidaotime()
	local t, tclass = GetTarget(GetMyPlayer())
	if not tclass then return end
	return GetTypeTime(GetBuff(t), "击倒")
end
function mjidaotime()
    return GetTypeTime(GetBuff(GetMyPlayer()), "击倒")
end
----------------------------------------眩晕
function txuanyunTime()
	local t, tclass = GetTarget(GetMyPlayer())
	if not tclass then return end
	return GetTypeTime(GetBuff(t), "眩晕")
end
function mxuanyuntime()
    return GetTypeTime(GetBuff(GetMyPlayer()), "眩晕")
end
------------------------------------定身
function tdingshenTime()
    local t, tclass = GetTarget(GetMyPlayer())
	if not tclass then return end
	return GetTypeTime(GetBuff(t), "定身")
end
function mdingshenTime()
    return GetTypeTime(GetBuff(GetMyPlayer()), "定身")
end
---------------------------------锁足
function tsuozuTime()
	local t, tclass = GetTarget(GetMyPlayer())
	if not tclass then return end
	return GetTypeTime(GetBuff(t), "锁足")

end
function msuozuTime()
    	return GetTypeTime(GetBuff(GetMyPlayer()), "锁足")
end
------------------------------------
function tshanbiTime()
    local t, tclass = GetTarget(GetMyPlayer()) --我的目标，类型
	if tclass==NONE then return end
	return GetBuffTime(GetBuff(t), "雾雨|惊鸿游龙|鹊踏枝|醉逍遥|风吹荷|慈悲愿|云栖松|御风而行|逸尘步虚")
end
function tjianshangTime()
	local m = GetMyPlayer() --自己
    local t, tclass = GetTarget(GetMyPlayer()) --我的目标，类型
	if tclass==NONE then return end
	return GetBuffTime(GetBuff(t), "清绝影歌|轮回|守如山|笑傲光阴|坚韧|无相决|御天|转乾坤|春泥护花|临渊蹈河|盾墙|无相诀|摩咭|万籁之寂|龙啸九天|舍身|零落|绝歌|荣辉|无相诀|光明相|无我|屹立不倒|雾体|曳光|圣手织天|西宗|无相决|清绝影歌|贪魔体|春泥护花|圣手织天|春泥护花|贪魔体|守如山|散影|残影|乘龙戏水|春泥护花|玄水蛊|水榭花盈|万籁之寂|捍卫|枯残蛊")
end
function tmianfengneiTime()
    local t, tclass = GetTarget(GetMyPlayer()) --我的目标，类型
	if tclass==NONE then return end
	return GetBuffTime(GetBuff(t), "8458| 377|6213|9934|8864|3425|2781|9693|6414|6350|1186|10618|5777|4439|9509")
	                               --水月 镇山河 不动  南风  千蝶  鬼斧 转乾坤 清绝影歌  光临 临风 折骨 雾雨  圣手 贪魔 青霄飞羽
end
function tmianlaTime()
    local t, tclass = GetTarget(GetMyPlayer()) --我的目标，类型
	if tclass==NONE then return end
	return GetBuffTime(GetBuff(t), "8265| 8247|  377|   6213| 9934| 8864| 3425| 10245|  9693|  9848|  3275|   5995|  9509|    11361|11077   |11385|  2756   |5754|12481|1686|    9999| 11319|  8483|10258|1676|     562|12534| ")
	                               --盾墙 无惧   镇山河 不动  南风  千蝶  鬼斧 破重围 清绝影歌 探梅  绝伦逸群 笑醉狂 青霄飞羽    尘身       西楚悲歌 纵轻骑  霸体 浮空  梦泉虎跑 捣衣 临渊蹈河 盾毅 宽野  玉泉鱼跃 重围 长致
end
function mlife()
    return (g_player.nCurrentLife/g_player.nMaxLife)*100
end
function tlife()
    local t, tclass = GetTarget(GetMyPlayer()) --我的目标，类型
	if not tclass then return end --无目标返回
	if tclass==NONE then return end --无目标返回
	local tlife, tlifev, tmana, tmanav, trage, tenergy, tqidian, tsun, tmoon, tsun_power, tmoon_power, tfight, thorse, tstate, tschool, tmount, tpose = GetAttr(t)
	return tlife*100
end
function tstate()
    local t, tclass = GetTarget(GetMyPlayer()) --我的目标，类型
	if tclass==NONE then return end --无目标返回
	return GetState(t)
end
function state()
    return GetState(m)
end
function rela()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return end
    if GetRela(t)~="敌对" then
		return true
	end
return false
end
function dis()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass=="nil" then return end
	local d =GetDist(GetMyPlayer(),t)
	return d
end
function skilldis()
	local d = dis()
	if state()=="浮空" then
		d=d-10
	end
    return d
end
function qixue()
	local talent = GetTalentInfo()
	return talent
end
function theightdis()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return end
	if tclass==NPC then return end
    return GetHeight(t)
end
function heightdis()
    return GetHeight(GetMyPlayer())
end
function tmove()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return end
    if tstate()=="击倒" then return true end
	if tstate()=="位移" then return true  end
	if tstate()=="冲刺" then return true  end
    if GetCastTime(t,20083)>=0 and GetCastTime(t,20083)<0.5 then return true  end
	return false
end
function qichang()
	local fengyu,number=FindNpc(GetMyPlayer(),"62352",5.5,"自己")
    return number
end
function Return()

	local t, tclass = GetTarget(GetMyPlayer()) --我的目标，类型
	if tclass==NONE then return end
	if GetBuffTime(GetBuff(t),"盾立")>0 then
		return true
	end
	if tstate()=="重伤" then return true end
	return false
end
function tstate()
	local m = GetMyID()
    local t = GetTargetID()
	local t, tclass = GetTarget(m)
	if tclass==NONE then return end	
	return GetState(t)
end
function behit()
    local seemecount, seemet = GetSeeMe(25)
	return seemecount
end
function danger()
    	if GetBuffStack(GetBuff(GetMyPlayer()),"急曲") > 1 then
		return true
	end
	if GetBuffTime(GetBuff(GetMyPlayer()),"兰摧玉折") > 10 and GetBuffTime(GetBuff(GetMyPlayer()),"钟林毓秀") > 10 then
		return true
	end
end
-----------------------------------------------
function wuhuatianxing()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if rela() then return false end
	if Return() then return false end
    if GetSkillCN("物化天行")<1 then return false end
	if dis()>30 or dis()<8 then return false end
	if GetCastTime(GetMyPlayer(),20049)<4 or state()=="冲刺" then return false end
	if tclass==player then
	if tjianshangTime()>0 then return false end
	if theightdis()>8 then return false end
	end
	--if tmiankongTime()>0 then return false end
	if tshanbiTime()>0 then return false end
	if tmove() then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")>5 then
	return true
	end
	return false
end
function fuyoutiandi()
    if GetSkillCN("浮游天地")<1 then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")>0 then
		return false
	end
    if state()=="击倒" or state()=="眩晕" then
		return true
	end
	return false
end
function fuyoutiandi1()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if rela() then return false end
	if GetSkillCN("浮游天地")<1 then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")>0 then return false end
	if qixue()[8]~="凌霄" then return false end
	if tmiankongTime()>0 then return false end
	if txuanyunTime()>1 then return false end
	if tsuozuTime()>1 then return false end
	if tdingshenTime()>1 then return false end
	if tmove() then return false end
	if tstate()=="爬起" then return false end
	if dis()>6 then return false end
	return true
end
function haiyunnanming()
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
    if rela() then return false end
	if GetSkillSCD("海运南冥")~=0 then return false end
	if dis()>8 then return false end
	if --[[state()=="浮空" or state()=="冲刺" and--]] GetCastTime(GetMyPlayer(),20049)<10 then
		return true
	end
	return false
end
function minghaiyubo()--20083(遥思)，
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
    if rela() then return false end
	if qixue()[4]=="遥思" then
        if GetSkillCN(20083)==0 then return false end
	end
	if qixue()[4]~="遥思" then
	    if GetSkillSCD(20083)~=0 then return false end
	end
    if dis()>8 then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")>0 then
		return true
	end
	return true
end
function zhubolingyou()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if Return() then return false end	
	if rela() then return false end
	if qixue()[4]=="遥思" then
		if GetSkillSCD(20084)~=0 then return false end
	    if dis()>5 then return false end
	end
	if qixue()[4]=="冥意"  then
		if GetSkillSCD(20804)~=0 then return false end
		if dis()>20 then return false end
	end
	if tmiankongTime()>0 then return false end
	if tmove() then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")>0 then
		if tclass == player then
			if theightdis()>8 then
				return 2
			end
		end
		return 1
	end
	return false
end
function yuechaozhanbo()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end	
	if Return() then return false end
	if rela() then return false end
    if GetSkillSCD(20053)~=0 then return false end
	if GetSkillCN("浮游天地")<1 then return false end
	if dis()>27 then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")>0 and GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")<5 then
		return true
	end
	if qixue()[8]=="凌霄" then
		if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")>15 then return false end
		if tmove() then return false end
		if tmiankongTime()>0 then return false end
        if qixue()[4]=="遥思"  then
		    if GetSkillSCD(20084)~=0 then return false end
	    end
	    if qixue()[4]=="遥思" then
		    if GetSkillSCD(20804)~=0 then return false end
	    end
		return true
	end
	if GetBuffStack(GetBuff(GetMyPlayer()),"神降")>3 then
		return true
	end
--[[	if GetBuffStack(GetBuff(GetMyPlayer()),"游心")>0 then
		return true
	end--]]
	return false
end
function ranranruohai()  --20837
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if Return() then return false end
	if rela() then return false end
	if qixue()[12]~="澹然若海" then return false end
	if GetSkillSCD("澹然若海")~=0 then return false end
	if qichang()~=1 then return false end
    if dis()>8 then return false end
	if tmiankongTime()>0 then return false end
    if tjianshangTime()>0 then return false end
		return true
	
end
function muluoyangui() --19818
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
    if Return() then return false end
	if rela() then return false end
    if GetSkillSCD("木落雁归")~=0 then return false end
	if dis()>6 then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")>0 then return false end
	return true
end
function jishuishanqian()
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if rela() then return end
    if dis()>6 then return end
	if Return() then return end
	if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")>0 then return end
	if state()=="浮空" or state()=="冲刺" then return false	end
	if state()=="站立" or state()=="跑步" or state()=="跳跃" then
		if GetCastTime(GetMyPlayer(), 20230)>= 0  and GetCastTime(GetMyPlayer(), 20230)<2 then
			Cast(20231)
		end
		Cast(20230)
	end
end
function yijueyuntian() --19827
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
if rela() then return end
if dis()>20 then return end
if Return() then Cast(20017) return end
if GetBuffTime(GetBuff(GetMyPlayer()),"翼绝云天")>0 then return end
Cast(19827)
end
function yuyuchifeng()
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if GetSkillSCD("驭羽骋风")~=0 then return false end
    if GetSkillCN("浮游天地") > 0 then
		return false
	end
	if state()=="击倒" or state()=="眩晕" or state()=="定身" then
		return true
	end
    if qixue()[11]=="穹庐" then
		if heightdis()>8 then
            if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")>0 then
                if GetSkillSCD("海运南冥")~=0 and GetSkillSCD(20083)~=0 and state()~="冲刺" then
			    return true
				end
			end
			if GetBuffTime(GetBuff(GetMyPlayer()),"浮游天地")==0 then
				return true
			end
		end
	end

	return false
end
function zhenchitunan()
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
    if Return() then return false end
	if rela() then return false end
	if dis()>20 then return false end
	if GetSkillSCD("振翅图南")~=0 then return false end
	if tstate()=="击倒" then
		return true
	end
	return false
end
function kongsangwuse()
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if not qixue()[10]~="空桑舞瑟" then return end
	if Return() then return false end
	if rela() then return false end
    if dis()>20 then return false end
	if GetSkillSCD("空桑舞瑟")~=0 then return false end
	if tmove() then return false end
	if tmiankongTime()>0 then return false end
    return true
end
function fy()
    if GetSkillSCD("扶摇直上")==0 and GetSkillCN("浮游天地")<1 and (state()=="跑步" or state()=="站立") and GetSkillSCD("驭羽骋风")~=0 then
	     Cast("扶摇直上")
	end
	if GetSkillCN("浮游天地")<1 and GetSkillSCD("驭羽骋风")~=0 and (state()=="跑步" or state()=="站立") and GetBuffTime(GetBuff(GetMyPlayer()),"弹跳")>0 then
		Jump()
	end
end
function Main(player)
	fy()
	--if wuhuatianxing() then
		--Cast("物化天行")
	--end
	if fuyoutiandi1() then
		Cast("浮游天地")
	end
	if fuyoutiandi() then
		Cast("浮游天地")
	end
	yijueyuntian()
	if kongsangwuse() then
		Cast("空桑舞瑟")
	end
	if zhenchitunan() then
		Cast("振翅图南")
	end
	if zhubolingyou()==2 then
		if qixue()[4]=="遥思" then
	    CastTo(20084,GetTargetID(),true)
		return 1
	    end
		if qixue()[4]=="冥意"  then
	    CastTo(20804,GetTargetID(),true)
		return 1
	    end
	end
 	if minghaiyubo() then
		Cast("溟海御波")
	--CastTo("溟海御波",GetTargetID(),true)
	end
	if haiyunnanming() then
		Cast("海运南冥")
		return 1
	--CastTo("海运南冥",GetTargetID(),true)
    end
	if ranranruohai() then
		Cast("澹然若海")
		return 1
	end
	if yuyuchifeng() then
		Cast("驭羽骋风",true)
	end
    if zhubolingyou()==1 then
		if qixue()[4]=="遥思" then
	    CastTo(20084,GetTargetID(),true)
		return 1
	    end
		if qixue()[4]=="冥意"  then
	    CastTo(20804,GetTargetID(),true)
		return 1
	    end
	end
	if yuechaozhanbo() then
		Cast("跃潮斩波")
	end
	if muluoyangui() then
		Cast("木落雁归")
		return 1
	end
	jishuishanqian()
   -- print()
end
--释放技能回调函数，任意对象释放技能时调用
function OnCast(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)

end


--开始读条回调函数，任意对象开始读条时调用
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end