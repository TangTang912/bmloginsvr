--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
--	��ħ��½�ű�
function OnMapLoaded(scene)
	-- �� ����ͨ��
	scene:CreateDoorEvent(7, 17, 27, 188, 186)
	--	�� ����һ��
	scene:CreateDoorEvent(9, 204, 22, 16, 29)
	--	�� ħ����
	scene:CreateDoorEvent(22, 239, 298, 49, 12)
	--	�� �ʹ�
	scene:CreateDoorEvent(39, 95, 95, 12, 43)

	--	�� ��ħ�ܵ�
	--	���� ��ħ����
	scene:CreateMonster(74, 184, 232, 0, 1, 300000)

	--	���� ��ʬϵ��
	scene:CreateMonster(23, 123, 123, 100, 5, 2 * 60 * 1000)
	scene:CreateMonster(24, 123, 123, 100, 5, 2 * 60 * 1000)
	scene:CreateMonster(25, 123, 123, 100, 5, 2 * 60 * 1000)
	scene:CreateMonster(26, 123, 123, 100, 5, 2 * 60 * 1000)
	scene:CreateMonster(126, 123, 123, 100, 5, 2 * 60 * 1000)
	scene:CreateMonster(4, 123, 123, 100, 5, 2 * 60 * 1000)
	scene:CreateMonster(6, 123, 123, 100, 5, 2 * 60 * 1000)
	scene:CreateMonster(7, 123, 123, 100, 5, 2 * 60 * 1000)

	--	��ħ����
	scene:CreateNPC(10008, 121, 140)
	--	��ħ����
	--scene:CreateNPC(10009, 95, 96)
	scene:CreateNPC(10009, 94, 90)
	--	�ֿ��ϰ�
	scene:CreateNPC(10011, 123, 86)
	--	��ӡ��Ӣ��
	scene:CreateNPC(10017, 111, 113)

	--	���ó�������
	scene:SetCityRange(67, 65, 98, 107, 122, 118)
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
	if monster:GetMonsterID() == 74 then
		player:GetLocateScene():CreateDoorEventWithNotification(20, 184, 232, 111, 109, 120000)
	end
end

-- CanOpenDoor �Ƿ��ܽ���
function CanOpenDoor(x, y, player)
	if x == 239 and y == 298 then
		if player:GetLevel() < 40 then
			player:SendSystemMessage("�ȼ�Ҫ��:40")
			return false
		end
	end

	return true
end

function GetVersion()
end


function InitNPC(npcid, npc)
	if npcid == 10008 then

		npc:ClearAllSellItem()
		--npc:AddSellItem(313)
		--npc:AddSellItem(314)
		npc:AddSellItem(16)
		npc:AddSellItem(312)
		--npc:AddSellItem(403)
		--npc:AddSellItem(405)
		--npc:AddSellItem(1007)
		npc:AddSellItem(278)
		npc:AddSellItem(28)
		npc:AddSellItem(29)
		npc:AddSellItem(404)
		npc:AddSellItem(402)
		npc:AddSellItem(813)
		npc:AddSellItem(814)
	end
end







--	10008 ��ħ����
gNPCQuestTable[10008] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10008] =
function(bid, npc, player)
	if bid == 2 then
		--[[npc:ClearAllSellItem()
		npc:AddSellItem(313)
		npc:AddSellItem(314)
		npc:AddSellItem(16)
		npc:AddSellItem(312)
		npc:AddSellItem(403)
		npc:AddSellItem(405)]]
		player:ShowShopDlg(npc, 1)
		player:HideQuestDlg()
	end
end

--	10011 �ֿ��ϰ�
gNPCQuestTable[10011] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10011] =
function(bid, npc, player)
	if bid == 2 then
		local money = player:GetMoney()
		if money > 500 then
			player:MinusMoney(500)
			player:HideQuestDlg()
			player:ShowShopDlg(npc, 2)
		else
			player:ShowQuestDlg(npc, 0, 1)
		end

	end
end


--	10017 �����Ӣ��
gNPCQuestTable[10017] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10017] =
function(bid, npc, player)
	if bid == 3 then
		local step = player:GetQuest():GetQuestStep(1)
		if step >= 25 then
			player:ShowQuestDlg(npc, 0, 4)
		else
			player:ShowQuestDlg(npc, 0, 1)
		end
	elseif bid == 2 then
		local step = player:GetQuest():GetQuestStep(1)
		if step == 24 then
			local items = player:CountItem(1224)
			if items == 1 then
				player:ClearItem(1224, 1)
				player:GetQuest():SetQuestStep(1, 25)
				player:SyncQuestData(1)
				player:GainExp(10000)
				player:ShowQuestDlg(npc, 0, 3)
			else
				player:ShowQuestDlg(npc, 0, 2)
			end
		else
			player:ShowQuestDlg(npc, 0, 2)
		end
	elseif bid == 4 then
		local step = player:GetQuest():GetQuestStep(1)
		if step >= 25 then
			player:FlyToMap(426, 30, 29)
			player:HideQuestDlg()
		end
	else
		player:ShowQuestDlg(npc, 0, 2)
	end
end



--	10009 ��ħ����
gNPCQuestTable[10009] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10009] =
function(bid, npc, player)
	local curstep = player:GetQuest():GetQuestStep(1)

	if bid == 2 then
		if curstep == 12 then
			player:ShowQuestDlg(npc, 0, 2)

		elseif curstep == 13 then
			player:ShowQuestDlg(npc, 0, 4)

		elseif curstep == 14 then
			player:ShowQuestDlg(npc, 0, 6)

		elseif curstep == 15 then
			player:ShowQuestDlg(npc, 0, 7)

		elseif curstep == 16 then
			local itemcount = player:CountItem(863)
			if itemcount > 0 then
				player:ClearItem(863, itemcount)
				player:GetQuest():SetQuestStep(1, 17)
				player:SyncQuestData(1)
				player:ShowQuestDlg(npc, 0, 9)
				player:GainExp(20000)
			else
				player:ShowQuestDlg(npc, 0, 7)
			end

		elseif curstep == 17 then
			player:ShowQuestDlg(npc, 0, 9)

		elseif curstep == 18 then
			player:ShowQuestDlg(npc, 0, 10)

		elseif curstep == 19 then
			player:ShowQuestDlg(npc, 0, 12)

		elseif curstep == 20 then
			player:ShowQuestDlg(npc, 0, 13)

		elseif curstep == 21 then
			player:ShowQuestDlg(npc, 0, 15)

		else
			player:ShowQuestDlg(npc, 0, 1)
		end

	--	������ѫ��
	elseif bid == 3 then
		local itemcount = player:CountItem(410)
		if itemcount > 0 then
			player:AddItem(411)
			player:GetQuest():SetQuestStep(1, 13)
			player:SyncQuestData(1)
			player:ShowQuestDlg(npc, 0, 4)
			player:ClearItem(410, 1)
		else
			player:ShowQuestDlg(npc, 0, 3)
		end

	--	�Ƿ�ɱ50ֻ���
	elseif bid == 4 then
		local monscount = player:GetQuest():GetQuestCounter(1)
		if monscount >= 50 then
			player:ShowQuestDlg(npc, 0, 6)
			player:GetQuest():SetQuestCounter(1, 0)
			player:GetQuest():SetQuestStep(1, 14)
			player:SyncQuestData(1)
			player:GainExp(50000)
		else
			player:ShowQuestDlg(npc, 0, 5)
		end

	--	����
	elseif bid == 5 then
		if curstep >= 14 then
			player:ShowQuestDlg(npc, 0, 100)
		else
			player:ShowQuestDlg(npc, 0, 101)
		end

	--	�õ���ħ����
	elseif bid == 6 then
		local itemcount = player:CountItem(855)
		if itemcount > 0 then
			player:ShowQuestDlg(npc, 0, 7)
			player:GainExp(80000)
			player:AddMoney(10000)
			player:GetQuest():SetQuestStep(1, 15)
			player:SyncQuestData(1)
		else
			player:ShowQuestDlg(npc, 0, 8)
		end

	--	�õ��綾��˿
	elseif bid == 8 then
		local itemcount = player:CountItem(854)
		if itemcount >= 5 then
			player:GainExp(80000)
			player:AddMoney(10000)
			player:GetQuest():SetQuestStep(1, 18)
			player:SyncQuestData(1)
			player:ShowQuestDlg(npc, 0, 10)
			player:ClearItem(854, itemcount)
		else
			player:ShowQuestDlg(npc, 0, 11)
		end

	--	�õ��˶���ħ��
	elseif bid == 9 then
		local itemcount = player:CountItem(858)
		if itemcount == 1 then
			player:GainExp(30000)
			player:AddMoney(5000)
			player:GetQuest():SetQuestStep(1, 19)
			player:SyncQuestData(1)
			player:ShowQuestDlg(npc, 0, 12)
		else
			player:ShowQuestDlg(npc, 0, 11)
		end

	--	�ϳ����Ϲ�����
	elseif bid == 10 then
		local itemcount = player:CountItem(1108)
		if itemcount == 1 then
			player:ClearItem(1108, itemcount)
			player:GainExp(150000)
			player:AddMoney(20000)
			player:AddItem(420)
			player:ShowQuestDlg(npc, 0, 13)
			player:GetQuest():SetQuestStep(1, 20)
			player:SyncQuestData(1)
		else
			player:ShowQuestDlg(npc, 0, 14)

		end

	--	�õ��˺�ɫ��ë
	elseif bid == 11 then
		local itemcount = player:CountItem(690)
		if itemcount == 1 then
			player:GetQuest():SetQuestStep(1, 21)
			player:SyncQuestData(1)
			player:ShowQuestDlg(npc, 0, 15)
			player:GainExp(150000)
			player:AddMoney(20000)
		else
			player:ShowQuestDlg(npc, 0, 16)
			local itemcount = player:CountItem(420)
			if itemcount == 0 then
				player:AddItem(420)
			end
		end

	elseif bid == 7 then
		if curstep >= 14 then
			player:FlyToMap(71, 32, 11)
			player:HideQuestDlg()
		end

	--	��������
	elseif bid == 50 then
		player:ShowQuestDlg(npc, 1, 0)
	elseif bid == 51 then
		if player:IsTeamLeader() then
		else
			local insid = 100
			local pinsmap = GameSceneManager:GetInstance():GetFreeInstanceScene(insid)
			if pinsmap ~= nil then
				if player:FlyToInstanceMap(20, 20, pinsmap) then
					player:TeamMateFlyToInstanceMap(20, 20, pinsmap)
				end
			end

			player:HideQuestDlg()
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
