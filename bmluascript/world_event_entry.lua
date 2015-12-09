--	�����¼��ű�

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

--	�ص�
local function OnWorldEventActive(_id)
	debug("world event:".._id.." active")
	local activity = GetWorldActivity(_id)
	if nil == activity then
		debug("OnWorldEventActive: Invalid id:".._id)
		return
	end
	
	activity:OnActive()
	activity.running = true
end
local handleOnWorldEventActive = 0

local function OnWorldEventUpdate()
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
local handleOnWorldEventUpdate = 0

local function OnWorldLoginServerConnected()
	for _, v in pairs(registeredWorldActivityTable) do
		v:OnLoginServerConnected()
	end
end
local handleOnWorldLoginServerConnected = 0

--	��������
local function onWorldRunning()
	--	������ ע���¼�����
	handleWorldEventActive = luaRegisterHandler(kLuaEvent_WorldScheduleActive, OnWorldEventActive)
	handleWorldEventUpdate = luaRegisterHandler(kLuaEvent_WorldUpdate, OnWorldEventUpdate)
	handleOnWorldLoginServerConnected = luaRegisterHandler(kLuaEvent_WorldLoginServerConnected, OnWorldLoginServerConnected)
end
local handleWorldRunning = luaRegisterHandler(kLuaEvent_WorldStartRunning, onWorldRunning)


--	������¼��ű�
local worldEvent1 = require("server/world/world_event_1").new()
RegisterWorldActivity(worldEvent1)