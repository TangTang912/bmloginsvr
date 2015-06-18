--	����Ͽ�ȶ� �ű�

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ����Ͽ��
	scene:CreateDoorEvent(12, 13, 18, 178, 53)
	--	�� ��ħ֮��
	scene:CreateDoorEvent(16, 78, 12, 11, 26)

	scene:CreateMonster(56 , 51, 43, 42, 10, 120000)
	scene:CreateMonster(55 , 51, 43, 42, 10, 120000)
	scene:CreateMonster(54 , 51, 43, 42, 10, 120000)

	--	˫ͷѪħ ��
	scene:CreateMonsterLater(61, 51, 43, 45, 3, 180000)

	--	NPC ����
	scene:CreateNPC(10012, 51, 23)

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
	if monsterid == 61 then
		local step = player:GetQuest():GetQuestStep(51)

		if player:GetLevel() >= 40 and step == 0 then
			local leftbag = player:GetBagEmptySum()
			if leftbag >= 1 then
				if math.random(10) == 1 then
					player:AddItem(14)
					player:GetQuest():SetQuestStep(51, 1)
					player:SyncQuestData(51)
				end
			end
		end
	end

	--[[if step == 2 then
		local counter = player:GetQuest():GetQuestCounter(51)
		--local counter = 49
		if counter <= 49 then
			counter = counter + 1
			player:GetQuest():SetQuestCounter(51, counter)
			player:SyncQuestData(51)
		end
	end]]

end

-- CanOpenDoor �Ƿ��ܽ���
function CanOpenDoor(x, y, player)
	return true
end

function GetVersion()
end



--	NPC
--	10012 ����
gNPCQuestTable[10012] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10012] =
function(bid, npc, player)
	if bid == 2 then
		local step = player:GetQuest():GetQuestStep(51)

		if step == 0 then
			player:ShowQuestDlg(npc, 0, 1)
		elseif step == 1 then
			--	֧�����񴰿�
			player:ShowQuestDlg(npc, 0, 4)
		elseif step == 2 then
			player:ShowQuestDlg(npc, 0, 5)
		end

	elseif bid == 3 then

		local luochacount = player:CountItem(96)
		local luxuecount  = player:CountItem(2)
		local gyqzcount = player:CountItem(59)
		local cjzzcount	= player:CountItem(55)
		local lwjcount = player:CountItem(56)

		if luochacount == 1 and luxuecount == 2 and gyqzcount == 1 and cjzzcount == 1 and lwjcount == 1 then

			player:ClearItem(96, 1)
			player:ClearItem(2, 2)
			player:ClearItem(59, 1)
			player:ClearItem(55, 1)
			player:ClearItem(56, 1)
			player:AddItem(66)
			player:ShowQuestDlg(npc, 0, 2)

		else

			player:ShowQuestDlg(npc, 0, 3)

		end

	elseif bid == 4 then
	--	��Ѫħ֮Ѫ
		local counter = player:CountItem(14)
		if counter == 1 then
			player:GetQuest():SetQuestStep(51, 2)
			player:SyncQuestData(51)
			player:ShowQuestDlg(npc, 0, 5)
			player:GainExp(1000)
			player:ClearItem(14, 1)
		else
			player:ShowQuestDlg(npc, 0, 8)
		end

	elseif bid == 5 then
	--	�Ƿ��������
		local counter = player:GetQuest():GetQuestCounter(51)
		local items = player:CountItem(129)

		--MirLog("counter:"..counter.."items"..items)

		if items == 1 then
			player:ShowQuestDlg(npc, 0, 6)
			player:GetQuest():SetQuestStep(51, 0)
			player:GetQuest():SetQuestCounter(51, 0)
			player:SyncQuestData(51)
			player:ClearItem(129, 1)
			player:GainExp(250000)
			player:AddMoney(150000)
		else
			player:ShowQuestDlg(npc, 0, 7)
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
