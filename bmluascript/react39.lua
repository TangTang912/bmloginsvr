gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:���� function(ctx, questid, queststep)

--	10020����
gNPCTable[10020] =
function(ctx, questid, queststep)
	if questid == 0 and queststep == 0 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "�����ҳ۳ҽ�����ȴ�����˲�֪���Ķ�ħ�������ѡ������������������Ѹߣ������ػ�����أ�", 0)
		ctx:AddContextNode(30, 240, "��ħ", 3)
		ctx:AddContextNode(30, 255, "�һ������", 2)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "��ֻ�ܰ�����Щֻ��ӵ�з�ħ���Ӣ�ۣ�������ӵ���˷�ħ����������Ұ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "���Ҷӳ������ҽ�̸", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 3 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "�����ħ���ƺ�����", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 4 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "��ħ��ͼ�Ѿ���Ա�ˣ����Ե�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 5 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "���Ķ����ǲ������", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 5 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "�޷�ʹ�÷�ħ��", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 10 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "�������ս ��ħ��(��) ��ͼ", 0)
		ctx:AddContextNode(30, 255, "��ս", 501)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 11 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "�������ս ��ħ��(��) ��ͼ", 0)
		ctx:AddContextNode(30, 255, "��ս", 502)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 999 then
		ctx:AddContextNode(0, 0, "˾ͽ����:", 0)
		ctx:AddContextNode(0, 20, "�����ҳ۳ҽ�����ȴ�����˲�֪���Ķ�ħ�������ѡ������������������Ѹߣ������ػ�����أ�", 0)
		ctx:AddContextNode(30, 240, "��ħ", 3)
		ctx:AddContextNode(30, 255, "�һ������", 2)
		ctx:AddContextNode(30, 270, "�ر�", 1)

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
