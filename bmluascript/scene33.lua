-- Ѫɫ����

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)

	scene:SetAutoReset()

	--	�� ��������
	scene:CreateDoorEvent(30, 49, 35, 475, 222)
	--	�� Ѫ��ħ��
	scene:CreateDoorEvent(34, 288, 175, 40, 134)

	scene:CreateMonster(117, 150, 150, 150, 20, 6000)
	scene:CreateMonster(118, 150, 150, 150, 20, 6000)
	scene:CreateMonster(119, 150, 150, 150, 20, 6000)
	scene:CreateMonster(120, 150, 150, 150, 20, 6000)

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
