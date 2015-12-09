--	�����¼�1 ˢ���� cron:0 0 */1 * * *
local worldEventId = 1
local worldEventHandler = class("WorldEventHandler")
worldEventHandler.id = worldEventId

--	�¼��ص�
function worldEventHandler:OnRegistered()
	--	ע���¼��ɹ�
end

function worldEventHandler:OnActive()
	GameSceneManager:GetInstance():SendSystemNotifyAllScene("[����]����Ŵ������صĲر�������ڶ����ͼ�У���������ȥѰ�Ҷ�ȡ���ذɣ�")
end

local generateScenes = {1, 2, 4, 7, 8, 12, 22, 30, 38, 48, 55}

function worldEventHandler:OnUpdate()
	--	�����еĵ�ͼһ������
	for _, v in ipairs(generateScenes) do
		local scene = GameSceneManager:GetInstance():GetSceneInt(v)
		local randNumber = math.random(3)
		if nil ~= scene and 1 == randNumber then
			if scene:GetMonsterSum(64) == 0 then
				scene:CreateLeaderMonster(64)
			end
		end
	end
	
	--	�����һ����ͼһ������
	local randomMapId = math.random(#generateScenes)
	if randomMapId >= 1 and randomMapId <= #generateScenes then
		local mapId = generateScenes[randomMapId]
		local scene = GameSceneManager:GetInstance():GetSceneInt(mapId)
		if nil ~= scene then
			if scene:GetMonsterSum(137) == 0 then
				debug("��ر��������ڵ�ͼ:"..mapId)
				scene:CreateLeaderMonster(137)
			end
		end
	end
	
	return true
end

function worldEventHandler:OnFinish()
	
end

function worldEventHandler:OnLoginServerConnected()
	--	����schedule
	local expr = "0 30 */1 * * *"
	if DEBUG then
		expr = "30 */1 * * * *"
	end
	GameWorld:GetInstancePtr():SetSchedule(worldEventId, expr)
end

return worldEventHandler