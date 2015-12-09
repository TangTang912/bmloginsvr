--	�����¼�1 ˢ���� cron:0 0 */1 * * *
local worldEventId = 1
local worldEventHandler = class("WorldEventHandler")
worldEventHandler.id = worldEventId

--	�¼��ص�
function worldEventHandler:OnRegisterd()
	--	ע���¼��ɹ�
end

function worldEventHandler:OnActive()
	GameSceneManager:GetInstance():SendNotifyAllScene("[����]����Ŵ������صĲر�������ڶ����ͼ�У���������ȥѰ�Ҷ�ȡ���ذɣ�")
end

local generateScenes = {1, 8, 48}

function worldEventHandler:OnUpdate()
	for _, v in ipairs(generateScenes) do
		local scene = GameSceneManager:GetInstance():GetScene(v)
		if nil ~= scene then
			scene:CreateLeaderMonster(v)
		end
	end
	
	return true
end

function worldEventHandler:OnFinish()
	
end

return worldEventHandler