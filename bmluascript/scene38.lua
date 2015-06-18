-- ������Ԩ

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ħ��֮��
	scene:CreateDoorEvent(36, 193, 124, 84, 85)

	--	�����
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))

	--	�޷��浵
	scene:SetCannotStay()
	scene:SetAutoReset()

	--	���
	scene:CreateMonster(39, 100, 100, 100, 10, 30 * 1000)
	--	��ɫeq
	scene:CreateMonster(40, 100, 100, 100, 7, 30 * 1000)
	--	������
	scene:CreateMonster(41, 100, 100, 100, 10, 30 * 1000)
	--	���
	scene:CreateMonster(42, 100, 100, 100, 7, 30 * 1000)
	--	ǯ��
	scene:CreateMonster(43, 100, 100, 100, 10, 30 * 1000)
	--	����ǯ��
	scene:CreateMonsterLater(44, 100, 100, 100, 4, 2 * 60 * 1000)
	--	������
	scene:CreateMonsterLater(19, 100, 100, 100, 1, 3 * 60 * 1000)
	--	��֮������
	scene:CreateMonsterLater(131, 77, 170, 5, 1, 6 * 60 * 1000)

	--	ע���¼� ��ҽ���
	scene:RegisterCallback(SceneEvent_PlayerEnter, "OnPlayerEnterScene", 0)

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
