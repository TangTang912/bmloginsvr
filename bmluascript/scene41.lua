-- �����칬

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ����֮��
	--scene:CreateDoorEvent(32, 10, 134, 107, 22)

	--	�� ����֮·
	scene:CreateDoorEvent(40, 54, 48, 16, 19)

	scene:CreateMonster(132, 35, 35, 35, 8, 60000)
	scene:CreateMonster(133, 35, 35, 35, 2, 60000)
	scene:CreateMonster(134, 35, 35, 35, 4, 60000)

	scene:CreateMonsterLater(136, 42, 39, 4, 1, 180000)

	--	�޷��浵
	scene:SetCannotStay()
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

function OnPlayerEnterScene(scene, player)
	--player:SendSystemMessage("[ϵͳ]�����Ƿ�ħ��½���������������ʲô?")
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
