gNPCTable = {}

--	Ĭ�ϰ�ť 1:�˳��Ի���  ContextNode����:0:����
--	10010 ����ָ��
gNPCTable[10010] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then

		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "��ã���ӭ�����λش�������硣�����ҽ�ָ������Ϥ��Ϸ��������ȹ����ڵĳɳ����̲���Ϥ�����ĵ�ͼ����ô����ϼ����ȡ1�鼦�����ɣ���ɱ����һ�����ʻ�ã�", 0)
		ctx:AddContextNode(30, 240, "�Ҵ�����", 2)
		ctx:AddContextNode(120, 240, "�����ȥȡ", 1)

	elseif questid == 0 and queststep == 1 then

		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "����û���������Ŷ��ȥȡ1�鼦�����ɣ�", 0)
		ctx:AddContextNode(120, 240, "��������", 1)

	elseif questid == 0 and queststep == 2 then

		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "�ܺã���Ϊ���꣬����5����ҩ", 0)
		ctx:AddContextNode(120, 240, "лл", 3)
		--ButtonID 3 ��5��ҩ

	elseif questid == 0 and queststep == 3 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "ѽ����ı�������̫���ˣ��������˿ռ������ý�����", 0)
		ctx:AddContextNode(120, 240, "��������", 1)

	elseif questid == 0 and queststep == 4 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "����5ƿС��ҩ������������ȡ1��¹������������һ��ذ��Ŷ��", 0)
		ctx:AddContextNode(30, 240, "�Ҵ�����", 4)
		ctx:AddContextNode(120, 240, "�����ȥȡ", 1)
		--ButtonID 4 ����¹��

	elseif questid == 0 and queststep == 5 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "��ı�������û��¹��Ŷ����ȡ��1��¹�⣡", 0)
		ctx:AddContextNode(120, 240, "����ȥȡ", 1)

	elseif questid == 0 and queststep == 6 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "������1�񱳰����࣬�Ų����ˡ�", 0)
		ctx:AddContextNode(120, 240, "��������", 1)

	elseif questid == 0 and queststep == 7 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "����һ�ѷ�����ذ�ף�������������һ���Ȱɣ��ӱߵ�������Ҵ�һ���޴��õ�ľ�ϣ������͹�ȥ��!", 0)
		ctx:AddContextNode(30, 240, "���Ұ�", 5)
		ctx:AddContextNode(120, 240, "�Ҳ�������", 1)
		--ButtonID 5 ����

	elseif questid == 0 and queststep == 8 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "������1�񱳰����࣬�Ų����ˡ�", 0)
		ctx:AddContextNode(120, 240, "��������", 1)

	elseif questid == 0 and queststep == 9 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "����������(59,28)������ͼ���½ǣ������׾��ҵ���", 0)
		ctx:AddContextNode(120, 240, "��������", 1)

	elseif questid == 0 and queststep == 10 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "����������͵���,����ϼ�����Ͻǿ���ͨ����ϼ�ȣ�����һ�����صĵط�����Ȼ��ɫ�������������ն�֮�����ڴ����м�ֻ�๳è����è�͵����ˣ�����ԭ�Ⱥ���������ϧ����������Ⱦ�ˣ�Ϊ�˶����㣬��ɱ��10ֻ�Ƕ��ĵ����ˡ�", 0)
		ctx:AddContextNode(30, 240, "�õ�", 6)
		ctx:AddContextNode(120, 240, "û��Ȥ", 1)

	elseif questid == 0 and queststep == 11 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "��Щ�����˶������ڵ�����˵���Ǻ�Σ�յģ�������5ƿ��ҩ���㱣���ɣ�ɱ���˺��������Ұɣ�", 0)
		ctx:AddContextNode(30, 240, "�õ�", 1)
		ctx:AddContextNode(120, 240, "���Ѿ������", 7)

	elseif questid == 0 and queststep == 12 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "���Ͱ�������!", 0)
		ctx:AddContextNode(30, 240, "�һ��", 1)

	elseif questid == 0 and queststep == 13 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "��������!��Ӧ�ñ�ø�ǿ׳��!��ϼ��(117,247)������ɱ��10ֻ�๳è���߶���è��!", 0)
		ctx:AddContextNode(30, 240, "�һ��", 8)
		ctx:AddContextNode(120, 240, "�����Ҳ���ð��", 1)

	elseif questid == 0 and queststep == 14 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "���������ô?����С������è�Ͷ๳è!", 0)
		ctx:AddContextNode(30, 240, "�������", 9)

	elseif questid == 0 and queststep == 15 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "�ܺã����ֳɳ��ˣ�����7�������ѧϰְҵ�ĵ�һ�����ܣ�����Ŭ��������7���ɣ��һ������һ��������ġ�", 0)
		ctx:AddContextNode(30, 240, "�ҵ�7����", 10)

	elseif questid == 0 and queststep == 16 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "Ŭ����ְ�!", 0)
		ctx:AddContextNode(30, 240, "�һ��", 1)

	elseif questid == 0 and queststep == 17 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "��ϲ�㵽��7�����Ժ�ÿ7���������Զ���õ�һ�����������������㱾�����飬�Ҽ�����ѧϰ���������ܿ��԰�F11�򿪼��ܴ��ڣ���������Ƶ���Ӧ�ļ��ܷ����ڣ�ͬʱ����F1 - F8�����ü���ʹ�õĿ�ݼ�����ͨ������ߵȼ�Ϊ�������߼�������ߵȼ�Ϊ7����һ�������ֲ������������1-3���ļ��ܣ�����������������4-6���ļ��ܣ�������������7�����ܣ���������Դ����BOSS���߽�ʬ���õ���", 0)
		ctx:AddContextNode(30, 240, "���Ѿ����ˣ����Ҹ���ǿ���", 11)

	elseif questid == 0 and queststep == 18 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "���Ѿ���Ϊ��һ���ϸ��սʿ��������������������������ʡ�Ϊ���ܹ���һ�������㣬����������������İ�!", 0)
		ctx:AddContextNode(30, 240, "��", 1)

	elseif questid == 0 and queststep == 19 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "���Ѿ���Ϊ��һ���ϸ�ķ�ʦ��С���򽫸�����Զ�̹��������������Ϊ���ܹ���һ�������㣬����������������İ�!", 0)
		ctx:AddContextNode(30, 240, "��", 1)

	elseif questid == 0 and queststep == 20 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "���Ѿ���Ϊ��һ���ϸ�ĵ�ʿ�����������������������˵�������Ϊ���ܹ���һ�������㣬����������������İ�!", 0)
		ctx:AddContextNode(30, 240, "��", 1)

	elseif questid == 0 and queststep == 21 then
		ctx:AddContextNode(0, 0, "����ָ��:", 0)
		ctx:AddContextNode(0, 20, "...", 0)
		ctx:AddContextNode(30, 240, "��", 1)

	end

end

--	����
gNPCTable[10000] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "��������������˵��������˹�Ĺ��������һ��ȫ��͸��Ѫ��ɫ�Ŀ��µ����ã���������Я�������ı��ǰ�������ҵ�һ������ȥѰ������ϧ��Ҳû�л�����̫������", 0)
		ctx:AddContextNode(30, 240, "������㶫��", 2)
		ctx:AddContextNode(30, 255, "�����������˹�Ĺ", 3)
		ctx:AddContextNode(30, 270, "ûʲô��", 1)
	elseif questid == 0 and queststep == 21 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "����ǧ����ǰ�������˲��俪ʼ�����ˣ����������ʷԶԶ�ĳ���������������Ϊ�б�������������������ʱ��ѹ�����ࡣ�����������𣬰����˱����ϵ��˻�ԭ�ϡ���ǧ���ʱ������ȥ�İ����˶�������������飬��Թ��Ҳʹ����������˱��죬������͸��Ѫ��ɫ�����飬ҲЯ������ǧ������ǰ�˶�ʧ���䱦��", 0)
		ctx:AddContextNode(30, 255, "��ʲô�ҿ��԰�æ��", 4)
		ctx:AddContextNode(30, 270, "��������", 1)
	elseif questid == 0 and queststep == 22 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "�㻹̫���ᣬ����������ɣ�", 0)
		ctx:AddContextNode(30, 270, "�һ��", 1)
	elseif questid == 0 and queststep == 23 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "�������ֲ������ܰ��ҵ����˹�Ĺ�������ҵĺ�����ʬ��Ҳ��...��", 0)
		ctx:AddContextNode(30, 255, "�岻�ݴ�", 5)
		ctx:AddContextNode(30, 270, "̫Σ���ˣ��Ҳ���", 1)
	elseif questid == 0 and queststep == 24 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "̫��л����", 0)
		ctx:AddContextNode(30, 255, "������", 1)
	elseif questid == 0 and queststep == 25 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "�����ҵ���ϣ��������...", 0)
		ctx:AddContextNode(30, 270, "�ڰ�˳��", 1)
	elseif questid == 0 and queststep == 26 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "̫��л������ҵ����ҵĺ��ӣ����С����������°ɣ��´�����̸�����ҿ��԰�����������������Ǳ������ĳɳ��Ѿ��ܿ��ˣ������С���������������æ��", 0)
		ctx:AddContextNode(30, 270, "ʮ�ָ�л", 1)
	elseif questid == 0 and queststep == 27 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "��Щ�����о����������з�������������������������Եİ��أ���Ϊ�����ҿ��԰�������һ�����������ԣ������Ŷ", 0)
		ctx:AddContextNode(30, 255, "����������", 6)
		ctx:AddContextNode(30, 270, "��ʱ����Ҫ", 1)
	elseif questid == 0 and queststep == 28 then
		ctx:AddContextNode(0, 0, "����:", 0)
		ctx:AddContextNode(0, 20, "��л������ҵ��ҵĺ��ӡ�", 0)
		ctx:AddContextNode(30, 255, "������", 1)

	end

end

--	���
gNPCTable[10001] =
function(ctx, questid, queststep)

	if questid == 0 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���:", 0)
		ctx:AddContextNode(0, 20, "���ں�����ʱ������һ��������С����������һ������Ȼ�и�����ֵĶ���!��Ȼ�����ҵĴ�Ū���ˣ��Һ�С���Ӧ�Ұ�����һ���ϵ�ľ�ϡ�", 0)
		ctx:AddContextNode(30, 255, "����С��", 2)
		ctx:AddContextNode(30, 270, "��ȷ", 1)

	elseif questid == 0 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���:", 0)
		ctx:AddContextNode(0, 20, "ľ��������˰�!̫��л���ˣ����С����ΪСС�Ľ��Ͱ�!����������ָ��Ա����лл��", 0)
		ctx:AddContextNode(30, 270, "лл", 1)

	elseif questid == 0 and queststep == 2 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���:", 0)
		ctx:AddContextNode(0, 20, "���ȷ��һ����������С�������滷������ʱ�Ҿͱ���ס�ˣ������鲻�Խ���ͣ�˴�����С����ͻȻ�����и���δ�������Ĺ�����ṥ���ˣ������Ҽ�æ���˴��뿪�ˡ��һ��ϵ������·�������ɶ����﹢���ڻ������ܰ���һ̽����ô���еĻ��ҿ������㵽���", 0)
		ctx:AddContextNode(30, 255, "��������", 3)
		ctx:AddContextNode(30, 270, "����", 1)

	elseif questid == 0 and queststep == 3 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "���:", 0)
		ctx:AddContextNode(0, 20, "Ӣ�ۣ��㻹û�дﵽ��̽������С���ľ��磬�ȵ�50���Ժ��������Ұɡ�", 0)
		ctx:AddContextNode(30, 270, "����", 1)

	end

end

--	�ֿ��ϰ�
gNPCTable[10006] =
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

--	С��
gNPCTable[10003] =
function(ctx, questid, queststep)

	if questid == 1 and queststep == 0 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "��������۸���ҩƷ���ӻ�������չ�������Ʒ���ܺ���Ŷ��", 0)
		ctx:AddContextNode(30, 240, "������㶫��", 2)
		ctx:AddContextNode(30, 255, "����", 3)
		ctx:AddContextNode(30, 270, "ûʲô��", 1)

	elseif questid == 1 and queststep == 1 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "ǰ���������ռ�ҩ�ĵ�ʱ�򱻰���սʿ͵Ϯ������֮�ඪ��һ�������ݣ����ܰ����һ�����?", 0)
		ctx:AddContextNode(30, 255, "��Ȼ����", 4)
		ctx:AddContextNode(30, 270, "û��", 1)

	elseif questid == 1 and queststep == 2 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "�㻹û���ܹ�����æ��ʵ����", 0)
		ctx:AddContextNode(30, 270, "�õ�", 1)

	elseif questid == 1 and queststep == 3 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "ʮ�ָ�л���ҿ��԰����͹�ȥ��ͬʱ������һ���سǾ��ᣬ�سǾ�����԰�����ص��������ĳ��С�", 0)
		ctx:AddContextNode(30, 255, "���ھ͹�ȥ", 5)
		ctx:AddContextNode(30, 270, "�ٵȵ�", 1)

	elseif questid == 1 and queststep == 4 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "��ô���������һ���������û��", 0)
		ctx:AddContextNode(30, 255, "�ҵ��ˣ�", 6)
		ctx:AddContextNode(30, 270, "û��", 1)

	elseif questid == 1 and queststep == 5 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "����3���ո����ٺ���˵���ɣ�", 0)
		ctx:AddContextNode(30, 270, "�õ�", 1)

	elseif questid == 1 and queststep == 6 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "��������һ������ҩ�ģ�Ϊ���κ���ϼɽ�ȣ�54�� 52�����ϲ��Ĳ�����������Ы�ӵ�β��1��������ȥ���˹�Ĺ�Ѽ�һ�°ɣ�", 0)
		ctx:AddContextNode(30, 255, "����", 7)
		ctx:AddContextNode(30, 270, "����", 1)

	elseif questid == 1 and queststep == 7 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "�ҵ���ĺ���Ϣ��", 0)
		ctx:AddContextNode(30, 255, "���Ѽ�����", 8)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 1 and queststep == 8 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "��ƭ���ˣ��Ͻ�����ȡ1ֻЫ��β�ͣ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 1 and queststep == 9 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "���ˣ��������ϲ��Ĳ������κ��ˣ��Ҹ��������õ�ҩ�ģ�������͹�ȥ��,���ϲ�����ϼɽ��(54, 52)����", 0)
		ctx:AddContextNode(30, 255, "���Ѿ��͹�ȥ��", 9)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 1 and queststep == 10 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "���ϲ�����ϼɽ��(54, 52)��,����͹�ȥ�ɡ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 1 and queststep == 11 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "���ϲ��ܿ����㣬��˵���°����㣬����ȥ��ϼɽ���������ɣ�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	elseif questid == 1 and queststep == 12 then
		ctx:Clear()
		ctx:AddContextNode(0, 0, "С��:", 0)
		ctx:AddContextNode(0, 20, "ȥ��ҩ��ʱ��������Ұ�޵�ŭ�𣬾����ǰ��������࣬����¡�", 0)
		ctx:AddContextNode(30, 270, "�ر�", 1)

	end

end

function ShowHelp(ctx, id)
	if id == 0 then
		ctx:AddContextNode(0, 0, "��Ϸ��������", 0)
		ctx:AddContextNode(0, 15, "�ո�:��ȡ��Ʒ", 0)
		ctx:AddContextNode(0, 30, "F9 :��ʾ����", 0)
		ctx:AddContextNode(0, 45, "F10:��ʾ����", 0)
		ctx:AddContextNode(0, 60, "M  :��ʾ���ͼ,���ͼ�����Ҽ���ס�����ƶ�", 0)
		ctx:AddContextNode(0, 90, "��ͼ���͵�: �߽����͵���Դ��ͣ��ܽ�ȥ��Ч", 0)
		ctx:AddContextNode(0, 120, "��ҽӵ�һ���������������ϵ� ����ָ��Ա", 0)
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
