--	����Ͽ�ȶ�

gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:���� function(ctx, questid, queststep)
gNPCTable[10012] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then

		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "����ԭ����һ����ƽ��ɽ����Ȼ�����¶�ħ�����������˴󲿷ֶ���ı��죬����Ҳ��Ϊ�˳����������ζ���� �������ںܾúܾ���ǰ����Ϊ���䳤�ڵĽ���̽���������﷢����һ��а��Ķ��ߣ����Ҳ����а��ĸ�Դ�����������ʥսΪ��ά����ϼ�İ���������һ��̤���������ħ����;�����ڶ�ħ̫����ǿ���ڽ�Ҫ��ͷ��ʹ�ô���֮�飬�����Ժ����Ҳû�м��������ˣ�������Ȼ�縺�������ħ��ʹ����", 0)
		ctx:AddContextNode(30, 240, "����", 2)
		ctx:AddContextNode(120, 240, "�ر�", 1)

	elseif questid == 0 and queststep == 1 then

		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "�ܽ�����ô�ն�ط����˲��࣬��������Ӣ�ۣ�Ϊ�˱���ҵľ��⣬�ҿ��԰���ϳ�һ��մ���˳��¶�ħ��Ѫ��ħ�� : ��Ѫħ��������Ҫһ����ɲ��2ƿ¹Ѫ�͹���Ȩ�ȣ��þ�֮�ȣ����ƽ���һ�ѣ�������Щ���ҾͰ���ϳɡ�", 0)
		ctx:AddContextNode(120, 240, "��׼������", 3)

	elseif questid == 0 and queststep == 2 then

		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "����ϳɺ��ˣ�ϣ������һ����������¶�ħ��", 0)
		ctx:AddContextNode(120, 240, "лл", 1)

	elseif questid == 0 and queststep == 3 then

		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "û�в�����Ҳ����Ϊ����!", 0)
		ctx:AddContextNode(120, 240, "�һ�Ŭ����", 1)
		
	elseif questid == 0 and queststep == 4 then

		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "���ȷ��Ѫħ���ϵı����Ҳ��ʥս����������ǵĶ����������ڳ��¶�ħ�Ƕ���������һ��ʥսʹ�õĻ�ѣ����������Ұɡ�", 0)
		ctx:AddContextNode(30, 240, "����", 4)
		ctx:AddContextNode(120, 240, "�ر�", 1)
		
	elseif questid == 0 and queststep == 5 then

		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "��ɵĻ�����˵һ�£��ҵ���ĺ���Ϣ��", 0)
		ctx:AddContextNode(30, 240, "�����", 5)
		ctx:AddContextNode(120, 240, "�ر�", 1)
		
	elseif questid == 0 and queststep == 6 then

		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "̫лл���ˣ����Ǹ���Ľ������һ���д�̽ʥս�ͷ��������ġ�", 0)
		--ctx:AddContextNode(30, 240, "�����", 5)
		ctx:AddContextNode(120, 240, "�ر�", 1)

	elseif questid == 0 and queststep == 7 then

		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "��ɺ��������Ұ�", 0)
		--ctx:AddContextNode(30, 240, "�����", 5)
		ctx:AddContextNode(120, 240, "�ر�", 1)
		
	elseif questid == 0 and queststep == 8 then

		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "���Ѫħ֮Ѫ�أ�", 0)
		--ctx:AddContextNode(30, 240, "�����", 5)
		ctx:AddContextNode(120, 240, "�ر�", 1)

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
