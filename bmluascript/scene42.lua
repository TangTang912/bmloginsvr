-- ��ս��ͼ
local sceneref = nil

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	sceneref = scene

	--	�޷��浵
	scene:SetCannotStay()
	scene:SetAutoReset()

	--	����NPC
	scene:CreateNPC(10020, 37, 21)

	--	ע���¼� ��������
	scene:RegisterCallback(SceneEvent_Update, "OnSceneUpdate", 5000)

	scene:GetLuaEngine():LoadModule("module_copy")
	onInitCopy(scene)
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

function OnSceneUpdate(_scene)
	clg_update(_scene)
end

function GetVersion()
end

--	10020
gNPCQuestTable[10020] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10020] =
function(bid, npc, player)
	if bid == 2 then
		--	�뿪
		player:FlyToHome()
		player:HideQuestDlg()
	elseif bid == 3 then
		--	��ʼ��ս
		if clg_isBegin() then
			player:ShowQuestDlg(npc, 0, 2)
		else
			clg_setBegin(true)
			player:ShowQuestDlg(npc, 0, 1)

			--	��ʼ��ս
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



--------------------------------------------------------------
--	�����ص�
function onInitCopy(_scene)
	clg_setScene(_scene)
	clg_setRoundMax(3)
	clg_setRewardFunc(onReward)
	clg_setNextRoundFunc(onNextRound)
	clg_setTimeout(12 * 60)
end

function onReward()
	local maxItems = sceneref:GetPlayerSum()
	--local items = math.random(1, maxItems)
	local items = maxItems / 2
	if items == 0 then
		items = 1
	end

	local rewards = {265, 265, 265, 265, 265, 783, 783,
					783, 783, 117, 783, 864, 865, 866, 265,
					265, 265, 265, 265, 265, 265, 265, 265,
					265, 265, 265, 265, 265, 265, 265, 265,
					265, 265, 265, 265, 265, 265, 265, 265,
					265, 265, 265, 265, 265, 265, 265, 265,
					265, 265, 265, 265, 265, 265, 265, 265,
					265, 265, 265, 265, 265, 265, 265, 265}

	if items > maxItems then
		items = 1
	end

	for i = 1, items do
		local itemid = rewards[math.random(1, #rewards)]
		sceneref:ChallengeSuccess(itemid)
	end

	sceneref:CreateMonster(137, 26, 21)
	sceneref:BroadcastSceneSystemMessage("�򿪲ر�����ȡ����")
end

function onNextRound(_round)
	local playerNum = sceneref:GetPlayerSum()
	local monsAddNum = playerNum / 2

	if sceneref:GetChallengeID() == 1 then
		--	��һ��
		if 1 == _round then
			for i = 1, (4 + monsAddNum) do
				--	ħ������
				sceneref:CreateMonster(83)
			end
			for i = 1, (3 + monsAddNum) do
				--	ħ���Ƽױ�
				sceneref:CreateMonster(84)
			end
			for i = 1, (3 + monsAddNum) do
				--	ħ������
				sceneref:CreateMonster(85)
			end
			sceneref:CreateMonster(86)
		elseif 2 == _round then
			for i = 1, (3 + monsAddNum) do
				--	�ں�
				sceneref:CreateMonster(94)
			end
			for i = 1, (3 + monsAddNum) do
				--	���
				sceneref:CreateMonster(95)
			end
			for i = 1, (1 + monsAddNum) do
				--	���
				sceneref:CreateLeaderMonster(95, 26, 22)
			end
			for i = 1, (1 + monsAddNum) do
				--	�غ�
				sceneref:CreateLeaderMonster(96, 26, 22)
			end
			for i = 1, (1 + monsAddNum) do
				--	�غ�
				sceneref:CreateMonster(96)
			end
			if 3 == monsAddNum then
				sceneref:CreateLeaderMonster(98, 26, 22)
			elseif 2 == monsAddNum or 1 == monsAddNum then
				sceneref:CreateEliteMonster(98, 26, 22)
			else
				sceneref:CreateMonster(98, 26, 22)
			end
		elseif 3 == _round then
			for i = 1, (2 + monsAddNum) do
				--	�׻�
				sceneref:CreateMonster(116)
			end
			for i = 1, (2 + monsAddNum) do
				--	����
				sceneref:CreateEliteMonster(102, 26, 21)
			end
			for i = 1, (2 + monsAddNum) do
				--	����
				sceneref:CreateLeaderMonster(102, 26, 21)
			end
			if 3 == monsAddNum then
				sceneref:CreateLeaderMonster(100, 26, 22)
			elseif 2 == monsAddNum or 1 == monsAddNum then
				sceneref:CreateEliteMonster(100, 26, 22)
			else
				sceneref:CreateMonster(100, 26, 22)
			end
		end
	else
	end
end
