--	ԡѪ֮��

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ħ��ɽ
	scene:CreateDoorEvent(22, 29, 146, 226, 102)

	scene:CreateMonster(83, 55,126, 30, 10, 60000)
	scene:CreateMonster(84, 55,126, 30, 10, 60000)
	scene:CreateMonster(85, 55,126, 30, 10, 60000)

	scene:CreateMonster(83, 81,55, 30, 10, 60000)
	scene:CreateMonster(84, 81,55, 30, 10, 60000)
	scene:CreateMonster(85, 81,55, 30, 10, 60000)

	scene:CreateMonster(83, 144,101, 30, 10, 60000)
	scene:CreateMonster(84, 144,101, 30, 10, 60000)
	scene:CreateMonster(85, 144,101, 30, 10, 60000)

	scene:CreateMonsterLater(87, 80,59, 40, 3, 180000)
	scene:CreateMonsterLater(88, 80,59, 40, 3, 180000)
	scene:CreateMonsterLater(89, 80,59, 40, 3, 180000)
	scene:CreateMonsterLater(86, 80,59, 5, 1, 220000)

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
