--��Ҥ�ű�
--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	����ѧ��
	scene:CreateNPC(10005, 13, 50)

	--	�� ����Ͽ��
	scene:CreateDoorEvent(12, 134, 20, 46, 189)

	--	��ʬ
	scene:CreateMonster(23, 38, 28, 50, 10, 60000)
	scene:CreateMonster(24, 38, 28, 50, 10, 60000)
	scene:CreateMonster(25, 38, 28, 50, 10, 60000)
	scene:CreateMonster(26, 38, 28, 50, 10, 60000)
	scene:CreateMonster(23, 102, 88, 50, 10, 60000)
	scene:CreateMonster(24, 102, 88, 50, 10, 60000)
	scene:CreateMonster(25, 102, 88, 50, 10, 60000)
	scene:CreateMonster(26, 102, 88, 50, 10, 60000)
	scene:CreateMonster(23, 65, 104, 50, 10, 60000)
	scene:CreateMonster(24, 65, 104, 50, 10, 60000)
	scene:CreateMonster(25, 65, 104, 50, 10, 60000)
	scene:CreateMonster(26, 65, 104, 50, 10, 60000)

	scene:CreateMonster(27, 122, 56, 5, 1, 120000)
	scene:CreateMonster(27, 102, 132, 5, 1, 120000)
	scene:CreateMonster(27, 109, 27, 5, 1, 120000)
	scene:CreateMonster(27, 26, 102, 5, 1, 120000)
	scene:CreateMonster(27, 38, 28, 5, 1, 120000)
	scene:CreateMonster(27, 102, 88, 5, 1, 120000)
	scene:CreateMonster(27, 49, 88, 5, 1, 120000)

	scene:CreateMonster(127, 102, 88, 80, 1, 60000)

end

--2���ӵ���һ�� �������³�����Ϣ
function OnUpdateScene(scene)

end

function GetVersion()
end

-- CanOpenDoor �Ƿ��ܽ���
function CanOpenDoor(x, y, player)
	if x == 134 and y == 20 then
		local curstep = player:GetQuest():GetQuestStep(1)

		if curstep >= 17 then
			return true
		else
			player:SendSystemMessage("���µķ�ӡ֮�أ��޷�����")
			return false
		end
	else
		return true
	end
end

--NPC���� function(npc, player)
gNPCQuestTable = {}
--NPC��ť��� function(bid, npc, player)
gNPCButtonTable = {}


-- OnMonsterDead ���������ص�
function OnMonsterDead(monster, player)
	local curstep = player:GetQuest():GetQuestStep(50)
	local mainstep = player:GetQuest():GetQuestStep(1)
	local monsterid = monster:GetMonsterID()

	if monster:GetMonsterID() == 127 then
		local posX = monster:GetCoordXInt()
		local posY = monster:GetCoordYInt()
		player:GetLocateScene():CreateDoorEventWithNotification(35, posX, posY, 15, 13, 2 * 60 * 1000)
	end

	if monsterid == 23 or monsterid == 24 or monsterid == 25 or monsterid == 26 then
		if curstep == 1 then
			local itemsum = player:CountItem(75)
			local emptybag = player:GetBagEmptySum()
			if math.random(4) >= 0 and itemsum == 0 and emptybag > 0 then
				player:AddItem(75)
				player:SendSystemMessage("�������")
			end
		elseif curstep == 3 then
			local qstcounter = player:GetQuest():GetQuestCounter(50)
			if qstcounter < 20 then
				qstcounter = qstcounter + 1
				player:GetQuest():SetQuestCounter(50, qstcounter)
				player:SendSystemMessage("ɱ��"..qstcounter.."ֻ��ʬ")
				if qstcounter == 20 then
					player:SendSystemMessage("�������")
					player:GetQuest():SetQuestStep(50, 4)
					player:GetQuest():SetQuestCounter(50, 0)
				end
				player:SyncQuestData(50)
			end
		end

		if mainstep == 10 then
			local emptybag = player:GetBagEmptySum()
			if math.random(20) == 1 and emptybag > 0 then
				player:AddItem(78)
				player:SendSystemMessage("�������")
			end
		end
	end

	if player:GetQuest():GetQuestStep(1) == 19 and monsterid == 27 then
		local emptybag = player:GetBagEmptySum()
		if emptybag >= 1 then
			if math.random(3) == 1 then
				player:AddItem(626)
			end
		end
	end

end

---------------------------------------------------------
--	֧�������50��ʼ
---------------------------------------------------------
--	����ѧ��
gNPCQuestTable[10005] =
function(npc, player)
	local curstep = player:GetQuest():GetQuestStep(1)
	if curstep == 15 then
		local itemcount = player:CountItem(855)
		if itemcount > 0 then
			player:ClearItem(855, itemcount)
			player:AddItem(863)
			player:GainExp(20000)
			player:AddMoney(2000)
			player:ShowQuestDlg(npc, 0, 10)
			player:GetQuest():SetQuestStep(1, 16)
			player:SyncQuestData(1)
		else
			player:ShowQuestDlg(npc, 0, 0)
		end
	else
		player:ShowQuestDlg(npc, 0, 0)
	end
end

gNPCButtonTable[10005] =
function(bid, npc, player)
	if bid == 2 then
		player:FlyToMap(55, 55, 1)
		player:HideQuestDlg()

	elseif bid == 3 then
		local curstep = player:GetQuest():GetQuestStep(50)
		if curstep == 0 then
			local curlevel = player:GetLevel()
			if curlevel >= 15 then
				player:ShowQuestDlg(npc, 0, 1)
			else
				player:ShowQuestDlg(npc, 0, 3)
			end

		elseif curstep == 1 then
			player:ShowQuestDlg(npc, 0, 2)

		elseif curstep == 2 then
			player:ShowQuestDlg(npc, 0, 6)

		elseif curstep == 3 then
			player:ShowQuestDlg(npc, 0, 7)

		elseif curstep == 4 then
			player:ShowQuestDlg(npc, 0, 8)

		elseif curstep == 5 then
			player:ShowQuestDlg(npc, 0, 9)

		else
			player:ShowQuestDlg(npc, 0, 100)

		end

	elseif bid == 4 then
		player:GetQuest():SetQuestStep(50, 1)
		player:SyncQuestData(50)
		player:ShowQuestDlg(npc, 0, 2)

	elseif bid == 5 then
		local itemcount = player:CountItem(75)
		if itemcount == 0 then
			player:ShowQuestDlg(npc, 0, 4)
		else
			player:ClearItem(75, itemcount)
			player:GetQuest():SetQuestStep(50, 2)
			player:SyncQuestData(50)
			player:ShowQuestDlg(npc, 0, 5)
			player:GainExp(3000)
			player:AddMoney(5000)

		end

	elseif bid == 6 then
		player:ShowQuestDlg(npc, 0, 7)
		player:GetQuest():SetQuestStep(50, 3)
		player:SyncQuestData(50)

	elseif bid == 7 then
		player:GetQuest():SetQuestStep(50, 5)
		player:ShowQuestDlg(npc, 0, 9)
		player:GainExp(4000)
		player:AddMoney(5000)

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
