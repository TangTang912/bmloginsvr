--	�����¼��ű�

--	��������
local function onWorldRunning()
	debug("entry")
end

local handleWorldRunning = luaRegisterHandler(kLuaEvent_WorldStartRunning, onWorldRunning)

--	�����¼�ע���
local registeredWorldActivityTable = {}

function RegisterWorldActivity(_activity)
	local aid = _activity.id
	if nil == aid then
		return
	end
	
	registeredWorldActivityTable[aid] = _activity
end

function GetWorldActivity(_id)
	return registeredWorldActivityTable[_id]
end

function WorldEventActive(_id)
	local activity = GetWorldActivity(_id)
	if nil == activity then
		return
	end
	
	activity:OnActive()
	activity.running = true
end

function WorldEventUpdate()
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

function WorldEventInit()
	--	��ʼ�����е��¼�
	for _, v in pairs(registeredWorldActivityTable) do
		v.OnInit()
	end
end


--	������¼��ű�
--require("server/world/world_event_1")