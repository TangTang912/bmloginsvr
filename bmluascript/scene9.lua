--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
--	����һ��ű�
function OnMapLoaded(scene)
	--	�� ͨ����ħ��½
	scene:CreateDoorEvent(8, 16, 29, 204, 22)
	--	�� ͨ�����ζ���
	scene:CreateDoorEvent(10, 31, 8, 33, 56)

	--	ˢ����
	scene:CreateMonster(39, 17, 17, 5, 4, 50000)
	scene:CreateMonster(40, 17, 17, 5, 4, 50000)
	scene:CreateMonster(41, 17, 17, 5, 4, 50000)
	scene:CreateMonster(42, 17, 17, 5, 4, 50000)
	scene:CreateMonster(43, 17, 17, 5, 4, 50000)

	scene:CreateMonster(39, 30, 20, 70, 4, 40000)
	scene:CreateMonster(40, 30, 20, 70, 4, 40000)
	scene:CreateMonster(41, 30, 20, 70, 4, 40000)
	scene:CreateMonster(42, 30, 20, 70, 4, 40000)
	scene:CreateMonster(43, 30, 20, 70, 4, 40000)

	scene:CreateMonsterLater(44, 23, 9, 2, 1, 120000)
	scene:CreateMonsterLater(44, 27, 27, 2, 1, 120000)
	--scene:CreateMonster(18, 17, 17)
	--scene:CreateMonster(48, 18, 17)
	--scene:CreateMonster(50, 17, 18)

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
