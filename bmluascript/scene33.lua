-- 血色洞窟

--服务器载入地图后调用 用于创建地图的NPC和怪物
function OnMapLoaded(scene)

	scene:SetAutoReset()

	--	门 冰谷走廊
	scene:CreateDoorEvent(30, 49, 35, 475, 222)
	--	门 血红魔窟
	scene:CreateDoorEvent(34, 288, 175, 40, 134)

	scene:CreateMonster(117, 150, 150, 150, 20, 6000)
	scene:CreateMonster(118, 150, 150, 150, 20, 6000)
	scene:CreateMonster(119, 150, 150, 150, 20, 6000)
	scene:CreateMonster(120, 150, 150, 150, 20, 6000)

end

--2秒钟调用一次 用来更新场景信息
function OnUpdateScene(scene)

end

--NPC任务 function(npc, player)
gNPCQuestTable = {}
--NPC按钮点击 function(bid, npc, player)
gNPCButtonTable = {}


-- OnMonsterDead 怪物死亡回调
function OnMonsterDead(monster, player)
end

-- CanOpenDoor 是否能进门
function CanOpenDoor(x, y, player)

	return true

end

function GetVersion()
end



---------------------------------------------------------
--	以下为分配函数 不必动

--玩家点击NPC调用 用于弹出对话框
function OnNPCClick(npc, player)

	local npcid = npc:GetAttribID()

	func = gNPCQuestTable[npcid]
	if(func ~= nil) then
		func(npc, player)
	else
		MirLog("不存在的NPC对话脚本"..npcid)
	end

end

--玩家点击按钮 根据按钮ID来做相应动作
function OnDlgButtonClick(bid, npc, player)

	local npcid = npc:GetAttribID()

	func = gNPCButtonTable[npcid]
	if(func ~= nil) then
		func(bid, npc, player)
	else
		MirLog("不存在的NPC按钮脚本"..npcid)
	end

end
