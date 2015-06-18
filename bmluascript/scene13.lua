--	����Ͽ�����ű�

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ����Ͽ��
	scene:CreateDoorEvent(12, 42, 91, 13, 25)
	--	�� ��˯֮��
	scene:CreateDoorEvent(14, 87, 37, 21, 26)

	--	����
	scene:CreateMonster(56 , 46, 46, 45, 10, 120000)
	scene:CreateMonster(55 , 46, 46, 45, 10, 120000)
	scene:CreateMonster(54 , 46, 46, 45, 10, 120000)

	--	˫ͷ��� ��
	scene:CreateMonsterLater(60, 46, 46, 45, 3, 180000)

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
