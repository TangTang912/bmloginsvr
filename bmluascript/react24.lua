gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:���� function(ctx, questid, queststep)

--	�ϱ�
gNPCTable[10013] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "����һ����������Σ�յ�С�����������ӡ�Ŵ����������������ħ������ʱ�ڵ����Ƿǳ���ȫ�ģ���ס��ҪðȻ���뵺�ϵ�ɽ�����������ġ���Ȼ��������Ҳ���Ÿ��ֶ����䱦����ҪΪ�����Ƕ�ɥ������", 0)
		ctx:AddContextNode(30, 240, "�����ȥ", 5)
		ctx:AddContextNode(30, 255, "����", 2)
		ctx:AddContextNode(30, 270, "��ȷ", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "����**ô���Ǻǡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "���յ��˷�ħ�������ʺ�лл�㡣����ë��ȷ���������ϵ�����ģ��������������ˣ�������ǰ���귢������䣬Զ��Ӣ��ȫ�����ѣ�֧����������졣���������صĺ���Ӧ�������˵�ս�ľ��ĵ���ħ���ɡ����Ȱ��ҵ���һ���⵺����Щ��ֵĶ����ǰɣ�ɱ��50ֻ����������ҡ�", 0)
		ctx:AddContextNode(30, 255, "�����", 3)
		ctx:AddContextNode(30, 270, "��ȷ", 1)

	elseif questid == 0 and queststep == 3 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "Ӣ���Ҿ����㣬�������ô�ն�����񡣵�������ʵ�������ǲ����ڵģ���������˵���Ǳ�Զ��Ӣ�۷�ӡ�ĵط���ֻ�м���֮�˲Ż����������������÷��������ĳ��ִ�������ʵ��ƽ�⣬��ҪԶ��Ӣ���ٴη�ӡ������µĵط���Ϊ�������ٴ����ѣ���õ�����֮�ģ�ֻ���������Ƴ�Զ��Ӣ�����ϵİ���ħ����ӡ��", 0)
		ctx:AddContextNode(30, 255, "�ҵõ�������֮��", 4)
		ctx:AddContextNode(30, 270, "��ȷ", 1)

	elseif questid == 0 and queststep == 4 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "�㻹û�����ɱ50ֻ���������", 0)
		ctx:AddContextNode(30, 270, "��ȷ", 1)
		
	elseif questid == 0 and queststep == 5 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "�Ͽ콫����֮�Ĵ�����ӡ��Ӣ�۰ɣ�", 0)
		--ctx:AddContextNode(30, 255, "�ҵõ�������֮��", 4)
		ctx:AddContextNode(30, 270, "����", 1)
		
	elseif questid == 0 and queststep == 6 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "�����ҵ�����ħ����õ�����֮�ģ�", 0)
		--ctx:AddContextNode(30, 255, "�ҵõ�������֮��", 4)
		ctx:AddContextNode(30, 270, "����", 1)

	end

end



--	�ӻ�����
gNPCTable[10014] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ӻ�����:", 0)
		ctx:AddContextNode(0, 20, "������������", 0)
		ctx:AddContextNode(30, 240, "��������", 3)
		--ctx:AddContextNode(30, 255, "����", 2)
		ctx:AddContextNode(30, 270, "��ȷ", 1)

	--[[elseif questid == 0 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "����**ô���Ǻǡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "���յ��˷�ħ�������ʺ�лл�㡣����ë��ȷ���������ϵ�����ģ��������������ˣ�������ǰ���귢������䣬Զ��Ӣ��ȫ�����ѣ�֧����������졣���������صĺ���Ӧ�������˵�ս�ľ���**�ɡ����Ȱ��ҵ���һ���⵺����Щ��ֵĶ����ǰɣ�ɱ��50ֻ����������ҡ�", 0)
		ctx:AddContextNode(30, 255, "�����", 3)
		ctx:AddContextNode(30, 270, "��ȷ", 1)

	elseif questid == 0 and queststep == 3 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "��ȷ��������", 0)
		ctx:AddContextNode(30, 255, "�����", 4)
		ctx:AddContextNode(30, 270, "��ȷ", 1)

	elseif questid == 0 and queststep == 4 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "�㻹û�����ɱ50ֻ���������", 0)
		ctx:AddContextNode(30, 270, "��ȷ", 1)]]

	end

end



--	�ֿ��ϰ�
gNPCTable[10015] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ֿ��ϰ�:", 0)
		ctx:AddContextNode(0, 20, "�ֿ�������Ҫ��ȡһ�������ģ�", 0)
		ctx:AddContextNode(30, 240, "��ȡ����", 3)
		--ctx:AddContextNode(30, 255, "����", 2)
		ctx:AddContextNode(30, 270, "��ȷ", 1)
		
	elseif questid == 0 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ֿ��ϰ�:", 0)
		ctx:AddContextNode(0, 20, "Ӣ�ۣ���ȥ����Ǯ�ѡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	--[[elseif questid == 0 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "����**ô���Ǻǡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "���յ��˷�ħ�������ʺ�лл�㡣����ë��ȷ���������ϵ�����ģ��������������ˣ�������ǰ���귢������䣬Զ��Ӣ��ȫ�����ѣ�֧����������졣���������صĺ���Ӧ�������˵�ս�ľ���**�ɡ����Ȱ��ҵ���һ���⵺����Щ��ֵĶ����ǰɣ�ɱ��50ֻ����������ҡ�", 0)
		ctx:AddContextNode(30, 255, "�����", 3)
		ctx:AddContextNode(30, 270, "��ȷ", 1)

	elseif questid == 0 and queststep == 3 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "��ȷ��������", 0)
		ctx:AddContextNode(30, 255, "�����", 4)
		ctx:AddContextNode(30, 270, "��ȷ", 1)

	elseif questid == 0 and queststep == 4 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ϱ�:", 0)
		ctx:AddContextNode(0, 20, "�㻹û�����ɱ50ֻ���������", 0)
		ctx:AddContextNode(30, 270, "��ȷ", 1)]]

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
