-- ����֮��

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)

	--	�� ��������
	scene:CreateDoorEvent(31, 12, 28, 141, 52)
	--	�� ����֮·
	scene:CreateDoorEvent(40, 107, 22, 10, 134)

	scene:CreateMonster(113, 80, 76, 80, 10, 60000)
	scene:CreateMonster(105, 80, 76, 80, 8, 60000)
	scene:CreateMonster(110, 80, 76, 80, 10, 60000)
	scene:CreateMonster(109, 80, 76, 80, 15, 60000)
	scene:CreateMonster(116, 80, 76, 80, 10, 60000)

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
