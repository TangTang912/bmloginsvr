--	�������һ��ű�
--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���

function OnMapLoaded(scene)
	--	���ö��������
	scene:CreateDoorEvent(3, 60, 61, 35, 17)
	--	ͨ��������
	scene:CreateDoorEvent(6, 12, 31, 14, 20)
	--	����սʿ
	scene:CreateMonster(30, 50, 50, 50, 12, 60000)
	--	��������
	scene:CreateMonster(31, 50, 50, 50, 6, 120000)
	--	������ʿ
	scene:CreateMonster(32, 50, 50, 50, 8, 120000)
	--	����ս��
	scene:CreateMonster(33, 50, 50, 50, 8, 120000)
	--	�������
	--scene:CreateMonsterLater(34, 16, 38, 1, 1, 180000)
	--	���껤��
	scene:CreateMonsterLater(35, 41, 53, 1, 1, 160000)

	--	��������
	scene:CreateNPC(10007, 65, 50)
	--	�Զ����ù���HP
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

function InitNPC(npcid, npc)

	if npcid == 10007 then
		npc:ClearAllSellItem()
		npc:AddSellItem(402)
		npc:AddSellItem(165)
		npc:AddSellItem(163)
		npc:AddSellItem(161)
		npc:AddSellItem(62)
		npc:AddSellItem(63)
		npc:AddSellItem(64)
		npc:AddSellItem(82)
		npc:AddSellItem(83)
		npc:AddSellItem(84)
		npc:AddSellItem(47)
		npc:AddSellItem(49)
		npc:AddSellItem(37)
		npc:AddSellItem(278)
		npc:AddSellItem(396)
		npc:AddSellItem(400)
	end

end






--	10007	��������
gNPCQuestTable[10007] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10007] =
function(bid, npc, player)
	if bid == 3 then
		--[[npc:ClearAllSellItem()
		npc:AddSellItem(403)
		npc:AddSellItem(165)
		npc:AddSellItem(163)
		npc:AddSellItem(161)
		npc:AddSellItem(62)
		npc:AddSellItem(63)
		npc:AddSellItem(64)
		npc:AddSellItem(82)
		npc:AddSellItem(83)
		npc:AddSellItem(84)
		npc:AddSellItem(47)
		npc:AddSellItem(49)
		npc:AddSellItem(37)
		npc:AddSellItem(278)]]
		player:ShowShopDlg(npc, 1)
		player:HideQuestDlg()

	elseif bid == 2 then
		player:ShowQuestDlg(npc, 0, 1)

	elseif bid == 4 then
		player:ShowQuestDlg(npc, 0, 2)

	elseif bid == 5 then
		local itemcount = player:CountItem(412)
		if itemcount >= 10 then
			player:ClearItem(412, 10)
			player:AddItem(41)
			player:ShowQuestDlg(npc, 0, 4)
		else
			player:ShowQuestDlg(npc, 0, 3)
		end

	elseif bid == 6 then
		local itemcount = player:CountItem(412)
		if itemcount >= 10 then
			player:ClearItem(412, 10)
			player:AddItem(42)
			player:ShowQuestDlg(npc, 0, 4)
		else
			player:ShowQuestDlg(npc, 0, 3)
		end

	elseif bid == 7 then
		local itemcount = player:CountItem(412)
		if itemcount >= 10 then
			player:ClearItem(412, 10)
			player:AddItem(38)
			player:ShowQuestDlg(npc, 0, 4)
		else
			player:ShowQuestDlg(npc, 0, 3)
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
