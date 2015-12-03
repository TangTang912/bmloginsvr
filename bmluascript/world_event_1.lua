--	�����¼�1 ���﹥�� cron:0 0 20 * * *
local worldEventId = 1
local worldEventHandler = {}
worldEventHandler.id = worldEventId

--	ע���¼�
RegisterWorldActivity(worldEventHandler)

--	�¼��ص�
function worldEventHandler:OnInit()
	self:onInit()
end

function worldEventHandler:OnActive()
	self:onActive()
end

function worldEventHandler:OnUpdate()
	self:onUpdate()
end

function worldEventHandler:OnFinish()
	self:onFinish()
end

--	��������
local function onWorldRunning()
	--	��48��������10020
	debug("1 running")
	GameSceneManager:GetInstance():GetSceneInt(48):CreateNPC(10020, 73, 73)
end

local handleWorldRunning = luaRegisterHandler(4, onWorldRunning)

--	NPC����
local npcHandlerTable = {}

npcHandlerTable[10020] = function(player, npc, bid)
	if 0 == bid then
		player:ResetIDlg()
		player:AddIDlg_String(0, 0, "�ϱ�:")
		player:AddIDlg_String(0, 20, "����NPC����")
		player:AddIDlg_Button(20, 255, 12, "��Ը��")
		player:AddIDlg_CloseButton(20, 270, "������")
		player:ShowIDlg(npc)
	elseif 12 == bid then
		player:ResetIDlg()
		player:AddIDlg_String(0, 0, "�ϱ�:")
		player:AddIDlg_String(0, 20, "�����")
		player:AddIDlg_CloseButton(20, 270, "������")
		player:ShowIDlg(npc)
	end
end

local function onNPCActive(_player, _npc, _bid)
	local npcId = _npc:GetAttribID()
	
	local npcHandler = npcHandlerTable[npcId]
	if nil == npcHandler then return end
	
	npcHandler(_player, _npc, _bid)
end

local handleNPCActive = luaRegisterHandler(3, onNPCActive)

--	�����߼�

--	�߼�����
local kEventStep_None = 0
local kEventStep_Start = 1
local kEventStep_StartEnd = 2
local kEventStep_Mob = 3
local kEventStep_End = 4

function worldEventHandler:onInit()
	self:switchStep(kEventStep_None)
	--	ע��NPC
	RegisterWorldNPCHandler(10050, npcHandler)
end

function worldEventHandler:onActive()
	self:switchStep(kEventStep_Start)
end

function worldEventHandler:onUpdate()
	if nil == self.step then return end
	if kWorldStep_None == self.step then return end
	
	local stepInterval = self:getSwitchStepInterval()
	local ret = false
	
	if kEventStep_Start == self.step then
		--	��ʼ�� ��֪ͨ
		self:switchStep(kEventStep_StartEnd)
	elseif kEventStep_StartEnd == self.step then
		if stepInterval > 20 then
			self:switchStep(kEventStep_Mob)
			self:mobInit()
		end
	elseif kEventStep_Mob == self.step then
		--	ˢ����
		if self:mobUpdate() then
			--	ˢ�����
			self:switchStep(kEventStep_End)
		end
	elseif kEventStep_End == self.step then
		if stepInterval > 10 then
			--	�˳��߼�
			ret = true
		end
	end
	
	return ret
end

function worldEventHandler:onFinish()
	--	���н���ʲô��
	self:switchStep(kEventStep_None)
end

function worldEventHandler:switchStep(_step)
	self.step = _step
	self.lastSwitchStepTime = os.time()
end

function worldEventHandler:getSwitchStepInterval()
	local ct = os.time()
	return ct - self.lastSwitchStepTime
end

function worldEventHandler:mobInit()
	--	��ʼ�����ְ�
	self.killMonsterScore = {}
	--	����
	self.round = 0
	self.nextRoundTime = os.time() + 10
end

local maxRound = 10

function worldEventHandler:mobUpdate()
	if self.round >= maxRound then return true end
	if os.time() < self.nextRoundTime or 0 == self.nextRoundTime then return false end
	
	--	����ˢ��
end
