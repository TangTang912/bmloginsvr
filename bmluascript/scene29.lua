-- ��֮����

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)

	--	�� ��ħ��½
	--scene:CreateDoorEvent(8, 18, 56, 130,123)
	--	�� ��������
	scene:CreateDoorEvent(30, 18, 56, 29, 478)
	--	NPC ���֮��
	scene:CreateNPC(10018, 429, 28)

	scene:CreateMonster(113, 225, 225, 225, 20, 6000)
	scene:CreateMonster(109, 225, 225, 225, 15, 6000)
	scene:CreateMonster(110, 225, 225, 225, 15, 6000)
	scene:CreateMonster(107, 225, 225, 225, 15, 6000)
	--scene:CreateMonster(113, 339, 298, 100, 20, 6000)
	--scene:CreateMonster(109, 200, 275, 100, 20, 6000)
	--scene:CreateMonster(110, 84, 300, 100, 20, 6000)
	scene:CreateMonsterLater(103, 116, 115, 2, 1, 6000)
	scene:CreateMonsterLater(103, 397, 286, 2, 1, 6000)
	scene:CreateMonsterLater(111, 210, 210, 2, 1, 6000)

	scene:SetAutoReset()
	--scene:SetCannotStay()

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




--	10018 ���֮��
gNPCQuestTable[10018] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10018] =
function(bid, npc, player)
	if bid == 3 then
		player:FlyToMap(115, 115, 8)
		player:HideQuestDlg()
	elseif bid == 2 then
		local lv = player:GetLevel()
		if lv < 55 then
			player:ShowQuestDlg(npc, 0, 1)
		else
			--player:ShowQuestDlg(npc, 0, 2)
			local bstep2 = player:GetQuest():GetQuestStep(52)
			if bstep2 == 0 then
				player:ShowQuestDlg(npc, 0, 2)
			elseif bstep2 == 1 then
				player:ShowQuestDlg(npc, 0, 3)
			end
		end
	elseif bid == 5 then
		player:GetQuest():SetQuestStep(52, 1)
		player:SyncQuestData(52)
		player:ShowQuestDlg(npc, 0, 3)
	elseif bid == 4 then
		local item1 = player:CountItem(784)
		local item2 = player:CountItem(785)
		local item3 = player:CountItem(786)
		local item4 = player:CountItem(787)
		local item5 = player:CountItem(788)
		local item6 = player:CountItem(789)
		local item7 = player:CountItem(790)

		if item1 >= 1 and item2 >= 1 and item3 >= 1 and item4 >= 1 and item5 >= 1 and item6 >= 1 and item7 >= 1 then
			player:ShowQuestDlg(npc, 0, 4)
			player:GetQuest():SetQuestStep(52, 0)
			player:ClearItem(784, 1)
			player:ClearItem(785, 1)
			player:ClearItem(786, 1)
			player:ClearItem(787, 1)
			player:ClearItem(788, 1)
			player:ClearItem(789, 1)
			player:ClearItem(790, 1)
			player:AddItem(1229)
			player:AddItem(1229)
			player:AddItem(1031)
			--player:AddItem(1229)
			--player:AddItem(117)
			player:AddItem(265)
			player:AddItem(265)
			player:AddItem(265)
			player:AddItem(265)
			player:AddItem(265)
			player:AddItem(265)
		else
			player:ShowQuestDlg(npc, 0, 5)
		end
	else
		player:ShowQuestDlg(npc, 0, 1)
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
