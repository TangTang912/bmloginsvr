--	�����¼��ű�

local function WorldEventActive(_id)
	local activity = GetWorldActivity(_id)
	if nil == activity then
		return
	end
	
	activity:OnActive()
	activity.running = true
end
local handleWorldEventActive = 0

local function WorldEventUpdate()
	for _, v in pairs(registeredWorldActivityTable) do
		if v.running then
			local ret = v:OnUpdate()
			if ret then
				v.running = false
				v:OnFinish()
			end
		end
	end
end
local handleWorldEventUpdate = 0

--	��������
local function onWorldRunning()
	--	������ ע���¼�����
	handleWorldEventActive = luaRegisterHandler(kLuaEvent_WorldScheduleActive, WorldEventActive)
	handleWorldEventUpdate = luaRegisterHandler(kLuaEvent_WorldUpdate, WorldEventUpdate)
end
local handleWorldRunning = luaRegisterHandler(kLuaEvent_WorldStartRunning, onWorldRunning)

--	�����¼�ע���
local registeredWorldActivityTable = {}

local function RegisterWorldActivity(_activity)
	local aid = _activity.id
	if nil == aid then
		return
	end
	
	registeredWorldActivityTable[aid] = _activity
	_activity:OnRegistered()
end

local function GetWorldActivity(_id)
	return registeredWorldActivityTable[_id]
end


--	������¼��ű�
local worldEvent1 = require("server/world/world_event_1").new()
RegisterWorldActivity(worldEvent1)