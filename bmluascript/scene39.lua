-- �ʹ�

--�����������ͼ����� ���ڴ�����ͼ��NPC�͹���
function OnMapLoaded(scene)
	--	�� ��ħ��½
	scene:CreateDoorEvent(8, 12, 43, 95, 95)


	--
	scene:CreateNPC(10020, 22, 25)
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


--	10020
gNPCQuestTable[10020] =
function(npc, player)
	player:ShowQuestDlg(npc, 0, 0)
end

gNPCButtonTable[10020] =
function(bid, npc, player)
	if bid == 2 then
		player:ShowShopDlg(npc, 4)
		player:HideQuestDlg()
	elseif bid == 3 then
		--	��ħ
		local clgItemID = player:GetChallengeItemID()
		if 0 == clgItemID then
			player:ShowQuestDlg(npc, 0, 1)
		else
			if not player:IsTeamLeader() then
				player:ShowQuestDlg(npc, 0, 2)
			else
				if not player:IsTeamMateAround(20) then
					player:ShowQuestDlg(npc, 0, 5)
					return
				end

				if 1 == clgItemID then
					player:ShowQuestDlg(npc, 0, 10)
				elseif 2 == clgItemID then
					player:ShowQuestDlg(npc, 0, 11)
				else
					player:ShowQuestDlg(npc, 0, 3)
				end
			end
		end
	elseif bid == 501 then
		local clgScene = nil

		for i = 42, 44 do
			local dest = GameSceneManager:GetInstance():GetSceneInt(i)
			if nil ~= dest and
			dest:GetPlayerSum() == 0 then
				clgScene = dest
				break
			end
		end

		if nil == clgScene then
			player:ShowQuestDlg(npc, 0, 4)
		else
			if not player:UseChallengeItem(1) then
				player:ShowQuestDlg(npc, 0, 5)
			else
				clgScene:ChallengeResetScene(1)
				player:FlyToMap(34, 23, clgScene:GetMapIDInt())
				player:TeamMateFlyToMap(34, 23, clgScene:GetMapIDInt())
				player:HideQuestDlg()
			end
		end
	elseif bid == 502 then
		EnterChallengeScene(player, 45, 47, 2, 85, 155)
	end
end

function EnterChallengeScene(_player, _startID, _endID, _challengeID, _destMapX, _destMapY)
	local clgScene = nil
	local player = _player

	for i = _startID, _endID do
		local dest = GameSceneManager:GetInstance():GetSceneInt(i)
		if nil ~= dest and
		dest:GetPlayerSum() == 0 then
			clgScene = dest
			break
		end
	end

	if nil == clgScene then
		player:ShowQuestDlg(npc, 0, 4)
	else
		if not player:UseChallengeItem(_challengeID) then
			player:ShowQuestDlg(npc, 0, 5)
		else
			clgScene:ChallengeResetScene(_challengeID)
			player:FlyToMap(_destMapX, _destMapY, clgScene:GetMapIDInt())
			player:TeamMateFlyToMap(_destMapX, _destMapY, clgScene:GetMapIDInt())
			player:HideQuestDlg()
		end
	end
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
