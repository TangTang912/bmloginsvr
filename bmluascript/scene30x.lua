-- ��������

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)

	--	�� ��֮����
	scene:CreateDoorEvent(29, 29, 478, 256, 310)
	--	�� ��������
	scene:CreateDoorEvent(34, 448, 48, 33, 171)

	scene:CreateMonster(103, 250, 250, 250, 30, 6000)
	scene:CreateMonster(104, 250, 250, 250, 30, 6000)
	scene:CreateMonster(108, 250, 250, 250, 30, 6000)
	scene:CreateMonster(111, 250, 250, 250, 30, 6000)

	--scene:CreateMonster(103, 272, 136, 40, 20, 6000)
	--scene:CreateMonster(104, 272, 136, 40, 20, 6000)
	--scene:CreateMonster(108, 272, 136, 40, 20, 6000)
	--scene:CreateMonster(111, 272, 136, 40, 20, 6000)

	--scene:CreateMonster(103, 438, 60, 40, 20, 6000)
	--scene:CreateMonster(104, 438, 60, 40, 20, 6000)
	--scene:CreateMonster(108, 438, 60, 40, 20, 6000)
	--scene:CreateMonster(111, 438, 60, 40, 20, 6000)

	--scene:CreateMonster(103, 395, 279, 40, 20, 6000)
	--scene:CreateMonster(104, 395, 279, 40, 20, 6000)
	--scene:CreateMonster(108, 395, 279, 40, 20, 6000)
	--scene:CreateMonster(111, 395, 279, 40, 20, 6000)

	--scene:CreateMonster(103, 109, 348, 40, 20, 6000)
	--scene:CreateMonster(104, 109, 348, 40, 20, 6000)
	--scene:CreateMonster(108, 109, 348, 40, 20, 6000)
	--scene:CreateMonster(111, 109, 348, 40, 20, 6000)

	scene:CreateMonsterLater(105, 173, 408, 3, 1, 12000)
	scene:CreateMonsterLater(105, 396, 288, 3, 1, 12000)
	scene:CreateMonsterLater(105, 232, 155, 3, 1, 12000)

	scene:SetAutoReset()
	scene:SetCannotStay()

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
