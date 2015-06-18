--	�����ɵ� �����ű�

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--scene:SetInstance(true)
	scene:SetTreasureMap(true)
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
	player:GetLocateScene():SetKilledMonster()
end

-- CanOpenDoor �Ƿ��ܽ���
function CanOpenDoor(x, y, player)
	return true
end

function GetVersion()
end

function OnStartInstance(scene)
	-- ��Ȫ����
	scene:CreateMonster(65, 37, 24)

	scene:CreateMonster(20)
	scene:CreateMonster(20)
	scene:CreateMonster(20)
	scene:CreateMonster(20)
	scene:CreateMonster(20)
	scene:CreateMonster(20)
	scene:CreateMonster(20)
	scene:CreateMonster(20)
	scene:CreateMonster(46)
	scene:CreateMonster(46)
	scene:CreateMonster(46)
	scene:CreateMonster(46)
	scene:CreateMonster(46)
	scene:CreateMonster(46)
	scene:CreateMonster(46)
	scene:CreateMonster(46)
	scene:CreateMonster(49)
	scene:CreateMonster(49)
	scene:CreateMonster(49)
	scene:CreateMonster(49)
	scene:CreateMonster(49)
	scene:CreateMonster(49)
	scene:CreateMonster(49)
	scene:CreateMonster(49)
	scene:CreateMonster(45, 37, 24)
end

function GiveReward(scene)
	scene:CreateMonster(64, 20, 20)
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
