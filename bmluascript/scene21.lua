--	ţħ�����ű�
--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ��ħ�ܵ�
	scene:CreateDoorEvent(20, 46, 16, 8, 81)

	--	С����
	scene:CreateMonster(69, 49, 41, 40, 15, 120000)
	scene:CreateMonster(70, 49, 41, 40, 15, 120000)
	scene:CreateMonster(72, 49, 41, 40, 8, 120000)
	--	����
	scene:CreateMonsterLater(71, 49, 41, 40, 2, 60000)
	--	����
	scene:CreateMonsterLater(73, 49, 41, 40, 2, 60000)

	--	ţħ��
	scene:CreateMonsterLater(16, 49, 41, 20, 1, 360000)

	--	��������
	--scene:CreateMonsterLater(80, 49, 41, 20, 1, 780000)

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
	local monsterid = monster:GetMonsterID()
	local createseed = math.random(1, 4)
	if monsterid == 16 and
	createseed == 1 then
		local posX = monster:GetCoordXInt()
		local posY = monster:GetCoordYInt()
		player:GetLocateScene():CreateDoorEventWithNotification(36, posX, posY, 84, 85, 2 * 60 * 1000)
	end
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
