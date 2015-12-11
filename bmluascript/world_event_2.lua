--	�����¼�2 ˢ�ֻ
local worldEventId = 2
local sceneId = 56
local worldEventHandler = class("WorldEventHandler")
worldEventHandler.id = worldEventId

local kEventStep_None = 0
local kEventStep_Active = 1
local kEventStep_SignUp = 2
local kEventStep_Playing = 3
local kEventStep_End = 4

function worldEventHandler:ctor()
	self:switchStep(kEventStep_None)
end

--	�¼��ص�
function worldEventHandler:OnRegistered()
	--	ע���¼��ɹ�
end

function worldEventHandler:OnActive()
	GameSceneManager:GetInstance():SendSystemNotifyAllScene("[����]�жᱦ�볡ȯ������ǣ��Ͻ�ȥ����ᱦ��ɣ�")
end

local generateScenes = {1, 2, 4, 7, 8, 12, 22, 30, 38, 48, 55}

function worldEventHandler:OnUpdate()
	--	�����еĵ�ͼһ������
	local step = self:getStep()
	local interval = self:getStepInterval()
	
	if step == kEventStep_None then
		debug("Invalid step none.")
		return true
	elseif step == kEventStep_Active then
		if interval > 10 then
			GameSceneManager:GetInstance():SendSystemNotifyAllScene("[����]�ᱦ����ڽ��ܱ����У�������ȥ�����ɣ�")
			self:switchStep(kEventStep_SignUp)
		end
		return false
	elseif step == kEventStep_SignUp then
		if interval > 120 then
			GameSceneManager:GetInstance():SendSystemNotifyAllScene("[����]�ᱦ��Ѿ���ʼ�ˣ��úü��Ͱɣ�")
			self:switchStep(kEventStep_Playing)
			--	����һ�±���
			self.round = 0
			self.lastRoundEndTime = 0
			self.playerScores = {}
		end
		return false
	elseif step == kEventStep_Playing then
		return self:updateStepPlaying()
	end
	
	return true
end

function worldEventHandler:OnFinish()
	--	����ͳ�� ������һس�
end

function worldEventHandler:OnLoginServerConnected()
	--	����schedule
	local expr = "0 30 */1 * * *"
	if DEBUG then
		expr = "30 */1 * * * *"
	end
	GameWorld:GetInstancePtr():SetSchedule(worldEventId, expr)
end

function worldEventHandler:switchStep(_step)
	self.step = _step
	self.lastSwitchStepTime = os.time()
end

function worldEventHandler:getStep()
	return self.step
end

function worldEventHandler:getStepInterval()
	return os.time() - self.lastSwitchStepTime
end

function worldEventHandler:updateStepPlaying()
	local monsterCount = self:CountMonster()
	if 0 ~= monsterCount then return false end
	
	--	����һ��ˢ��
	self.round = self.round + 1
	
	if self.round >= 5 then return true end
	
	if round == 1 then
	elseif round == 2 then
	elseif round == 3 then
	elseif round == 4 then
	end
end

return worldEventHandler