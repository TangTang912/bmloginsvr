--	���ζ���
--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	-- �� ����һ��
	scene:CreateDoorEvent(9, 33, 56, 31, 8)

	--	������
	scene:CreateMonsterLater(19, 67, 36, 0, 1, 300000)

	scene:CreateMonster(39, 50, 35, 10, 4, 40000)
	scene:CreateMonster(40, 50, 35, 10, 4, 40000)
	scene:CreateMonster(41, 50, 35, 10, 4, 40000)
	scene:CreateMonster(42, 50, 35, 10, 4, 40000)
	scene:CreateMonster(43, 50, 35, 10, 4, 40000)

	scene:CreateMonster(39, 39, 49, 10, 4, 40000)
	scene:CreateMonster(40, 39, 49, 10, 4, 40000)
	scene:CreateMonster(41, 39, 49, 10, 4, 40000)
	scene:CreateMonster(42, 39, 49, 10, 4, 40000)
	scene:CreateMonster(43, 39, 49, 10, 4, 40000)

	scene:CreateMonsterLater(44, 50, 35, 5, 1, 80000)
	scene:CreateMonsterLater(44, 39, 49, 5, 1, 80000)

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
	local posX = monster:GetCoordXInt()
	local posY = monster:GetCoordYInt()
	if monster:GetMonsterID() == 19 then
		player:GetLocateScene():CreateDoorEventWithNotification(38, posX, posY, 9, 25, 120000)
	end

	local monsterid = monster:GetMonsterID()
	local curstep = player:GetQuest():GetQuestStep(1)
	if curstep == 13 then
		if monsterid == 43 or monsterid == 39 then
			local monssum = player:GetQuest():GetQuestCounter(1)
			if monssum < 50 then
				monssum = monssum + 1
				--monssum = 50
				player:GetQuest():SetQuestCounter(1, monssum)
				player:SendSystemMessage("ɱ��"..monssum.."ֻ����")
				player:SyncQuestData(1)
			end
		end
	end
end

-- CanOpenDoor �Ƿ��ܽ���
function CanOpenDoor(x, y, player)
	if x == 67 and y == 36 then
		if player:GetLevel() < 30 then
			player:SendSystemMessage("һ��ǿ����������㵯��������Ҫ����ǿ����ܽ���")
			return false
		end
	end
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
