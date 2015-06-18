--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�����
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))
	--	��ϼ����
	scene:CreateDoorEvent(0, 200, 252, 7, 6)
	--	���˹�Ĺ��
	scene:CreateDoorEvent(2, 268, 107, 18, 101)
	--	���ϲ�
	scene:CreateNPC(10004, 54, 53)

	--scene:CreateGroundItem(257, 55, 53)

	--	��ʼ������
	--	������
	scene:CreateMonster(13, 192, 240, 10, 5, 60000)
	--	�๳è����è
	scene:CreateMonster(2, 117, 240, 10, 5, 60000)
	scene:CreateMonster(8, 117, 247, 10, 5, 60000)
	--	������ʿ
	scene:CreateMonster(10, 53, 187, 30, 5, 120000)
	--	����սʿ
	scene:CreateMonster(28, 80, 80, 15, 5, 120000)

	--	��ǳ�
	scene:CreateMonster(77, 233, 91, 60, 10, 60000)
	--	300��ǳ�
	scene:CreateMonsterLater(76, 209, 135, 50, 6, 120000)
	--	900��ǳ�
	scene:CreateMonsterLater(75, 172, 71, 80, 3, 120000)
	--scene:CreateMonsterLater(75, 234, 72, 5, 1, 120000)
	--scene:CreateMonsterLater(75, 234, 72, 5, 1, 120000)

end

--2���ӵ���һ�� �������³�����Ϣ
function OnUpdateScene(scene)

end

function GetVersion()
end

-- CanOpenDoor �Ƿ��ܽ���
function CanOpenDoor(x, y, player)
	return true
end

--NPC����
gNPCQuestTable = {}
gNPCButtonTable = {}



--	10004 ���ϲ�
gNPCQuestTable[10004] =
function(npc, player)
	local curstep = player:GetQuest():GetQuestStep(1)
	player:ShowQuestDlg(npc, 0, 0)

end

gNPCButtonTable[10004] =
function(bid, npc, player)

	local curstep = player:GetQuest():GetQuestStep(1)

	if bid == 2 then
		local itemsum = player:CountItem(257)
		if curstep == 5 then
			if itemsum == 1 then
				player:ClearItem(257, itemsum)
				player:GetQuest():SetQuestStep(1, 6)
				player:ShowQuestDlg(npc, 0, 2)
				player:GainExp(1500)
				player:SyncQuestData(1)
			else
				player:ShowQuestDlg(npc, 0, 1)
			end
		elseif curstep == 7 then
			--local itemsum = player:CountItem(736)
			--if itemsum == 0 then
			--	player:AddItem(736)
			--end
			player:ShowQuestDlg(npc, 0, 3)
			player:GetQuest():SetQuestStep(1, 8)
			player:SyncQuestData(1)

		elseif curstep == 8 then
			--local itemsum = player:CountItem(736)
			--if itemsum == 0 then
				--player:AddItem(736)
			--end
			player:ShowQuestDlg(npc, 0, 4)

		elseif curstep == 9 then
			player:ShowQuestDlg(npc, 0, 5)

		elseif curstep == 10 then
			player:ShowQuestDlg(npc, 0, 6)

		elseif curstep == 11 then
			player:ShowQuestDlg(npc, 0, 8)

		else
			player:ShowQuestDlg(npc, 0, 1)
		end

	elseif bid == 3 then
		local emptybag = player:GetBagEmptySum()
		if emptybag >= 2 then
			player:GainExp(1500)
			player:AddMoney(5000)
			player:ShowQuestDlg(npc, 0, 6)
			player:GetQuest():SetQuestStep(1, 10)
			player:SyncQuestData(1)

			if player:GetHeroSex() == 1 then
				player:AddItem(61)
			elseif player:GetHeroSex() == 2 then
				player:AddItem(81)
			end

			if player:GetHeroJob() == 0 then
				player:AddItem(44)
			elseif player:GetHeroJob() == 1 then
				player:AddItem(39)
			elseif player:GetHeroJob() == 2 then
				player:AddItem(46)
			end

		else
			player:ShowQuestDlg(npc, 0, 7)
		end

	elseif bid == 4 then
		local itemcount = player:CountItem(78)
		if itemcount > 0 then
			player:ClearItem(78, itemcount)
			player:AddItem(277)
			player:GetQuest():SetQuestStep(1, 11)
			player:SyncQuestData(1)
			player:ShowQuestDlg(npc, 0, 8)
		else
			player:ShowQuestDlg(npc, 0, 9)
		end

	elseif bid == 5 then
		local itemcount = player:CountItem(410)
		if itemcount > 0 then
			--player:ClearItem(410, itemcount)
			player:GetQuest():SetQuestStep(1, 12)
			player:SyncQuestData(1)
			player:ShowQuestDlg(npc, 0, 11)
			player:GainExp(50000)
			player:AddMoney(10000)
		else
			player:ShowQuestDlg(npc, 0, 10)
		end


	elseif bid == 111 then
		if curstep >= 9 then
			player:ShowQuestDlg(npc, 0, 111)
		else
			player:ShowQuestDlg(npc, 0, 255)
		end

	elseif bid == 112 then
		local money = player:GetMoney()
		if money < 2000 then
			player:ShowQuestDlg(npc, 0, 254)
		else
			player:MinusMoney(2)
			player:FlyToMap(12, 51, 4)
			player:HideQuestDlg()
		end
	end

end







-- OnMonsterDead
function OnMonsterDead(monster, player)
	local monsterid = monster:GetMonsterID()

	if player:GetQuest():GetQuestStep(0) == 11 and monsterid == 13 then
		local curcounter = player:GetQuest():GetQuestCounter(0)
			if curcounter < 9 then
				curcounter = curcounter + 1
				player:GetQuest():SetQuestCounter(0, curcounter)
				player:SendSystemMessage("������Ϣ:ɱ��"..curcounter.."��������")
				player:SyncQuestData(0)
			elseif curcounter == 9 then
				player:GetQuest():SetQuestCounter(0, curcounter + 1)
				player:SendSystemMessage("������Ϣ:�������")
				player:SyncQuestData(0)
			end

	elseif player:GetQuest():GetQuestStep(0) == 14 and (monsterid == 2 or monsterid == 8) then
		local curcounter = player:GetQuest():GetQuestCounter(0)
			if curcounter < 9 then
				curcounter = curcounter + 1
				player:GetQuest():SetQuestCounter(0, curcounter)
				player:SendSystemMessage("������Ϣ:ɱ��"..curcounter.."ֻ����")
				player:SyncQuestData(0)
			elseif curcounter == 9 then
				player:GetQuest():SetQuestCounter(0, curcounter + 1)
				player:SendSystemMessage("������Ϣ:�������")
				player:SyncQuestData(0)
			end
	elseif player:GetQuest():GetQuestStep(1) == 2 and monsterid == 28 then
		local bagsum = player:CountItem(1093)
		if bagsum == 0 then
			local empty = player:GetBagEmptySum()
			if empty >= 1 then
				if math.random(4) >= 0 then
					player:AddItem(1093)
				end
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
