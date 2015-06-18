--	���˹�Ĺһ��ű��ļ�

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	��ϼɽ����
	scene:CreateDoorEvent(1, 18, 101, 268, 107)
	--	���˹�Ĺ������
	scene:CreateDoorEvent(3, 86, 14, 37, 82)

	--	��ʼ���� ���õ�
	scene:CreateMonster(11, 40, 103, 50, 5, 60000)
	scene:CreateMonster(4, 40, 103, 50, 5, 60000)
	scene:CreateMonster(5, 40, 103, 50, 5, 60000)
	scene:CreateMonster(6, 40, 103, 50, 5, 60000)
	scene:CreateMonster(7, 40, 103, 50, 5, 60000)
	scene:CreateMonster(7, 64, 46, 50, 3, 60000)
	scene:CreateMonster(6, 64, 46, 50, 3, 60000)
	scene:CreateMonster(5, 64, 46, 50, 3, 60000)
	scene:CreateMonster(4, 64, 46, 50, 3, 60000)
end

--2���ӵ���һ�� �������³�����Ϣ
function OnUpdateScene(scene)

end

-- CanOpenDoor �Ƿ��ܽ���
function CanOpenDoor(x, y, player)
	return true
end

function OnMonsterDead(monster, player)
end

function GetVersion()
end

--NPC����
gNPCQuestTable = {}
gNPCButtonTable = {}








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
