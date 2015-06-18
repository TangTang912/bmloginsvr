-- ����֮·

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)

	--	�� ���µ�
	scene:CreateDoorEvent(24, 66, 16, 43, 21)

	--	���ֺ���
	--[[scene:CreateMonster(94, 27, 21, 80, 4, 60000)
	scene:CreateMonster(95, 27, 21, 80, 4, 60000)
	scene:CreateMonster(96, 27, 21, 80, 4, 60000)

	scene:CreateMonster(94, 34, 38, 80, 4, 60000)
	scene:CreateMonster(95, 34, 38, 80, 4, 60000)
	scene:CreateMonster(96, 34, 38, 80, 4, 60000)

	scene:CreateMonster(94, 52, 26, 80, 4, 60000)
	scene:CreateMonster(95, 52, 26, 80, 4, 60000)
	scene:CreateMonster(96, 52, 26, 80, 4, 60000)]]

	scene:CreateMonster(101, 23, 23, 50, 4, 60000)
	scene:CreateMonster(102, 23, 23, 50, 4, 60000)

	scene:CreateMonster(101, 23, 46, 50, 4, 60000)
	scene:CreateMonster(102, 23, 46, 50, 4, 60000)

	scene:CreateMonster(101, 55, 30, 50, 4, 60000)
	scene:CreateMonster(102, 55, 30, 50, 4, 60000)

	scene:CreateMonster(101, 48, 58, 50, 4, 60000)
	scene:CreateMonster(102, 48, 58, 50, 4, 60000)

	scene:CreateMonsterLater(100, 46, 37, 2, 1, 300000)

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
	if monsterid == 100 then
		local step = player:GetQuest():GetQuestStep(1)
		if step == 23 then
			local items = player:CountItem(1224)
			if items == 0 then
				player:AddItem(1224)
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
