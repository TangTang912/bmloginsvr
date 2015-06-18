--	ħ����ű�

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ��ħ��½
	scene:CreateDoorEvent(8, 49, 12, 239, 298)
	--	�� ԡѪ֮��
	scene:CreateDoorEvent(23, 226, 102, 29, 146)

	scene:CreateMonster(83, 41, 49, 20, 3, 60000)
	scene:CreateMonster(84, 41, 49, 20, 3, 60000)
	scene:CreateMonster(85, 41, 49, 20, 3, 60000)

	scene:CreateMonster(83, 61,84, 20, 3, 60000)
	scene:CreateMonster(84, 61,84, 20, 3, 60000)
	scene:CreateMonster(85, 61,84, 20, 3, 60000)

	scene:CreateMonster(83, 54,164, 20, 3, 60000)
	scene:CreateMonster(84, 54,164, 20, 3, 60000)
	scene:CreateMonster(85, 54,164, 20, 3, 60000)

	scene:CreateMonster(83, 98,172, 20, 3, 60000)
	scene:CreateMonster(84, 98,172, 20, 3, 60000)
	scene:CreateMonster(85, 98,172, 20, 3, 60000)

	scene:CreateMonster(83, 156,176, 20, 3, 60000)
	scene:CreateMonster(84, 156,176, 20, 3, 60000)
	scene:CreateMonster(85, 156,176, 20, 3, 60000)

	scene:CreateMonster(83, 134,58, 20, 3, 60000)
	scene:CreateMonster(84, 134,58, 20, 3, 60000)
	scene:CreateMonster(85, 134,58, 20, 3, 60000)

	scene:CreateMonster(83, 123,126, 20, 3, 60000)
	scene:CreateMonster(84, 123,126, 20, 3, 60000)
	scene:CreateMonster(85, 123,126, 20, 3, 60000)

	scene:CreateMonster(83, 193,80, 20, 3, 60000)
	scene:CreateMonster(84, 193,80, 20, 3, 60000)
	scene:CreateMonster(85, 193,80, 20, 3, 60000)
	scene:CreateMonsterLater(92, 55, 121, 0, 1, 300000)

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
