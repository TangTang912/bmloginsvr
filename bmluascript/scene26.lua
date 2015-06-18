-- ������

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)

	--	�� �������
	scene:CreateDoorEvent(25, 4, 54, 35, 30)

	--	���ֺ���
	--[[scene:CreateMonster(94, 27, 21, 80, 4, 60000)
	scene:CreateMonster(95, 27, 21, 80, 4, 60000)
	scene:CreateMonster(96, 27, 21, 80, 4, 60000)

	scene:CreateMonster(94, 34, 38, 80, 4, 60000)
	scene:CreateMonster(95, 34, 38, 80, 4, 60000)
	scene:CreateMonster(96, 34, 38, 80, 4, 60000)

	scene:CreateMonster(94, 52, 26, 80, 4, 60000)
	scene:CreateMonster(95, 52, 26, 80, 4, 60000)
	scene:CreateMonster(96, 52, 26, 80, 4, 60000)]]

	--	BOSS ����ػ���
	scene:CreateMonsterLater(98, 40, 14, 5, 1, 300000)

	--	С��
	scene:CreateMonster(94, 16, 39, 25, 3, 60000)
	scene:CreateMonster(95, 16, 39, 25, 3, 60000)
	scene:CreateMonster(96, 16, 39, 25, 3, 60000)

	scene:CreateMonster(94, 16, 26, 25, 3, 60000)
	scene:CreateMonster(95, 16, 26, 25, 3, 60000)
	scene:CreateMonster(96, 16, 26, 25, 3, 60000)

	scene:CreateMonster(94, 33, 26, 25, 3, 60000)
	scene:CreateMonster(95, 33, 26, 25, 3, 60000)
	scene:CreateMonster(96, 33, 26, 25, 3, 60000)

	scene:CreateMonster(94, 33, 40, 25, 3, 60000)
	scene:CreateMonster(95, 33, 40, 25, 3, 60000)
	scene:CreateMonster(96, 33, 40, 25, 3, 60000)

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
