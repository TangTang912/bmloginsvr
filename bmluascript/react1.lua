gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:����
--	���ϲ�
gNPCTable[10004] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "��ϼɽ������һ������ĵط������氲����ȴ��������ɽ�������˹�Ĺ���Ѿ����������֪�ģ��ݴ�˵����Я����ǰ���书�ؼ��Ľ�ʬ��û������а����ڽ̴��ڣ����������ɱ�����������������޷��������⣬�����⻹�㰲ȫ��л��л�ذ���", 0)
		ctx:AddContextNode(30, 240, "����", 111)
		ctx:AddContextNode(30, 255, "����", 2)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "����һ����Щϡ�������ؼ������ε����ٰ�����ϧ�����ϣ��������㻹���л���ȥʵ������", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "��ϼ���С�����Ǹ����ˣ�Ҳлл�������������ȥ����С�����Ѿ��յ��˲�����ҵ�л��ɣ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 3 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "��˵���˹�Ĺ����������ͷĿ�����þ��飬�����Ҳ��һ���ţ�������������һ����ʽ�������ˣ��Ѿ�����Ǳ����ôΣ�յĵط��ˣ�ɱ��һ�����þ��飬���������������Ұ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 4 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "�����ˣ���ȥ������������ʽ�ɣ��Ҳ��������ģ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 5 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "������������ʽ����Ϊ�����ҿ���Ϊ�㿪�����͵�ɽ�ȿ����Ŀ��أ����㲻�þ��ȣ���ʵ�ұ���Ҳ��һ���ԡ�", 0)
		ctx:AddContextNode(30, 255, "���ܽ���", 3)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 6 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "������һ���ֲ��ĵط�����ʬԭ����һ����ɽ�еĿ󹤡���ɽ������������µĵ�����̮�������Ǳ������С�������ȥ������Ϊ��ʬ����������Я���Ų����鼮�����Ҵ���һ������Ĺ�鼮�������ɣ�", 0)
		ctx:AddContextNode(30, 255, "���Ѿ������", 4)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 7 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "�����㹻�Ŀռ�����ȡ������", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 8 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "���Ѿ���͸�˹�Ĺ�鼮�İ��أ��������˹�Ĺ����Ҳ���⿪�ˣ�����һ������ľ��ᣬ�����ʹ�������������˹�Ĺ��������ع����ʽ�Ѿ���ʼ�ˣ����ص����ͽ��Ҳ��ʼ���������ˣ���˵���þ���Ҳ����������ʽ����������������������ҵ���ݾ��ᡣ��������ɱ���������Ҵ���һ��а��ѫ�°�!", 0)
		ctx:AddContextNode(30, 255, "������", 5)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 9 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "̽����Ҥ������һ����Ĺ�鼮����ȥ�������ˡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 10 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "����������൱��Σ�գ����п��µĽ������ڣ�ǧ��Ҫ���İ���", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 11 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "����¸ң����ѫ�´�����һ���������������ȥ��ħ��½����ħ�������������������һЩ��䣬������Ҫ��İ������Ӵˣ��㽫̤��һ���µ���;��", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 111 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "ɽ�ȿ���", 112)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 254 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "��ɲ��������Ͷ���׼�����㹻��Ǯ�������Ұ�!", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 255 then
		ctx:AddContextNode(0, 0, "���ϲ�:", 0)
		ctx:AddContextNode(0, 20, "�һ��޷�����Ϊ����д��ͣ���Ϊ�һ��޷�ȷ�����ʵ����", 0)
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
