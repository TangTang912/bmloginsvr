-- ��֮����

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)

	--	�� ��ħ��½
	scene:CreateDoorEvent(8, 18, 56, 130,123)

	scene:CreateMonster(113, 121, 141, 100, 20, 6000)
	scene:CreateMonster(109, 217, 125, 100, 20, 6000)
	scene:CreateMonster(110, 334, 174, 100, 20, 6000)
	scene:CreateMonster(113, 339, 298, 100, 20, 6000)
	scene:CreateMonster(109, 200, 275, 100, 20, 6000)
	scene:CreateMonster(110, 84, 300, 100, 20, 6000)
	scene:CreateMonsterLater(103, 116, 115, 2, 1, 6000)
	scene:CreateMonsterLater(103, 397, 286, 2, 1, 6000)
	scene:CreateMonsterLater(111, 210, 210, 2, 1, 6000)

	scene:SetAutoReset()

end

--2���ӵ���һ�� �������³�����Ϣ
function OnUpdateScene(scene)

end

--NPC���� function(npc, player)
gNPCQuestTable = {}
--NPC��ť��� function(bid, npc, player)
gNPCButtonTable = {}


-- OnMonsterDead ���������ص�
function OnMonsterDead(monster, player)
end

-- CanOpenDoor �Ƿ��ܽ���
function CanOpenDoor(x, y, player)

	return true

end

function GetVersion()
end



---------------------------------------------------------
--	����Ϊ���亯�� ���ض�

--��ҵ��NPC���� ���ڵ����Ի���
function OnNPCClick(npc, player)

	local npcid = npc:GetAttribID()

	func = gNPCQuestTable[npcid]
	if(func ~= nil) then
		func(npc, player)
	else
		MirLog("�����ڵ�NPC�Ի��ű�"..npcid)
	end

end

--��ҵ����ť ���ݰ�ťID������Ӧ����
function OnDlgButtonClick(bid, npc, player)

	local npcid = npc:GetAttribID()

	func = gNPCButtonTable[npcid]
	if(func ~= nil) then
		func(bid, npc, player)
	else
		MirLog("�����ڵ�NPC��ť�ű�"..npcid)
	end

end
