gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:���� function(ctx, questid, queststep)
gNPCTable[10005] =
function(ctx, questid, queststep)
	if questid == 0 and queststep == 0 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "�ҿ���������ʬ�ɣ�Ϊ��ѧϰ������书�ؼ���������ѧ����������������ô�ҡ��������Ǻ�ֵ�õģ�������书�ؼ��൱֮�࣬��Щ��ȥ�Ŀ�����Ȼ����˽�ʬ����������Ҳ�����ˣ��Ѿ��ֲ������ǽ�ʬ���������ˡ�", 0)
		ctx:AddContextNode(30, 240, "�����ȥ", 2)
		ctx:AddContextNode(30, 255, "����", 3)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "��Щ��ʬ�ܿɶ���˵�ҿ���ȥҲ�ǽ�ʬ�ˣ����ǻ����������ҵĿ�Ҥ�ر�ͼ�����ԵĻ������һ����ɡ�����ϡ�ǵ��Ǳ�����װ��һ���Ľ�ʬ�������ˣ�̫�ɶ��ˣ�", 0)
		ctx:AddContextNode(30, 240, "��Ȼû����", 4)
		ctx:AddContextNode(30, 255, "�ر�", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "ʮ�ָ�л�㣡�ҵ���ĺ���Ϣ", 0)
		ctx:AddContextNode(30, 240, "���ҵ���", 5)
		ctx:AddContextNode(30, 255, "�ر�", 1)

	elseif questid == 0 and queststep == 3 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "�ҵ�ȷ������Ҫ���æ�������㻹̫���ᣬ������15���������Ұɣ�", 0)
		ctx:AddContextNode(30, 255, "�ر�", 1)

	elseif questid == 0 and queststep == 4 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "��û�ҵ��ҵĿ�Ҥ�ر�ͼѽ��", 0)
		ctx:AddContextNode(30, 255, "�ر�", 1)

	elseif questid == 0 and queststep == 5 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "���ȷ���ҵĲر�ͼ��̫��л���ˣ���㶫�����͸����ˡ�", 0)
		ctx:AddContextNode(30, 255, "�ر�", 1)

	elseif questid == 0 and queststep == 6 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "��Ҥ�ر�ͼ���ҵ��ˣ����ǿɶ�Ľ�ʬ���ҵĲر�ͼ�ϴ��˸��������ǵģ�Խ��Խ���������ܰ���ȥ����20ֻ��ʬ�����", 0)
		ctx:AddContextNode(30, 240, "����", 6)
		ctx:AddContextNode(30, 255, "�ر�", 1)

	elseif questid == 0 and queststep == 7 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "�Լ�С�ģ�", 0)
		ctx:AddContextNode(30, 255, "�ر�", 1)

	elseif questid == 0 and queststep == 8 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "�ܺã����Ǹ���Ľ��͡�", 0)
		ctx:AddContextNode(30, 240, "��ȡ", 7)
		ctx:AddContextNode(30, 255, "�ر�", 1)

	elseif questid == 0 and queststep == 9 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "�����ˣ������ǰ;�����������ǻ��ټ���ġ�", 0)
		ctx:AddContextNode(30, 255, "�ر�", 1)

	elseif questid == 0 and queststep == 10 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "�����̫�����ˣ��ֲ���������Ŀ�ҤҲ������һЩ�����ڽ�ʬ��û�ĵط���Ȼ��ʱ��������֩����������Ͻ�������Ÿ������͹�ȥ�ɣ����ǵ��ƻ���ħ�ǵ���ı��", 0)
		ctx:AddContextNode(30, 255, "�ر�", 1)

	elseif questid == 0 and queststep == 100 then
		ctx:AddContextNode(0, 0, "����ѧ��:", 0)
		ctx:AddContextNode(0, 20, "��ط������", 0)
		ctx:AddContextNode(30, 255, "�ر�", 1)

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
