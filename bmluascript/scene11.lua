--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
--	������ű�
function OnMapLoaded(scene)
	--	�� ��ħ��½
	scene:CreateDoorEvent(8, 71, 32, 209, 218)

	-- ��ͨ����
	scene:CreateMonster(20, 52, 52, 50, 4, 60000)
	scene:CreateMonster(46, 52, 52, 50, 4, 60000)
	scene:CreateMonster(49, 52, 52, 50, 4, 60000)
	scene:CreateMonster(46, 52, 52, 50, 4, 60000)

	--	��֮ϵ��
	scene:CreateMonsterLater(48, 52, 52, 50, 2, 120000)
	scene:CreateMonsterLater(50, 52, 52, 50, 1, 120000)
	scene:CreateMonsterLater(47, 52, 52, 50, 2, 120000)

	--	����
	scene:CreateMonsterLater(18, 52, 52, 1, 1, 240000)

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
	if monsterid == 47 then
		local curstep = player:GetQuest():GetQuestStep(1)
		if curstep == 14 then
			local emptybag = player:GetBagEmptySum()
			if emptybag > 0 and math.random(5) == 1 then
				player:AddItem(855)
			end
		end
	end

	if player:GetQuest():GetQuestStep(1) == 19 and monsterid == 18 then
		local emptybag = player:GetBagEmptySum()
		if emptybag >= 1 then
			if math.random(3) == 1 then
				player:AddItem(629)
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
