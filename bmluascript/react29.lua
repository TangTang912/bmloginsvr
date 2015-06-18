gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:���� function(ctx, questid, queststep)

--	���֮��
gNPCTable[10018] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���֮��:", 0)
		ctx:AddContextNode(0, 20, "�������Σ�յĺ������硣����������ܽ�����������ĳλ����սʤ����ħ��Ӣ���ͽ����İɡ�Ҳ���������ô���ˣ���ʱ��Ȼսʤ�������Ķ�ħ����Ҳ����ħ�ĺڰ�ħ�������Ӱ���ˡ�", 0)
		ctx:AddContextNode(30, 255, "�����ȥ", 3)
		ctx:AddContextNode(30, 270, "����", 2)
		ctx:AddContextNode(30, 285, "������", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���֮��:", 0)
		ctx:AddContextNode(0, 20, "��ħ�Ѿ���˯��", 0)
		--ctx:AddContextNode(30, 255, "ȷ��", 3)
		ctx:AddContextNode(30, 270, "�ر�", 1)
		
	elseif questid == 0 and queststep == 2 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���֮��:", 0)
		ctx:AddContextNode(0, 20, "��˵��������������ſ��µ��귨��½����µĶ�ħ�����Ӳ��߶�����ʹ������Ҫ�ӽ�������ֻ�趯������ָ���ܽ��Է��������һ����ɲ�ļһ�ռ��߿ŷ�������ٻ����ػ����������ǣ�����������Щ�����������Գư��귨��½��", 0)
		ctx:AddContextNode(30, 255, "ȷ��", 5)
		ctx:AddContextNode(30, 270, "�ر�", 1)
		
	elseif questid == 0 and queststep == 3 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���֮��:", 0)
		ctx:AddContextNode(0, 20, "�������뻽�Ѷ�ħ�������Ǿʹ����߿ŷ��������Ұɡ�������Ҫ�������ǵĶ��ǲ������ġ�", 0)
		ctx:AddContextNode(30, 255, "������", 4)
		ctx:AddContextNode(30, 270, "�ر�", 1)
		
	elseif questid == 0 and queststep == 4 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���֮��:", 0)
		ctx:AddContextNode(0, 20, "���Է����Ѿ�������", 0)
		--ctx:AddContextNode(30, 255, "������", 4)
		ctx:AddContextNode(30, 270, "�ر�", 1)
		
	elseif questid == 0 and queststep == 5 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���֮��:", 0)
		ctx:AddContextNode(0, 20, "�����߿ŷ��������ɡ�", 0)
		--ctx:AddContextNode(30, 255, "������", 4)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	end

end


------------------------------------------
--	���亯��
function OnSetDialogContext(ctx, npcid, questid, queststep)
	local func = gNPCTable[npcid]

	MirLog("Parameters:NPCID:"..npcid.."QuestID:"..questid.."QuestStep:"..queststep)
	if func ~= nil then
		ctx:Clear()
		func(ctx, questid, queststep)
	else
		MirLog("In react.lua:�޷��ҵ�NPC["..npcid.."]")
	end
end
