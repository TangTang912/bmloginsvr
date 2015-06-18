gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:���� function(ctx, questid, queststep)

--	����
gNPCTable[10016] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "������⵽���ܴ���������Ϊ�������������Ϸ���ҿ��������ȥ���������еĵ���װ��������ա�", 0)
		ctx:AddContextNode(30, 255, "�����ȥ", 2)
		ctx:AddContextNode(30, 270, "������", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "��ȥ��������еĵ��ߣ�ȷ��Ҫ��ȥ��", 0)
		ctx:AddContextNode(30, 255, "ȷ��", 3)
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
