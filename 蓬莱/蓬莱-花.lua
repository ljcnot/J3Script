--��ʼ�����֣������ʱ���ִ�У���Ҫ���ں�������
--����һЩѡ��
AddOption("ѡ��һ")
AddOption("ѡ���")
AddOption("ѡ����")

--�ű�������˵��������������ЩЩ��Ѩ֮��ģ�������\n
--����ڲ���˵��еĽű�˵���л���ʾ
szScriptDesc = "���ߣ�ĳĳĳ\n˵�����ű�˵��\n��Ѩ����Ѩ1����Ѩ2"

----g_player�Լ��Ķ���ȫ�֣�
	m = GetMyPlayer() --�Լ�
    t, tclass = GetTarget(m) --�ҵ�Ŀ�꣬����
---------------------------���
function tmiankongTime()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return end
	return GetTypeTime(GetBuff(t), "���")
end
function mmiankongTime()
	return GetTypeTime(GetBuff(GetMyPlayer()), "���")

end
-----------------------------------����
function tjianshangTime()
	local t, tclass = GetTarget(GetMyPlayer())
	if not tclass then return end
	return GetTypeTime(GetBuff(t), "����")
end
function mjianshangTime()
	return GetTypeTime(GetBuff(GetMyPlayer()), "����")
end
------------------------------------����
function tjidaotime()
	local t, tclass = GetTarget(GetMyPlayer())
	if not tclass then return end
	return GetTypeTime(GetBuff(t), "����")
end
function mjidaotime()
    return GetTypeTime(GetBuff(GetMyPlayer()), "����")
end
----------------------------------------ѣ��
function txuanyunTime()
	local t, tclass = GetTarget(GetMyPlayer())
	if not tclass then return end
	return GetTypeTime(GetBuff(t), "ѣ��")
end
function mxuanyuntime()
    return GetTypeTime(GetBuff(GetMyPlayer()), "ѣ��")
end
------------------------------------����
function tdingshenTime()
    local t, tclass = GetTarget(GetMyPlayer())
	if not tclass then return end
	return GetTypeTime(GetBuff(t), "����")
end
function mdingshenTime()
    return GetTypeTime(GetBuff(GetMyPlayer()), "����")
end
---------------------------------����
function tsuozuTime()
	local t, tclass = GetTarget(GetMyPlayer())
	if not tclass then return end
	return GetTypeTime(GetBuff(t), "����")

end
function msuozuTime()
    	return GetTypeTime(GetBuff(GetMyPlayer()), "����")
end
------------------------------------
function tshanbiTime()
    local t, tclass = GetTarget(GetMyPlayer()) --�ҵ�Ŀ�꣬����
	if tclass==NONE then return end
	return GetBuffTime(GetBuff(t), "����|��������|ȵ̤֦|����ң|�紵��|�ȱ�Ը|������|�������|�ݳ�����")
end
function tjianshangTime()
	local m = GetMyPlayer() --�Լ�
    local t, tclass = GetTarget(GetMyPlayer()) --�ҵ�Ŀ�꣬����
	if tclass==NONE then return end
	return GetBuffTime(GetBuff(t), "���Ӱ��|�ֻ�|����ɽ|Ц������|����|�����|����|תǬ��|���໤��|��Ԩ����|��ǽ|�����|Ħ��|����֮��|��Х����|����|����|����|�ٻ�|�����|������|����|��������|����|ҷ��|ʥ��֯��|����|�����|���Ӱ��|̰ħ��|���໤��|ʥ��֯��|���໤��|̰ħ��|����ɽ|ɢӰ|��Ӱ|����Ϸˮ|���໤��|��ˮ��|ˮ鿻�ӯ|����֮��|����|�ݲй�")
end
function tmianfengneiTime()
    local t, tclass = GetTarget(GetMyPlayer()) --�ҵ�Ŀ�꣬����
	if tclass==NONE then return end
	return GetBuffTime(GetBuff(t), "8458| 377|6213|9934|8864|3425|2781|9693|6414|6350|1186|10618|5777|4439|9509")
	                               --ˮ�� ��ɽ�� ����  �Ϸ�  ǧ��  �� תǬ�� ���Ӱ��  ���� �ٷ� �۹� ����  ʥ�� ̰ħ ��������
end
function tmianlaTime()
    local t, tclass = GetTarget(GetMyPlayer()) --�ҵ�Ŀ�꣬����
	if tclass==NONE then return end
	return GetBuffTime(GetBuff(t), "8265| 8247|  377|   6213| 9934| 8864| 3425| 10245|  9693|  9848|  3275|   5995|  9509|    11361|11077   |11385|  2756   |5754|12481|1686|    9999| 11319|  8483|10258|1676|     562|12534| ")
	                               --��ǽ �޾�   ��ɽ�� ����  �Ϸ�  ǧ��  �� ����Χ ���Ӱ�� ̽÷  ������Ⱥ Ц��� ��������    ����       �������� ������  ���� ����  ��Ȫ���� ���� ��Ԩ���� ���� ��Ұ  ��Ȫ��Ծ ��Χ ����
end
function mlife()
    return (g_player.nCurrentLife/g_player.nMaxLife)*100
end
function tlife()
    local t, tclass = GetTarget(GetMyPlayer()) --�ҵ�Ŀ�꣬����
	if not tclass then return end --��Ŀ�귵��
	if tclass==NONE then return end --��Ŀ�귵��
	local tlife, tlifev, tmana, tmanav, trage, tenergy, tqidian, tsun, tmoon, tsun_power, tmoon_power, tfight, thorse, tstate, tschool, tmount, tpose = GetAttr(t)
	return tlife*100
end
function tstate()
    local t, tclass = GetTarget(GetMyPlayer()) --�ҵ�Ŀ�꣬����
	if tclass==NONE then return end --��Ŀ�귵��
	return GetState(t)
end
function state()
    return GetState(m)
end
function rela()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return end
    if GetRela(t)~="�ж�" then
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
	if state()=="����" then
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
    if tstate()=="����" then return true end
	if tstate()=="λ��" then return true  end
	if tstate()=="���" then return true  end
    if GetCastTime(t,20083)>=0 and GetCastTime(t,20083)<0.5 then return true  end
	return false
end
function qichang()
	local fengyu,number=FindNpc(GetMyPlayer(),"62352",5.5,"�Լ�")
    return number
end
function Return()

	local t, tclass = GetTarget(GetMyPlayer()) --�ҵ�Ŀ�꣬����
	if tclass==NONE then return end
	if GetBuffTime(GetBuff(t),"����")>0 then
		return true
	end
	if tstate()=="����" then return true end
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
    	if GetBuffStack(GetBuff(GetMyPlayer()),"����") > 1 then
		return true
	end
	if GetBuffTime(GetBuff(GetMyPlayer()),"��������") > 10 and GetBuffTime(GetBuff(GetMyPlayer()),"����ع��") > 10 then
		return true
	end
end
-----------------------------------------------
function wuhuatianxing()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if rela() then return false end
	if Return() then return false end
    if GetSkillCN("�ﻯ����")<1 then return false end
	if dis()>30 or dis()<8 then return false end
	if GetCastTime(GetMyPlayer(),20049)<4 or state()=="���" then return false end
	if tclass==player then
	if tjianshangTime()>0 then return false end
	if theightdis()>8 then return false end
	end
	--if tmiankongTime()>0 then return false end
	if tshanbiTime()>0 then return false end
	if tmove() then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>5 then
	return true
	end
	return false
end
function fuyoutiandi()
    if GetSkillCN("�������")<1 then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>0 then
		return false
	end
    if state()=="����" or state()=="ѣ��" then
		return true
	end
	return false
end
function fuyoutiandi1()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if rela() then return false end
	if GetSkillCN("�������")<1 then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>0 then return false end
	if qixue()[8]~="����" then return false end
	if tmiankongTime()>0 then return false end
	if txuanyunTime()>1 then return false end
	if tsuozuTime()>1 then return false end
	if tdingshenTime()>1 then return false end
	if tmove() then return false end
	if tstate()=="����" then return false end
	if dis()>6 then return false end
	return true
end
function haiyunnanming()
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
    if rela() then return false end
	if GetSkillSCD("������ڤ")~=0 then return false end
	if dis()>8 then return false end
	if --[[state()=="����" or state()=="���" and--]] GetCastTime(GetMyPlayer(),20049)<10 then
		return true
	end
	return false
end
function minghaiyubo()--20083(ң˼)��
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
    if rela() then return false end
	if qixue()[4]=="ң˼" then
        if GetSkillCN(20083)==0 then return false end
	end
	if qixue()[4]~="ң˼" then
	    if GetSkillSCD(20083)~=0 then return false end
	end
    if dis()>8 then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>0 then
		return true
	end
	return true
end
function zhubolingyou()
	local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if Return() then return false end	
	if rela() then return false end
	if qixue()[4]=="ң˼" then
		if GetSkillSCD(20084)~=0 then return false end
	    if dis()>5 then return false end
	end
	if qixue()[4]=="ڤ��"  then
		if GetSkillSCD(20804)~=0 then return false end
		if dis()>20 then return false end
	end
	if tmiankongTime()>0 then return false end
	if tmove() then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>0 then
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
	if GetSkillCN("�������")<1 then return false end
	if dis()>27 then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>0 and GetBuffTime(GetBuff(GetMyPlayer()),"�������")<5 then
		return true
	end
	if qixue()[8]=="����" then
		if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>15 then return false end
		if tmove() then return false end
		if tmiankongTime()>0 then return false end
        if qixue()[4]=="ң˼"  then
		    if GetSkillSCD(20084)~=0 then return false end
	    end
	    if qixue()[4]=="ң˼" then
		    if GetSkillSCD(20804)~=0 then return false end
	    end
		return true
	end
	if GetBuffStack(GetBuff(GetMyPlayer()),"��")>3 then
		return true
	end
--[[	if GetBuffStack(GetBuff(GetMyPlayer()),"����")>0 then
		return true
	end--]]
	return false
end
function ranranruohai()  --20837
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if Return() then return false end
	if rela() then return false end
	if qixue()[12]~="�Ȼ����" then return false end
	if GetSkillSCD("�Ȼ����")~=0 then return false end
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
    if GetSkillSCD("ľ�����")~=0 then return false end
	if dis()>6 then return false end
	if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>0 then return false end
	return true
end
function jishuishanqian()
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if rela() then return end
    if dis()>6 then return end
	if Return() then return end
	if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>0 then return end
	if state()=="����" or state()=="���" then return false	end
	if state()=="վ��" or state()=="�ܲ�" or state()=="��Ծ" then
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
if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>0 then return end
Cast(19827)
end
function yuyuchifeng()
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if GetSkillSCD("Ԧ��ҷ�")~=0 then return false end
    if GetSkillCN("�������") > 0 then
		return false
	end
	if state()=="����" or state()=="ѣ��" or state()=="����" then
		return true
	end
    if qixue()[11]=="�®" then
		if heightdis()>8 then
            if GetBuffTime(GetBuff(GetMyPlayer()),"�������")>0 then
                if GetSkillSCD("������ڤ")~=0 and GetSkillSCD(20083)~=0 and state()~="���" then
			    return true
				end
			end
			if GetBuffTime(GetBuff(GetMyPlayer()),"�������")==0 then
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
	if GetSkillSCD("���ͼ��")~=0 then return false end
	if tstate()=="����" then
		return true
	end
	return false
end
function kongsangwuse()
		local t, tclass = GetTarget(GetMyPlayer())
	if tclass==NONE then return false end
	if not qixue()[10]~="��ɣ��ɪ" then return end
	if Return() then return false end
	if rela() then return false end
    if dis()>20 then return false end
	if GetSkillSCD("��ɣ��ɪ")~=0 then return false end
	if tmove() then return false end
	if tmiankongTime()>0 then return false end
    return true
end
function fy()
    if GetSkillSCD("��ҡֱ��")==0 and GetSkillCN("�������")<1 and (state()=="�ܲ�" or state()=="վ��") and GetSkillSCD("Ԧ��ҷ�")~=0 then
	     Cast("��ҡֱ��")
	end
	if GetSkillCN("�������")<1 and GetSkillSCD("Ԧ��ҷ�")~=0 and (state()=="�ܲ�" or state()=="վ��") and GetBuffTime(GetBuff(GetMyPlayer()),"����")>0 then
		Jump()
	end
end
function Main(player)
	fy()
	--if wuhuatianxing() then
		--Cast("�ﻯ����")
	--end
	if fuyoutiandi1() then
		Cast("�������")
	end
	if fuyoutiandi() then
		Cast("�������")
	end
	yijueyuntian()
	if kongsangwuse() then
		Cast("��ɣ��ɪ")
	end
	if zhenchitunan() then
		Cast("���ͼ��")
	end
	if zhubolingyou()==2 then
		if qixue()[4]=="ң˼" then
	    CastTo(20084,GetTargetID(),true)
		return 1
	    end
		if qixue()[4]=="ڤ��"  then
	    CastTo(20804,GetTargetID(),true)
		return 1
	    end
	end
 	if minghaiyubo() then
		Cast("�麣����")
	--CastTo("�麣����",GetTargetID(),true)
	end
	if haiyunnanming() then
		Cast("������ڤ")
		return 1
	--CastTo("������ڤ",GetTargetID(),true)
    end
	if ranranruohai() then
		Cast("�Ȼ����")
		return 1
	end
	if yuyuchifeng() then
		Cast("Ԧ��ҷ�",true)
	end
    if zhubolingyou()==1 then
		if qixue()[4]=="ң˼" then
	    CastTo(20084,GetTargetID(),true)
		return 1
	    end
		if qixue()[4]=="ڤ��"  then
	    CastTo(20804,GetTargetID(),true)
		return 1
	    end
	end
	if yuechaozhanbo() then
		Cast("Ծ��ն��")
	end
	if muluoyangui() then
		Cast("ľ�����")
		return 1
	end
	jishuishanqian()
   -- print()
end
--�ͷż��ܻص���������������ͷż���ʱ����
function OnCast(CasterID, dwSkillID, dwLevel, nPastFrame, tClass, tIDnX, nY, nZ)

end


--��ʼ�����ص��������������ʼ����ʱ����
function OnPrepare(CasterID, dwSkillID, dwLevel, nLeftFrame, tClass, tIDnX, nY, nZ)

end