gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:���� function(ctx, questid, queststep)
--	����һ���Ӧ�ű�

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
