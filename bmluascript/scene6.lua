--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
--	������ű�
function OnMapLoaded(scene)
	--	�� ͨ���������
	scene:CreateDoorEvent(5, 14, 20, 12, 31)
	-- ͨ������ͨ����
	scene:CreateDoorEvent(7, 93, 101, 20, 169)


	--	����սʿ
	scene:CreateMonster(30, 60, 60, 50, 12, 60000)
	--	��������
	scene:CreateMonster(31, 60, 60, 50, 6, 120000)
	--	������ʿ
	scene:CreateMonster(32, 60, 60, 50, 8, 120000)
	--	����ս��
	scene:CreateMonster(33, 60, 60, 50, 8, 120000)
	--	�������
	scene:CreateMonsterLater(34, 60, 60, 1, 1, 240000)
	--	���껤��
	scene:CreateMonsterLater(35, 60, 62, 1, 1, 160000)

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

	if player:GetQuest():GetQuestStep(1) == 19 and monsterid == 34 then
		local emptybag = player:GetBagEmptySum()
		if emptybag >= 1 then
			if math.random(3) == 1 then
				player:AddItem(627)
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
