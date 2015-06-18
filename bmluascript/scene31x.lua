-- ��֮����

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)

	-- �� ����ѩԭ��
	scene:CreateDoorEvent(32, 88, 454, 262, 34)
	--	�� ����ѩԭ��
	scene:CreateDoorEvent(33, 458, 414, 256, 40)
	--	�� ��������
	scene:CreateDoorEvent(30, 419, 41, 29, 478)

	scene:CreateMonster(103, 133, 103, 40, 20, 6000)
	scene:CreateMonster(104, 133, 103, 40, 20, 6000)
	scene:CreateMonster(108, 133, 103, 40, 20, 6000)
	scene:CreateMonster(111, 133, 103, 40, 20, 6000)

	scene:CreateMonster(103, 338, 126, 40, 20, 6000)
	scene:CreateMonster(104, 338, 126, 40, 20, 6000)
	scene:CreateMonster(108, 338, 126, 40, 20, 6000)
	scene:CreateMonster(111, 338, 126, 40, 20, 6000)

	scene:CreateMonster(103, 317, 336, 40, 20, 6000)
	scene:CreateMonster(104, 317, 336, 40, 20, 6000)
	scene:CreateMonster(108, 317, 336, 40, 20, 6000)
	scene:CreateMonster(111, 317, 336, 40, 20, 6000)

	scene:CreateMonster(103, 133, 326, 40, 20, 6000)
	scene:CreateMonster(104, 133, 326, 40, 20, 6000)
	scene:CreateMonster(108, 133, 326, 40, 20, 6000)
	scene:CreateMonster(111, 133, 326, 40, 20, 6000)

	scene:CreateMonster(103, 203, 203, 40, 20, 6000)
	scene:CreateMonster(104, 203, 203, 40, 20, 6000)
	scene:CreateMonster(108, 203, 203, 40, 20, 6000)
	scene:CreateMonster(111, 203, 203, 40, 20, 6000)

	scene:SetAutoReset()
	scene:SetCannotStay()

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
