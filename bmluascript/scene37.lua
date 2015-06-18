-- �����

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ħ��֮��
	scene:CreateDoorEvent(36, 13, 32, 19, 20)

	--	�����
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))

	--	�޷��浵
	scene:SetCannotStay()
	scene:SetAutoReset()

	--	���� ��֮������
	scene:CreateMonsterLater(47, 21, 21, 20, 6, 3 * 60 * 1000)
	--	��֮����
	scene:CreateMonsterLater(48, 21, 21, 20, 3, 3 * 60 * 1000)
	--	��֮��ʿ
	scene:CreateMonsterLater(50, 21, 21, 20, 2, 3 * 60 * 1000)
	--	����
	scene:CreateMonsterLater(80, 21, 21, 5, 1, 4 * 60 * 1000)
	--	qi e
	scene:CreateMonsterLater(128, 21, 21, 20, 10, 2 * 60 * 1000)

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
	player:SendSystemMessage("�����Ƿ�ħ��½���������������ʲô?")
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
