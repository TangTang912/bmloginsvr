--	��ħ�ܵ� �ű�
--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ��ħ��½
	scene:CreateDoorEvent(8, 111, 109, 105, 109)
	--	�� ţħ���
	scene:CreateDoorEvent(21, 8, 81, 46, 16)

	--	С��
	scene:CreateMonster(67, 43, 66, 40, 10, 60000)
	scene:CreateMonster(68, 43, 66, 40, 10, 60000)
	scene:CreateMonster(69, 43, 66, 40, 10, 60000)

	scene:CreateMonster(67, 69, 64, 40, 10, 60000)
	scene:CreateMonster(68, 69, 64, 40, 10, 60000)
	scene:CreateMonster(69, 69, 64, 40, 10, 60000)

	--	����
	scene:CreateMonster(71, 71, 65, 10, 1, 60000)
	--	����
	scene:CreateMonster(73, 15, 84, 10, 1, 60000)

	--	��ħ����
	scene:CreateMonsterLater(81, 71, 63, 10, 1, 240000)
	--	Ы��
	scene:CreateMonsterLater(17, 14, 87, 5, 1, 240000)

	scene:SetCannotStay()
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
