-- Ѫɫħ��

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)

	--	�����
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))

	scene:SetAutoReset()
	scene:SetCannotStay()

	scene:CreateDoorEvent(33, 40, 134, 288, 175)

	scene:CreateMonster(121, 75, 75, 75, 2, 24000)
	scene:CreateMonster(123, 75, 75, 75, 3, 12000)
	scene:CreateMonster(119, 75, 75, 75, 6, 6000)
	scene:CreateMonster(120, 75, 75, 75, 6, 6000)

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
	--MirLog("dead"..monsterid)
	local monsterid = monster:GetMonsterID()
	if monsterid == 121 then
		local scene = player:GetLocateScene()

		--MirLog("here 39")

		if nil ~= scene then
			--MirLog("here 42")

			if math.random(3) == 1 then
				--MirLog("here 45")

				if scene:GetMonsterSum(125) == 0 then
					--MirLog("here 48")

					local xpos = player:GetCoordX()
					local ypos = player:GetCoordY()

					scene:CreateMonster(125, 69, 72)
					player:SendSystemMessage("Ұ���ѱ�����")

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
