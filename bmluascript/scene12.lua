--	����Ͽ�� �ű�

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ��Ҥ
	scene:CreateDoorEvent(4, 46, 189, 134, 20)
	--	�� ����Ͽ����
	scene:CreateDoorEvent(13, 13, 25, 42, 91)
	--	�� ����Ͽ�ȶ�
	scene:CreateDoorEvent(15, 178, 53, 13, 18)

	scene:CreateMonster(56 , 74, 135, 70, 8, 60000)
	scene:CreateMonster(55 , 74, 135, 70, 8, 60000)
	scene:CreateMonster(54 , 74, 135, 70, 5, 60000)

	scene:CreateMonster(56 , 107, 81, 70, 8, 60000)
	scene:CreateMonster(55 , 107, 81, 70, 8, 60000)
	scene:CreateMonster(54 , 107, 81, 70, 5, 60000)

	scene:CreateMonster(56 , 90, 134, 70, 8, 60000)
	scene:CreateMonster(55 , 90, 134, 70, 8, 60000)
	scene:CreateMonster(54 , 90, 134, 70, 5, 60000)

	--	Ѫ��ʬ
	scene:CreateMonsterLater(57, 77, 96, 20, 1, 180000)
	scene:CreateMonsterLater(57, 64, 58, 20, 1, 180000)
	scene:CreateMonsterLater(57, 183, 122, 20, 1, 180000)

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

	local curstep = player:GetQuest():GetQuestStep(1)
	if curstep == 18 and monsterid == 57 then
		local empty = player:GetBagEmptySum()
		local itemcount = player:CountItem(858)
		if empty >= 1 and itemcount == 0 then
			if math.random(5) == 1 then
				player:AddItem(858)
			end
		end
	end

	if curstep == 17 then
		if monsterid == 54 or monsterid == 55 or monsterid == 56 then
			local empty = player:GetBagEmptySum()
			if empty >= 1 then
				if math.random(10) == 1 then
					player:AddItem(854)
				end
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
