gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:����
--	10003 С��
gNPCTable[10002] =
function(ctx, questid, queststep)

	MirLog("questid=="..questid.."step=="..queststep)

	if questid == 0 and queststep == 0 then
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "���������ұ����ˣ�������Щ�ֲ�������̫ǿ���ˣ������򲻹�������֮��ѧ���˴����������������������أ���Щ���ö����ҿ����ҡ�", 0)
		ctx:AddContextNode(30, 240, "����", 2)
		ctx:AddContextNode(120, 240, "û��", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "ԭ�����Ҹ��װ����������ҵİ����������ȥ���ұ���ƽ�����һ�������������������", 0)
		ctx:AddContextNode(30, 240, "��֪����", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "�ն�Ļ������Լ���Ǳ�ܡ�", 0)
		ctx:AddContextNode(30, 240, "�ǰ�", 1)

	end

end


------------------------------------------
--	���亯��
function OnSetDialogContext(ctx, npcid, questid, queststep)
	local func = gNPCTable[npcid]

	if func ~= nil then
		ctx:Clear()
		func(ctx, questid, queststep)
	else
		MirLog("In react.lua:�޷��ҵ�NPC["..npcid.."]")
	end
end
