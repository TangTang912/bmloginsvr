-- ��˯֮�ؽű�

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ����Ͽ����
	scene:CreateDoorEvent(13, 21, 26, 87, 37)

	--	˫ͷ���
	scene:CreateMonsterLater(58, 16, 16, 16, 1, 240000)
	--	˫ͷѪħ
	scene:CreateMonsterLater(59, 16, 16, 16, 1, 240000)
	--	��Ӱ֩��
	scene:CreateMonster(52, 15, 18, 1, 1, 90000)
	--	��ħ
	scene:CreateMonster(54, 16, 16, 16, 8, 120000)
	--	����֩��
	scene:CreateMonster(55, 16, 16, 16, 8, 120000)
	--	����֩��
	scene:CreateMonster(56, 16, 16, 16, 8, 120000)

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
