--	��ħ֮�ؽű�

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ����Ͽ�ȶ�
	scene:CreateDoorEvent(15, 11, 26, 78, 12)

	--	���¶�ħ
	scene:CreateMonsterLater(51, 17, 21, 0, 1, 480000)
	--scene:CreateMonster(51, 17, 21)
	--	��Ӱ֩��
	scene:CreateMonster(52, 14, 18, 0, 1, 90000)
	--	��ħ
	scene:CreateMonster(54, 19, 19, 16, 6, 120000)
	--	����֩��
	scene:CreateMonster(55, 19, 19, 16, 6, 120000)
	--	����֩��
	scene:CreateMonster(56, 19, 19, 16, 6, 120000)

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
	local monsterid = monster:GetMonsterID()
	if monsterid == 51 then
		local step = player:GetQuest():GetQuestStep(51)
		if step == 2 then
			if math.random(3) == 1 then
				local leftbag = player:GetBagEmptySum()
				local itemcounter = player:CountItem(129)
				if leftbag >= 1 and itemcounter == 0 then
					player:AddItem(129)
				--else
					--MirLog("Already have one...")
				end
			end
		end
	end
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
