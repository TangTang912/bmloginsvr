gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:���� function(ctx, questid, queststep)

--	10008 ��ħ����
gNPCTable[10008] =
function(ctx, questid, queststep)
	if questid == 0 and queststep == 0 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "��������۸��ָ߼�����Ʒ��", 0)
		ctx:AddContextNode(30, 255, "��Ҫ��", 2)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	end
end

--	10009 ��ħ����
gNPCTable[10009] =
function(ctx, questid, queststep)
	if questid == 0 and queststep == 0 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "���������ǳص����ˣ������кι�ɣ�", 0)
		--ctx:AddContextNode(30, 227, "��ս����", 50)
		ctx:AddContextNode(30, 240, "����", 5)
		ctx:AddContextNode(30, 255, "����", 2)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "��ԭ���Ǹ���ô������͵ĳ��У����ǰ�����ҵ��Ȼ������������ͺ�Ĥ�����������һ�̣��������ж����ˣ����������Ƕ�����˶�ħ�����ұ���������Ҳֻ��һ�����ܣ���ôϣ����Ӣ�ۿ��԰�����ǡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "���ȻЯ�������ص�ѫ�£�֤���������㹻��ʵ�������ܰ�����ɼ�����ô��", 0)
		ctx:AddContextNode(30, 255, "����", 3)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 3 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "���ѫ���أ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 4 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "�Ұ����ص�ѫ��ת��Ϊ������ѫ�£�Ӣ������������ѫ�£�Ϊ��ʹа��Ľ������ٶ������˯������������漸���¡�����������Ϣ��ȫ����ȥ����һ������ɱ50ֻ������ǯ������̽��̽�����ǵķ�Ӧ��", 0)
		ctx:AddContextNode(30, 255, "�����", 4)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 5 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "�㻹û��ɱ��50ֻ����ǯ�棡", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 6 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "�е�üĿ�ˣ������һ�����������ڵأ���������ʱ���԰��㴫�͹�ȥ������Ҫ���һ�� ��ħ���� ����ȡ������鱨������ſ�������������ɱ�� ��֮���깭���� �õ���", 0)
		ctx:AddContextNode(30, 255, "�ҵ���", 6)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 7 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "����һ����ϵ��ţ��ɷ�������д�ɣ����Ϻ��������ܶ���������֪����һ���˶������֣������ڿ�Ҥ��ϰ�ؼ�������ѧ�ߣ��鷳�������Ÿ���������!", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 8 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, " ��ħ���� ��������������ɱ�� ��֮���깭���� �õ���", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 9 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "����ѧ�߲�����ѧ�ߣ�����׾ٵĽ��������š�ԭ����ħ����Ӱ��ֹ���ǵ����ҵķ�ħ��½����Ӱ�쵽����ϼɽ�ȣ���Щ��ħ��Ϣ�ڿ�Ҥ������ƺ���һЩ���µ�֩�룬�ڳ���Ͽ�ȴ���5�����ǵľ綾֩˿�������������ѵ�ʲô�̶��˰ɣ�", 0)
		ctx:AddContextNode(30, 255, "�ҵ���", 8)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 10 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "Ҫ����Щ��ħ�ǳ�˯���������һ���Ϲ�������������Ƭ��ɢ�ڷ����½����ȷ����Ϣ�������������Я�������ǣ�Ȼ��Ҫ���������������������� �˶���ħ�У���Ѫ��ʬ���ϻ�ȡ����!", 0)
		ctx:AddContextNode(30, 255, "�ҵ���", 9)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 11 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "����Ҫ5���綾��˿�����Ͱɡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 12 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "�õ���ħ�У�ʣ��ֻҪ�ռ���������Ƭ���ɣ�ȥɱ�����˹�Ĺ�����þ��飬��Ҥ��ʬ�������������������������ͨ���İ�Ұ�������������������ռ�����Ƭͨ���˶���ħ�кϳ��Ϲ������������Ұɣ�", 0)
		ctx:AddContextNode(30, 255, "�ϳ���", 10)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 13 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "�����Ϲ�������������ʱ��ӡ��Ӱ������Ķ�ħ�ǣ���ӡ֮�������һ����ֵĶ��������ܺ����ĳ��С��������йء���ƿˮ���ܿ����ٻ�����ħ��������������������������Я����ʲô�����ɡ�", 0)
		ctx:AddContextNode(30, 255, "������", 11)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 14 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "�ϳɺ��Ϲ�������Ȼ�󽻸��ҡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 15 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "�����ëʮ��ϡ�У���ӡ����ֻ��ĳ����һ��С���ϲŴ������������࣬��Щ��ħ�ض��Ǵ�������ֵģ����������ëȥС����С������ϱ��ɣ��Һ�������Ϥ�ˣ�˳�����������ʸ��á�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 0 and queststep == 16 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "ɱ���˸÷�ӡˮ�еĹ���û���������ĵ�����Ʒ�����Ұɡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)


	elseif questid == 0 and queststep == 100 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "�����ڿ��԰��㴫�͵������", 0)
		ctx:AddContextNode(0, 50, "������", 7)
		ctx:AddContextNode(0, 65, "�ر�", 1)

	elseif questid == 0 and queststep == 101 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "û���㹻���鱨���һ��޷����͡�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 1 and queststep == 0 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "������ӵ�и���BOSS����Я���ĸ���ͨ��֤���ҾͿ��԰����͵���Ӧ�ĸ�����ȥ��ֻ�жӳ��������Ҵ���Ŷ���������Ѷ�����������������Ӷ����ӣ���Ȼ���е��ջ�Ҳ�Ǻܶ�ģ�", 0)
		ctx:AddContextNode(30, 140, "����һ(�ȼ�20����)", 51)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 1 and queststep == 1 then
		ctx:AddContextNode(0, 0, "��ħ����:", 0)
		ctx:AddContextNode(0, 20, "�㲻�Ƕӳ����������ǵĶӳ�������˵���ɡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	end
end


--	�ֿ��ϰ�
gNPCTable[10011] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ֿ��ϰ�:", 0)
		ctx:AddContextNode(0, 20, "����̫�ر������Ų�������ô�죿��Ȼ�������£������ṩ�����ݵķ��񣬵�ȻҪ����һ��㱨��������Ȼ��СǮ���ѣ�ÿ�δ򿪲ֿ���Ҫ����500��ҡ�", 0)
		ctx:AddContextNode(30, 240, "�򿪲ֿ�", 2)
		--ctx:AddContextNode(30, 255, "�����������˹�Ĺ", 3)
		ctx:AddContextNode(30, 255, "ûʲô��", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�ֿ��ϰ�:", 0)
		ctx:AddContextNode(0, 20, "�������⣬ûǮ�������ң�׼����500����������Ұɣ�", 0)
		ctx:AddContextNode(30, 255, "Ŭ��׬Ǯ", 1)

	end

end

--	�����Ӣ��
gNPCTable[10017] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�����Ӣ��:", 0)
		ctx:AddContextNode(0, 20, "�ڹ�ȥ�����������ΪѰ���귨��԰��ʹ�ߣ�����һ�˴�����ѩ���������������ǿ���ħ��������������ҹ���������������ڽ�ħ����ܣ�Ȼ���Լ�ȴҲ���ұ��ڰ�ħ�����ˣ������ϲ�����һЩ���µ���䣬���ճ�Ϊ��һ������ĵ���", 0)
		ctx:AddContextNode(30, 240, "��������ѩ�������", 3)
		ctx:AddContextNode(30, 255, "����", 2)
		ctx:AddContextNode(30, 270, "ûʲô��", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�����Ӣ��:", 0)
		ctx:AddContextNode(0, 20, "�����ҵ��������ҿ���ѩ��Ĺ��Ϸ�ӡ��������ǲ���һ��ѩ������ް��ء�ѩ���Ƿǳ����յĵط�����ȻҲ������δ֪ħ����ϡ��װ����", 0)
		--ctx:AddContextNode(30, 240, "��������ѩ�������", 3)
		--ctx:AddContextNode(30, 255, "����", 2)
		ctx:AddContextNode(30, 270, "������", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�����Ӣ��:", 0)
		ctx:AddContextNode(0, 20, "ֻ��ʵ����Ⱥ��Ӣ�۲��ܽ������", 0)
		--ctx:AddContextNode(30, 240, "��������ѩ�������", 3)
		--ctx:AddContextNode(30, 255, "����", 2)
		ctx:AddContextNode(30, 270, "������", 1)

	elseif questid == 0 and queststep == 3 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�����Ӣ��:", 0)
		ctx:AddContextNode(0, 20, "���ź����ڰ�ħ��������ʱ��̫������ʹ���ã����Ѿ��޷��ָ�����������������ˡ����Ǽ������µ�Ϧ������Ӣ����ȷ��ȽȽ����ĳ��ա��Һ�ȷ������Խ���ѩ�����ħ����һ���������һ�����͹�ȥ��", 0)
		--ctx:AddContextNode(30, 240, "��������ѩ�������", 3)
		--ctx:AddContextNode(30, 255, "����", 2)
		ctx:AddContextNode(30, 270, "������", 1)

	elseif questid == 0 and queststep == 4 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "�����Ӣ��:", 0)
		ctx:AddContextNode(0, 20, "�ҿ��Խ��㴫�͵���֮������", 0)
		--ctx:AddContextNode(30, 240, "��������ѩ�������", 3)
		ctx:AddContextNode(30, 255, "��Ҫȥ", 4)
		ctx:AddContextNode(30, 270, "������", 1)

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
