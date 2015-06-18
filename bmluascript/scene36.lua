-- ħ��֮��

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� �����
	scene:CreateDoorEvent(37, 19, 20, 13, 32)

	--	�����
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))

	--	�޷��浵
	scene:SetCannotStay()
	scene:SetAutoReset()

	--	��ħ����
	scene:CreateNPC(10019, 17, 23)

	--	���� ��֮������
	scene:CreateMonsterLater(47, 50, 50, 50, 15, 3 * 60 * 1000)
	--	��֮����
	scene:CreateMonsterLater(48, 50, 50, 50, 10, 3 * 60 * 1000)
	--	��֮��ʿ
	scene:CreateMonsterLater(50, 50, 50, 50, 10, 3 * 60 * 1000)
	--	��֮����
	scene:CreateMonsterLater(129, 50, 50, 50, 1, 4 * 60 * 1000)
	--	qi e
	scene:CreateMonsterLater(128, 50, 50, 50, 15, 2 * 60 * 1000)
	--	С��
	scene:CreateMonsterLater(38, 50, 50, 50, 5, 3 * 60 * 1000)
	--	��֮��ħ����
	scene:CreateMonsterLater(130, 50, 50, 50, 1, 8 * 60 * 1000)

	--	ע���¼� ��ҽ���
	scene:RegisterCallback(SceneEvent_PlayerEnter, "OnPlayerEnterScene", 0)

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

function OnPlayerEnterScene(scene, player)
	player:SendSystemMessage("��ħ��½��Ȼ��������а��ĵط�����ʿС����")
end

function GetVersion()
end

function InitNPC(npcid, npc)

	if npcid == 10019 then
		npc:ClearAllSellItem()
		npc:AddSellItem(402)
		npc:AddSellItem(404)
		npc:AddSellItem(260)
		npc:AddSellItem(28)
		npc:AddSellItem(29)
		--npc:AddSellItem(393)
		npc:AddSellItem(550)
		npc:AddSellItem(551)
		npc:AddSellItem(560)
		npc:AddSellItem(561)
	end

end

--	10007	��������
gNPCQuestTable[10019] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10019] =
function(bid, npc, player)
	if bid == 3 then
		player:ShowShopDlg(npc, 1)
		player:HideQuestDlg()
	elseif bid == 2 then
		local money = player:GetMoney()
		if money > 10000 then
			player:MinusMoney(10000)
			player:HideQuestDlg()
			player:ShowShopDlg(npc, 2)
		else
			player:ShowQuestDlg(npc, 0, 1)
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
