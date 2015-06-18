-- ����֮·

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ����֮��
	scene:CreateDoorEvent(32, 10, 134, 107, 22)
	--	�� �����칬
	scene:CreateDoorEvent(41, 16, 19, 54, 48)

	scene:CreateMonster(132, 20, 70, 50, 14, 60000)
	scene:CreateMonster(133, 20, 70, 50, 8, 60000)
	scene:CreateMonster(134, 20, 70, 50, 4, 60000)

	--[[scene:CreateMonster(132, 26, 67, 7, 5, 60000)
	scene:CreateMonster(133, 26, 67, 7, 3, 60000)
	scene:CreateMonster(134, 26, 67, 7, 2, 60000)

	scene:CreateMonster(132, 26, 120, 7, 5, 60000)
	scene:CreateMonster(133, 26, 120, 7, 3, 60000)
	scene:CreateMonster(134, 26, 120, 7, 2, 60000)]]

	scene:CreateMonsterLater(135, 26, 120, 7, 1, 200000)

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
