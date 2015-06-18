gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:���� function(ctx, questid, queststep)

--	10020����
gNPCTable[10020] =
function(ctx, questid, queststep)
	if questid == 0 and queststep == 0 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "������Ƿ�ħ��ͼ�ˣ�������Ҫ��ʼ��ս�����Ժ���˵һ��", 0)
		ctx:AddContextNode(30, 240, "��ʼ��ս", 3)
		ctx:AddContextNode(30, 255, "��Ҫ�뿪", 2)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "�Ѿ���ʼ�ˣ���С��", 0)
		--ctx:AddContextNode(30, 255, "��Ҫ��", 4)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "�˴η�ħ�Ѿ���ʼ��", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	--[[elseif questid == 0 and queststep == 1 then
		ctx:AddContextNode(0, 0, "��������:", 0)
		ctx:AddContextNode(0, 20, "�������ռ����������֮ˮ����Ը��߼��չ����Ҿ���װ�������ɣ�", 0)
		ctx:AddContextNode(30, 255, "��Ҫ��", 4)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:AddContextNode(0, 0, "��������:", 0)
		ctx:AddContextNode(0, 20, "��Ը������Щװ���������10ƿ������ˮ��", 0)
		ctx:AddContextNode(5, 40, "����", 5)
		ctx:AddContextNode(5, 55, "ħ��", 6)
		ctx:AddContextNode(5, 70, "����", 7)
		ctx:AddContextNode(5, 85, "�ر�", 1)

	elseif questid == 0 and queststep == 3 then
		ctx:AddContextNode(0, 0, "��������:", 0)
		ctx:AddContextNode(0, 20, "�㻹û���ռ���Ŷ��", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 4 then
		ctx:AddContextNode(0, 0, "��������:", 0)
		ctx:AddContextNode(0, 20, "�Ѿ������ˣ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)]]

	end
end

------------------------------------------
--	���亯��
function OnSetDialogContext(ctx, npcid, questid, queststep)
	local func = gNPCTable[npcid]

	MirLog("Parameters:NPCID:"..npcid.."QuestID:"..questid.."QuestStep:"..queststep)
	if func ~= nil then
		ctx:Clear()
		func(ctx, questid, queststep)
	else
		MirLog("In react.lua:�޷��ҵ�NPC["..npcid.."]")
	end
end
