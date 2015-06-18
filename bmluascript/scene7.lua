--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
--	����ͨ���ű�
function OnMapLoaded(scene)
	-- ͨ����������
	scene:CreateDoorEvent(6, 20, 169, 93, 101)
	-- ͨ����ħ��½��
	scene:CreateDoorEvent(8, 188, 186, 17, 27)

	-- ���� ��ʬ ��
	scene:CreateMonster(36, 95, 100, 50, 15, 60000)
	scene:CreateMonster(37, 95, 100, 50, 15, 60000)
	scene:CreateMonsterLater(38, 95, 100, 50, 2, 600000)
	scene:CreateMonsterLater(27, 95, 100, 50, 4, 600000)
	scene:CreateMonsterLater(115, 95, 100, 50, 1, 300000)
	scene:CreateMonster(26, 95, 100, 50, 8, 60000)
	scene:CreateMonster(25, 95, 100, 50, 8, 60000)
	scene:CreateMonster(24, 95, 100, 50, 8, 60000)
	scene:CreateMonster(23, 95, 100, 50, 8, 60000)

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

	if player:GetQuest():GetQuestStep(1) == 19 and monsterid == 38 then
		local emptybag = player:GetBagEmptySum()
		if emptybag >= 1 then
			if math.random(3) == 1 then
				player:AddItem(628)
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
