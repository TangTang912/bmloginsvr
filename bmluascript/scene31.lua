-- ��������

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)

	--	�� ���µ�
	--scene:CreateDoorEvent(24, 66, 16, 43, 21)
	--	�� ��������
	scene:CreateDoorEvent(30, 33, 171, 448, 48)

	--	�� ���Է�
	scene:CreateDoorEvent(32, 141, 52, 12, 28)

	scene:CreateMonster(103, 100, 100, 100, 8, 6000)
	scene:CreateMonster(104, 100, 100, 100, 8, 6000)
	scene:CreateMonster(111, 100, 100, 100, 8, 6000)
	scene:CreateMonster(112, 100, 100, 100, 8, 6000)

	scene:CreateMonsterLater(105, 100, 100, 100, 2, 8000)
	scene:CreateMonsterLater(106, 101, 95, 2, 1, 30000)
	--scene:CreateMonsterLater(106, 104, 88, 10, 5, 30000)

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
