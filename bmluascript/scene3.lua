--	���˹�Ĺ����ű��ļ�

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	���˹�Ĺһ����
	scene:CreateDoorEvent(2, 37, 82, 86, 14)
	--	���������
	scene:CreateDoorEvent(5, 35, 17, 60, 61)
	--	NPCС��
	scene:CreateNPC(10002, 11, 35)

	--	��ʼ������
	scene:CreateMonster(4, 50, 50, 20, 5, 60000)
	scene:CreateMonster(6, 50, 50, 20, 5, 60000)
	scene:CreateMonster(7, 50, 50, 20, 5, 60000)
	scene:CreateMonster(9, 50, 50, 20, 4, 60000)

end

--2���ӵ���һ�� �������³�����Ϣ
function OnUpdateScene(scene)

end


function GetVersion()
end

--NPC����
gNPCQuestTable = {}
gNPCButtonTable = {}

-- CanOpenDoor �Ƿ��ܽ���
function CanOpenDoor(x, y, player)
	if x == 35 and y == 17 then
		local itemcount = player:CountItem(277)
		if itemcount > 0 then
			player:ClearItem(277, 1)
			return true
		else
			player:SendSystemMessage("û��������������޷�����")
			return false
		end
	end

	return true
end


-- NPC С��
gNPCQuestTable[10002] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10002] =
function(bid, npc, player)
	if bid == 2 then
		local curstep = player:GetQuest():GetQuestStep(0)
		if curstep == 25 then
			player:GetQuest():SetQuestStep(0, 26)
			player:ShowQuestDlg(npc, 0, 1)
			player:SyncQuestData(0)
		else
			player:ShowQuestDlg(npc, 0, 2)
		end

	end
end





function OnMonsterDead(monster, player)
	local monsterid = monster:GetMonsterID()

	if player:GetQuest():GetQuestStep(1) == 8 and monsterid == 9 then
		--if player:GetLocateScene():IsItemInGround(736, 33, 16) then
			--player:GetLocateScene():RemoveGroundItem(736, 33, 16)
			player:GetQuest():SetQuestStep(1, 9)
			player:SendSystemMessage("���������")
			player:SyncQuestData(1)
		--end
	end

	if player:GetQuest():GetQuestStep(1) >= 11 and monsterid == 9 then
		local emptybag = player:GetBagEmptySum()
		if emptybag >= 1 then
			if math.random(2) == 1 then
				player:AddItem(277)
			end
		end
	end

	if player:GetQuest():GetQuestStep(1) == 19 and monsterid == 9 then
		local emptybag = player:GetBagEmptySum()
		if emptybag >= 1 then
			if math.random(3) == 1 then
				player:AddItem(625)
			end
		end
	end

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
