--�ͻ���������ʾ�ű�

MirLog("����������ʾ�ű��ɹ�")

function CreateQuestDlg(dlg, ctx, player)
	MirLog("����������")

	--	Main quest 0
	local curstep = ctx:GetQuestStep(0)
	MirLog("Current step:"..curstep)

	if curstep >= 0 then
		--	Need tip
		--local questctx = dlg:PushQuestInfo()
		--local qx = questctx

		if curstep == 0 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "����(21,14)��������ָ��Աһ�ݼ���"
			qx.stTip.xReward = "��ҩ(С��)*5"
		elseif curstep == 4 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "����(21,14)��������ָ��Աһ��¹��"
			qx.stTip.xReward = "һ��ذ��"
		elseif curstep == 7 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "��ȡľ��"
		elseif curstep == 9 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "���޸��洬��ľ���͸��ӱߵ����"
			qx.stTip.xReward = "���500"
		elseif curstep == 10 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "��ȥ������ָ��Ա�㱨�������"
			qx.stTip.xReward = "��ҩ(С��)*5"
		elseif curstep == 11 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			local counter = ctx:GetQuestCounter(0)
			if counter <= 9 then
				qx.stTip.xRequire = "������ϼ�����("..counter.."/10)ֻ������"
			else
				qx.stTip.xRequire = "��ȥѰ������ָ��Ա"
			end
			qx.stTip.xReward = "����500"
		elseif curstep == 13 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "������ָ��Ա�Ի�"
		elseif curstep == 14 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			local counter = ctx:GetQuestCounter(0)
			if counter <= 9 then
				qx.stTip.xRequire = "������ϼ�����("..counter.."/10)ֻ����è��๳è"
			else
				qx.stTip.xRequire = "��ȥѰ������ָ��Ա"
			end
			qx.stTip.xReward = "����1000 ���2000"
		elseif curstep == 15 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "������7����������ָ��Ա��ȡ7���鼮���ǵñ�����һ���Ŷ��"
			MirLog("JOB"..player:GetHeroJob())
			if player:GetHeroJob() == 0 then
				qx.stTip.xReward = "��������"
			elseif player:GetHeroJob() == 1 then
				qx.stTip.xReward = "С����"
			elseif player:GetHeroJob() == 2 then
				qx.stTip.xReward = "������"
			end
		elseif curstep == 17 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "������ָ��Ա�Ի�"
		elseif curstep == 18 or curstep == 19 or curstep == 20 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "�������Ի�"
		elseif curstep == 25 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "����ϼɽ�ȸ����İ����˹�Ĺ���ҵ������ĺ���"
			--qx.stTip.xReward = "����800 ���1000"
		elseif curstep == 26 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "��������С������Ϣ"
			qx.stTip.xReward = "����800 ���1000"
		elseif curstep == 27 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ӣ�۳ɳ�"
			qx.stTip.xDescript = "��ӭ�����λش�������磬Ϊ������������Ϥ��Ϸ���������ɳ�����Ѱ��(21,14)��������ָ��Ա��ȡ��������"
			qx.stTip.xRequire = "�ٴ�Ѱ���������԰��㷢��������Ǳ����Ѱ��С��������һ����������"
		end

	end

	--	Main Quest 1
	--	Activate when quest 0 step >= 27
	if curstep >= 27 then
		local curstep1 = ctx:GetQuestStep(1)

		if curstep1 == 0 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "Ѱ��С������Ի�"
			qx.stTip.xReward = "�سǾ�*1"
		elseif curstep1 == 1 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "��С�����͵�Ŀ�ĵص�"
			--qx.stTip.xReward = "һ���سǾ�"
		elseif curstep1 == 2 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "�ҵ�������սʿ��ȡ��һ��������"
			qx.stTip.xReward = "��ҩ(����)*6 �سǾ�*3"
		elseif curstep1 == 3 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "Ѱ��С������Ի�"
			--qx.stTip.xReward = "һ���سǾ�"
		elseif curstep1 == 4 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "�ڰ����˹�Ĺ�еõ�һ��Ы�ӵ�β�ͣ�����С��"
			--qx.stTip.xReward = "�سǾ�*1"
		elseif curstep1 == 5 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "��С�������õ�ҩ�۽�����ϼɽ�ȵ����ϲ�(54,52)"
			qx.stTip.xReward = "����1500"
		elseif curstep1 == 6 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "��ȥѰ��С���Ի�"
			--qx.stTip.xReward = "����1500"
		elseif curstep1 == 7 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "���ϲ���Щ�������鷳�㣬ȥ��ϼɽ�Ⱥ����Ի�"
			--qx.stTip.xReward = "����1500"
		elseif curstep1 == 8 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "ɱ��һ�������˹�Ĺ������þ���"
			--qx.stTip.xReward = "����1500"
		elseif curstep1 == 9 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "��ȥ�����ϲ��㱨�������ȡ����"
			if player:GetHeroJob() == 0 then
				qx.stTip.xReward = "����1500 ���5000 ���Ϳ���".." �˻�"
			elseif player:GetHeroJob() == 1 then
				qx.stTip.xReward = "����1500 ���5000 ���Ϳ���".." ����"
			elseif player:GetHeroJob() == 2 then
				qx.stTip.xReward = "����1500 ���5000 ���Ϳ���".." ����"
			end
		elseif curstep1 == 10 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "�����ϲ����͵���Ҥ������һ������Ĺ�鼮���������ϲ�"
			qx.stTip.xReward = "������*1"
		elseif curstep1 == 11 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "ʹ���������������˹�Ĺ���������ɱ�����껤��������ص�ѫ�²��������ϲ�(������������þ�������ȡ��)"
			qx.stTip.xReward = "����50000 ���10000"
		elseif curstep1 == 12 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "�������ص�ѫ�£�̤��Ѱ�ҷ�ħ��½����;�������ħ�����Ի�"
			qx.stTip.xReward = "����ѫ��"
		elseif curstep1 == 13 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			local counter = ctx:GetQuestCounter(1)
			if counter <= 49 then
				qx.stTip.xRequire = "�������һ�㣬ɱ��("..counter.."/50)ֻǯ��������"
			else
				qx.stTip.xRequire = "��ȥ���ħ�����㱨�������"
			end
			qx.stTip.xReward = "����50000"
		elseif curstep1 == 14 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "ͨ����ħ�������͵�������Ӱ�֮���깭��������ȡ�÷�ħ����"
			qx.stTip.xReward = "����80000 ���10000"
		elseif curstep1 == 15 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "����ħ���Ž����ڿ�Ҥ������ѧ��"
			qx.stTip.xReward = "����20000 ���2000"
		elseif curstep1 == 16 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "ʧ̬�������Ӽ�����ħ���Ž�����ħ����"
			qx.stTip.xReward = "����20000"
		elseif curstep1 == 17 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "�ڿ�Ҥ��ĳ���Ͽ���л��5���綾��˿��������������ħ����"
			qx.stTip.xReward = "����80000 ���10000"
		elseif curstep1 == 18 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "�ڳ���Ͽ�����Ѫ��ʬ���ϵõ��˶�������"
			qx.stTip.xReward = "����30000 ���5000"
		elseif curstep1 == 19 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "�����˹�Ĺ�����þ��飬��Ҥ��ʬ�������������������������ͨ���İ�Ұ��������������������ȡ��������Ƭ��ͨ���˶������кϳ��Ϲ�����"
			qx.stTip.xReward = "����150000 ���20000"
		elseif curstep1 == 20 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "ɱ���Ӷ�ħ��ӡˮ���ٻ������Ķ�ħ����������Ʒ������ħ����"
			qx.stTip.xReward = "����150000 ���20000"
		elseif curstep1 == 21 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "���ź�ɫ��ëȥ������С�����ϱ���������ë����Դ"
			qx.stTip.xReward = "����20000"
		elseif curstep1 == 22 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			local counter = ctx:GetQuestCounter(1)
			if counter <= 49 then
				qx.stTip.xRequire = "ɱ��С���ϵ�("..counter.."/50)ֻ����"
			else
				qx.stTip.xRequire = "���ϱ��������"
			end
			qx.stTip.xReward = "����1000000 ���100000"
		elseif curstep1 == 23 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "�����ҵ�����ħ���ϻ������֮��"
			qx.stTip.xReward = "����30000 ���30000"
		elseif curstep1 == 24 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "������֮�Ĵ�����ӡ��Ӣ��"
			qx.stTip.xReward = "����10000"
		elseif curstep1 == 25 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "�귨̽��"
			qx.stTip.xDescript = "���ѳɳ�Ϊһλ�е�ʶ��Ӣ�ۣ�����������Ҫ��������귨��½�ĸ��ֶ�ħ������׼���ɡ�"
			qx.stTip.xRequire = "�������"
			qx.stTip.xReward = "����10000"
		end
	end

	-- Branch quest 0
	if player:GetHeroLevel() >= 15 then
		local bcurstep = ctx:GetQuestStep(50)
		if bcurstep == 0 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ѱ�Ҳر�ͼ"
			qx.stSummary.nType = 1
			qx.stTip.xDescript = "����ѧ�߶�ʧ��һ�ݿ�Ҥ�ر�ͼ����˵�Ǻ���װ��һ���Ľ�ʬ���ߵģ�������һ���ݲر�ͼ��"
			qx.stTip.xRequire = "������ѧ�߶Ի�"
			--qx.stTip.xReward = "����20000"
		elseif bcurstep == 1 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ѱ�Ҳر�ͼ"
			qx.stSummary.nType = 1
			qx.stTip.xDescript = "����ѧ�߶�ʧ��һ�ݿ�Ҥ�ر�ͼ����˵�Ǻ���װ��һ���Ľ�ʬ���ߵģ�������һ���ݲر�ͼ��"
			qx.stTip.xRequire = "�ӽ�ʬ�����һزر�ͼ"
			qx.stTip.xReward = "����3000 ���5000"
		elseif bcurstep == 2 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ѱ�Ҳر�ͼ"
			qx.stSummary.nType = 1
			qx.stTip.xDescript = "����ѧ�߶�ʧ��һ�ݿ�Ҥ�ر�ͼ����˵�Ǻ���װ��һ���Ľ�ʬ���ߵģ�������һ���ݲر�ͼ��"
			qx.stTip.xRequire = "������ѧ�߶Ի�"
			--qx.stTip.xReward = "����3000 ���5000"
		elseif bcurstep == 3 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ѱ�Ҳر�ͼ"
			qx.stSummary.nType = 1
			qx.stTip.xDescript = "����ѧ�߶�ʧ��һ�ݿ�Ҥ�ر�ͼ����˵�Ǻ���װ��һ���Ľ�ʬ���ߵģ�������һ���ݲر�ͼ��"
			local counter = ctx:GetQuestCounter(50)
			qx.stTip.xRequire = "����("..counter.."/20)ֻ��ʬ"
			qx.stTip.xReward = "����4000 ���5000"
		elseif bcurstep == 4 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ѱ�Ҳر�ͼ"
			qx.stSummary.nType = 1
			qx.stTip.xDescript = "����ѧ�߶�ʧ��һ�ݿ�Ҥ�ر�ͼ����˵�Ǻ���װ��һ���Ľ�ʬ���ߵģ�������һ���ݲر�ͼ��"
			qx.stTip.xRequire = "������ѧ�߻㱨���"
			qx.stTip.xReward = "����4000 ���5000"
		end
	end

	--	Branch quest 1
	if player:GetHeroLevel() >= 40 then
		local bcurstep1 = ctx:GetQuestStep(51)
		if bcurstep1 == 0 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ѫħ֮Ѫ"
			qx.stSummary.nType = 1
			qx.stTip.xDescript = "��������ôһ����˵������Ӣ����Ѫħս����ʱ��ʥսƴ�����һ��������Ѫħ�����˳���Ͽ������ڼ�����ʧ��ʱ�򽫴����׸��˷��񡣾ݴ�����ӵ���޾���ħ����"
			qx.stTip.xRequire = "��˫ͷѪħ����ȡ��Ѫħ֮Ѫ"
			--qx.stTip.xReward = "����1000"
		elseif bcurstep1 == 1 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ѫħ֮Ѫ"
			qx.stSummary.nType = 1
			qx.stTip.xDescript = "��������ôһ����˵������Ӣ����Ѫħս����ʱ��ʥսƴ�����һ��������Ѫħ�����˳���Ͽ������ڼ�����ʧ��ʱ�򽫴����׸��˷��񡣾ݴ�����ӵ���޾���ħ����"
			qx.stTip.xRequire = "Ѱ������ѯ�ʴ���"
			qx.stTip.xReward = "����1000"
		elseif bcurstep1 == 2 then
			local qx = dlg:PushQuestInfo()
			qx.stSummary.xQuestName = "Ѫħ֮Ѫ"
			qx.stSummary.nType = 1
			qx.stTip.xDescript = "��������ôһ����˵������Ӣ����Ѫħս����ʱ��ʥսƴ�����һ��������Ѫħ�����˳���Ͽ������ڼ�����ʧ��ʱ�򽫴����׸��˷��񡣾ݴ�����ӵ���޾���ħ����"
			qx.stTip.xRequire = "�ӳ��¶�ħ����ȡ�ù��ϵĻ�ѣ�������ظ�����"
			qx.stTip.xReward = "����250000 ���150000"
		end
	end

	--	Branch quest 2
	if player:GetHeroLevel() >= 55 then
		local mcurstep1 = ctx:GetQuestStep(1)
		local bcurstep2 = ctx:GetQuestStep(52)
		MirLog("Lv"..player:GetHeroLevel().."mstep"..mcurstep1.."bstep"..bcurstep2)
		if mcurstep1 >= 25 then
			if bcurstep2 == 0 then
				local qx = dlg:PushQuestInfo()
				qx.stSummary.xQuestName = "��ħ̫��"
				qx.stSummary.nType = 1
				qx.stTip.xDescript = "�ں���������������������ޱȵ����Ķ�ħ����ʹ�Ǻ���ħ��ҲҪ��η�����֡���������ɲ����������˵��Ҫ�ӽ������˱�����������ָ�ͽ���ˡ����Է�������ٻ�������ߵ�����������Щ�����Ѿ�������귨��½����µĶ�ħ�ˡ�"
				qx.stTip.xRequire = "�����֮�ŶԻ���ȡ������Ϣ"
				--qx.stTip.xReward = "���Է���"
			elseif bcurstep2 == 1 then
				local qx = dlg:PushQuestInfo()
				qx.stSummary.xQuestName = "��ħ̫��"
				qx.stSummary.nType = 1
				qx.stTip.xDescript = "�ں���������������������ޱȵ����Ķ�ħ����ʹ�Ǻ���ħ��ҲҪ��η�����֡���������ɲ����������˵��Ҫ�ӽ������˱�����������ָ�ͽ���ˡ����Է�������ٻ�������ߵ�����������Щ�����Ѿ�������귨��½����µĶ�ħ�ˡ�"
				qx.stTip.xRequire = "�ռ��߿ŷ���"
				qx.stTip.xReward = "���Է���*1 ����*1"
			end
		end
	end

--	Create End
end



--	��Ϸ����
--	id:2��ҳ id:1�ر� ����id<10000���Կ����ת����Ӧ��id��ʾ����
function ShowDonate(ctx, id)
	if id == 2 then
		ctx:AddContextNode(0, 91, "����ϷΪ�����Ϸ������ϲ������Ϸ��֧�ֱ���Ϸ�����������ڲ˵�(����E)��ѡ����Ϸ�������������ߵĿ�����ά��������������ϣ�������ڱ��б��У��뷢�ʼ���֪��������Ҫ��ȫ����ID��Ϣ����QQȺ��Ƭ��Ϣ��Ҳ�뷢�ʼ���֪��", 0)
		ctx:AddContextNode(0, 234,  "BackMIR����", 10001)
		ctx:AddContextNode(0, 247,  "������Ϸ����", 9999)
		ctx:AddContextNode(0, 260,  "�鿴�����б�", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 3 then
		ctx:AddContextNode(0, 26,  "*�� blu***@163.com(��������A)", 0)
		ctx:AddContextNode(0, 39,  "*���� 831***@163.com", 0)
		ctx:AddContextNode(0, 52,  "*���� che***@vip.qq.com", 0)
		ctx:AddContextNode(0, 65,  "*���� yes***@163.com(�ٷ�ֽ)", 0)
		ctx:AddContextNode(0, 78,  "*�� wh6***@163.com(�Ǻ�LP)", 0)
		ctx:AddContextNode(0, 91,  "*ܲ 188****4777", 0)
		ctx:AddContextNode(0, 104,  "*���� 181****0376(diahycts)", 0)
		ctx:AddContextNode(0, 117,  "*�� 182****5738", 0)
		ctx:AddContextNode(0, 130,  "*���� 139****8935(1123С��)", 0)
		ctx:AddContextNode(0, 143,  "*���� 181****6778(����)", 0)
		ctx:AddContextNode(0, 156,  "*���� che***@sina.com(ҹ��Er)", 0)
		ctx:AddContextNode(0, 169,  "*���� xyx***@163.com", 0)
		ctx:AddContextNode(0, 182,  "*���� jid***@163.com", 0)
		ctx:AddContextNode(0, 195,  "*�� lee***@sina.com", 0)
		ctx:AddContextNode(0, 208,  "*���� hua***@126.com", 0)
		ctx:AddContextNode(0, 221,  "*��� 984***@qq.com(�}����)", 0)
		ctx:AddContextNode(0, 234,  "*���� lvj***@163.com", 0)
		ctx:AddContextNode(0, 247,  "��һҳ", 4)
		ctx:AddContextNode(0, 260,  "������ҳ", 2)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 4 then
		ctx:AddContextNode(0, 26,  "*�� ssu***@126.com(ssunkaii)", 0)
		ctx:AddContextNode(0, 39,  "*��ǿ 130****7488", 0)
		ctx:AddContextNode(0, 52,  "*���� a67***@163.com(������)", 0)
		ctx:AddContextNode(0, 65,  "*���� wuj***@163.com(ݯݯ)", 0)
		ctx:AddContextNode(0, 78,  "*���� 187****7902(zxw75192)", 0)
		ctx:AddContextNode(0, 91,  "*���� 160***@qq.com", 0)
		ctx:AddContextNode(0, 104,  "*� wuh***@163.com", 0)
		ctx:AddContextNode(0, 117,  "*�� 370***@qq.com", 0)
		ctx:AddContextNode(0, 130,  "*�� 284***@qq.com", 0)
		ctx:AddContextNode(0, 143,  "*���� 105***@qq.com", 0)
		ctx:AddContextNode(0, 156,  "*��� i***@leafwind.me", 0)
		ctx:AddContextNode(0, 169,  "*���� 275***@qq.com", 0)
		ctx:AddContextNode(0, 182,  "*�� 152****1227", 0)
		ctx:AddContextNode(0, 195,  "*�Ѷ� 186****2397(���)", 0)
		ctx:AddContextNode(0, 208,  "*��ǿ chu***@qq.com(����Ʈ��)", 0)
		ctx:AddContextNode(0, 221,  "*�� 139****3776(��ʿ����)", 0)
		ctx:AddContextNode(0, 234,  "*���� 312***@qq.com(Blaveam)", 0)
		ctx:AddContextNode(0, 247,  "��һҳ", 5)
		ctx:AddContextNode(0, 260,  "������ҳ", 2)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 5 then
		ctx:AddContextNode(0, 26,  "*�� now***@sina.com(������)", 0)
		ctx:AddContextNode(0, 39,  "*ѩ�� 163***@163.com", 0)
		ctx:AddContextNode(0, 52,  "*��ƽ 631***@qq.com", 0)
		ctx:AddContextNode(0, 65,  "*�Ĵ� 159****1436(�������)", 0)
		ctx:AddContextNode(0, 78,  "*�� 159****6625", 0)
		ctx:AddContextNode(0, 91,  "*��ƽ ljp***@126.com(�ǿ�)", 0)
		ctx:AddContextNode(0, 104,  "*���� 905***@qq.com", 0)
		ctx:AddContextNode(0, 117,  "*�� 372***@qq.com", 0)
		ctx:AddContextNode(0, 130,  "*��ƽ 414***@qq.com", 0)
		ctx:AddContextNode(0, 143,  "*�� 189****1224", 0)
		ctx:AddContextNode(0, 156,  "*˶ hiv***@163.com", 0)
		ctx:AddContextNode(0, 169,  "*־�� liz***@sohu.com(������1314)", 0)
		ctx:AddContextNode(0, 182,  "*�� 138****5350", 0)
		ctx:AddContextNode(0, 195,  "*��ΰ 159****9849", 0)
		ctx:AddContextNode(0, 208,  "*ɳɳ 104***@qq.com", 0)
		ctx:AddContextNode(0, 221,  "*С�� 134****7024", 0)
		ctx:AddContextNode(0, 234,  "*���� 187****1008", 0)
		ctx:AddContextNode(0, 260,  "������ҳ", 2)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 6 then
		ctx:AddContextNode(0, 26,  "����һ��", 0)
		ctx:AddContextNode(0, 39,  "*�� 151****7762", 0)
		ctx:AddContextNode(0, 52,  "*��� 136****3961(��������)", 0)
		ctx:AddContextNode(0, 65,  "*�ݱ� 189****8669", 0)
		ctx:AddContextNode(0, 78,  "*��� 138****2212", 0)
		ctx:AddContextNode(0, 91,  "*���� 139****2609", 0)
		ctx:AddContextNode(0, 104,  "*���� 152****5159", 0)
		ctx:AddContextNode(0, 117,  "*Ѯ 139****7085", 0)
		ctx:AddContextNode(0, 130,  "*�޻� 147***@qq.com", 0)
		ctx:AddContextNode(0, 143,  "*�� 182****0219", 0)
		ctx:AddContextNode(0, 156,  "*�� 515***@qq.com", 0)
		ctx:AddContextNode(0, 169,  "*���� 136****9638(��Į����)", 0)
		ctx:AddContextNode(0, 182,  "*�� 372***@qq.com(����Ķ���)", 0)
		ctx:AddContextNode(0, 195,  "*��ƽ 631***@qq.com", 0)
		--[[
		ctx:AddContextNode(0, 26,  "*�� ssu***@126.com(ssunkaii)", 0)
		ctx:AddContextNode(0, 39,  "*��ǿ 130****7488", 0)
		ctx:AddContextNode(0, 52,  "*���� a67***@163.com(������)", 0)
		ctx:AddContextNode(0, 65,  "*���� wuj***@163.com(ݯݯ)", 0)
		ctx:AddContextNode(0, 78,  "*���� 187****7902(zxw75192)", 0)
		ctx:AddContextNode(0, 91,  "*���� 160***@qq.com", 0)
		ctx:AddContextNode(0, 104,  "*� wuh***@163.com", 0)
		ctx:AddContextNode(0, 117,  "*�� 370***@qq.com", 0)
		ctx:AddContextNode(0, 130,  "*�� 284***@qq.com", 0)
		ctx:AddContextNode(0, 143,  "*���� 105***@qq.com", 0)
		ctx:AddContextNode(0, 156,  "*��� i***@leafwind.me", 0)
		ctx:AddContextNode(0, 169,  "*���� 275***@qq.com", 0)
		ctx:AddContextNode(0, 182,  "*�� 152****1227", 0)
		ctx:AddContextNode(0, 195,  "*�Ѷ� 186****2397(���)", 0)
		ctx:AddContextNode(0, 208,  "*��ǿ chu***@qq.com(����Ʈ��)", 0)
		ctx:AddContextNode(0, 221,  "*�� 139****3776(��ʿ����)", 0)
		ctx:AddContextNode(0, 234,  "*���� 312***@qq.com(Blaveam)", 0)
		ctx:AddContextNode(0, 247,  "��һҳ", 5)
		ctx:AddContextNode(0, 260,  "������ҳ", 2)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
		]]
	elseif id == 9999 then
		ctx:AddContextNode(0, 0, "BackMIRΪһ����ע������һ�����Ѫ�Ķ�����Ϸ��������������������Ѫ������زģ��زİ�ȨΪʢ�����У�������ϷΪ�����Ϸ���������κι�����ߣ�����ȼ�������VIP�ȵȵ�ӯ����ʽ������ϷΪ����ѧϰ֮��Ѫ�����κ�ӯ����Ϊ���κ��˽�����Ϸ����ӯ��Ŀ�ľ��������޹ء�����֧�ֱ���Ϸ�Ŀ�����ά������ʹ�����淽ʽ���о�����", 0)
		ctx:AddContextNode(0, 247,  "������ҳ", 2)
		ctx:AddContextNode(0, 260,  "֧��������", 10000)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	end
end



--	��Ϸ��������
--	id:2��ҳ id:1�ر� ����id<10000���Կ����ת����Ӧ��id��ʾ����
function ShowHelp(ctx, id)
	if id == 2 then
		ctx:AddContextNode(0, 0, " ", 0)
		ctx:AddContextNode(72, 39, "[����������ݼ�]", 0)
		ctx:AddContextNode(0, 52, "����[F9]", 0)
		ctx:AddContextNode(80, 52, "����[F10]", 0)
		ctx:AddContextNode(160, 52, "����[F11]", 0)
		ctx:AddContextNode(0, 65,  "���ͼ[TAB]", 0)
		ctx:AddContextNode(80, 65, "����[Q]", 0)
		ctx:AddContextNode(160, 65, "����[M]", 0)
		ctx:AddContextNode(0, 91, "����ϷΪ�����Ϸ������ϲ������Ϸ��֧�ֱ���Ϸ�����������ڲ˵���ѡ����Ϸ�������������ߵĿ�����ά��", 0)
		ctx:AddContextNode(0, 234,  "BackMIR����", 10001)
		ctx:AddContextNode(0, 247,  "������Ϸ����", 9999)
		ctx:AddContextNode(0, 260,  "��Ϸ��������", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id ==  3 then
		ctx:AddContextNode(78, 0, "[��Ϸ��������]", 0)
		ctx:AddContextNode(0, 26, "��μ�ȡ��Ʒ", 4)
		ctx:AddContextNode(80, 26, "�ǰ���Ʒ��θ�С��", 5)
		ctx:AddContextNode(0, 39, "���������", 6)
		ctx:AddContextNode(80, 39, "�����������", 7)
		ctx:AddContextNode(160, 39, "���ʹ�ü���", 8)
		ctx:AddContextNode(0, 52, "��θ�λ��ɱ", 9)
		ctx:AddContextNode(80, 52, "����л�ȫ��", 10)
		ctx:AddContextNode(160, 52, "���������Ϸ", 11)
		ctx:AddContextNode(0, 65, "������", 12)
		ctx:AddContextNode(80, 65, "ʹ�ô��ͽ�ָ", 13)
		ctx:AddContextNode(160, 65, "������Ʒ����", 14)
		ctx:AddContextNode(0, 78, "�浵ʧ��", 15)
		ctx:AddContextNode(80, 78, "�ֽ�ϳ�װ��", 16)
		ctx:AddContextNode(160, 78, "����ʯǬ��ʯ", 17)
		ctx:AddContextNode(0, 91, "��Ӣ�������", 18)
		ctx:AddContextNode(80, 91, "���ڲر�ͼ", 19)
		ctx:AddContextNode(160, 91, "����������Ʒ", 20)
		ctx:AddContextNode(0, 104, "�鿴���װ��", 21)
		ctx:AddContextNode(0, 247,  "��һҳ", 3)
		ctx:AddContextNode(0, 260,  "������ҳ", 2)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 4 then
		ctx:AddContextNode(0, 0, "����վ����Ʒ�Ϸ������ո�����м�ȡ���������߰�סCtrl��Ȼ����������Ʒ���ɼ�ȡ��", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 5 then
		ctx:AddContextNode(0, 0, "���ǰ���Ʒ���ڵ��ϣ��رտͻ��ˣ���Ҫ�رշ�����������һ���ţ�����ͬ�ط����м�ȡ������ע��3������Ʒ���Զ���ʧ��", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 6 then
		ctx:AddContextNode(0, 0, "ѡ�б�����Ʒ����������Ʒ�����̵괰�ڼ��ɣ��̵괰�ڼ۸���ʾ��Ϊ��Ʒ�����ļ۸�", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 7 then
		ctx:AddContextNode(0, 0, "����һ���ȼ���ѧϰ��ͬ�鼮����������Ӧ���ܣ���3��������Ҫ�ض��鼮3����", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 8 then
		ctx:AddContextNode(0, 0, "ѧϰ���ܺ󣬴򿪼��ܴ��ڣ��������ͼ�꣬����F1-F8����ʹ�ð���������Ӧ��������ʹ�á������������������ͷţ�Ҳ�޷����ÿ�ݼ���", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 9 then
		ctx:AddContextNode(0, 0, "������ɱ�����󣬳�����סShift��������������ǿ�й�����", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 10 then
		ctx:AddContextNode(0, 0, "������Ϸ�󣬰�סAlt��Ȼ��Enter�������л�ȫ���봰��ģʽ��", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 11 then
		ctx:AddContextNode(0, 0, "������Ҫ����������ҵ���Ϸ��������ֻ���ڵ�½������д�ͻ���IP�����������������͵���ģʽ������������Ϸ���ɡ�������Ҫ�Լ�������Ϸ����������·�������ֱ����д����IP���ɣ�·�����û��迪��·������DMZ��˿�ӳ�䣬������IP��д������IP����ѡ��������������������ģʽ�������ڿͻ���IP����д�Լ��ľ�����IP�������ɡ�������IP�������Ѽ����ú��Ѽ����Լ�����Ϸ��", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 12 then
		ctx:AddContextNode(0, 0, "����ʱ����ز����ƣ�ֻ�����˼������ģ�͡�����@createteam���ɿ����µĶ��飬Ҫ��Ӷ�Ա������Ҫ��ͬһ�ŵ�ͼ��ѡ����һ����ң���Alt+A������ӱ����ҽ�����飬Ҫɾ����Ա����ѡ����Һ�Alt+K�����߳�ĳλ��ҡ��������Լ��˳�Ŀǰ�Ķ��飬����@quitteam���ɡ�", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 13 then
		ctx:AddContextNode(0, 0, "�õ����ͽ�ָ֮�󣬽���������ϣ�����@move x,y���ɣ���ȴʱ��15�룬���ֵ�ͼ�޷����д��͡����ͽ�ָ�����ڸ������BOSS����ȡ�ã�Ҳ����ͨ���ر�ͼ�еı���ȡ�á�", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 14 then
		ctx:AddContextNode(0, 0, "��������Ʒ���Ӻ�����Ʒ����סAlt��������ʾ���������е��ӵ���Ʒ��", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 15 then
		ctx:AddContextNode(0, 0, "����ʾ����Ϊ�մ浵ʧ��ʱ�����鱳����Ʒ�����޷��������Եģ����޷��浵�ģ�Ҫ�浵�뽫�޷��浵����Ʒ���ڵ��ϣ�Ȼ���ٽ��д浵��", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 16 then
		ctx:AddContextNode(0, 0, "������һ����������Ϊ������ħ����������װ��ʱ�򣬼��ɽ���װ���ֽ⡣�򿪷ֽⴰ�ڣ���װ���ŵ�������һ���У�������ʾ�÷ֽ⽫�õ�����Ʒ���ֽ���ƷΪ��װ���ȼ�����һ���ľ���ʯ��������ú;���ʯ��ͬ�ȼ���װ��ʱ�򣬴�װ���ֽⴰ�ڣ����Ҽ�ͷ�л����ϳɽ��棬��ʯͷ�����Ϸ�5�������е�һ���У�װ���������·����ӣ����ɽ���װ��������", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 17 then
		ctx:AddContextNode(0, 0, "�ֽ⼫Ʒװ�����õ�����ʯ������ʯ���������;���ʯ������ͬ�����µ�װ����20������ʯ������װ���ϳɽ��������Ϻϳ�Ϊһ���߼��𾫻�ʯ��Ǭ��ʯ�����ڼ�Ʒװ�����Ὣ���ӵļ�Ʒ��������ٷ���һ�Ρ�", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 18 then
		ctx:AddContextNode(0, 0, "����ͼ����һ������ˢ����Ӣ�ֺ�����֣��ù������װ�����ʣ�����װ�����ּ�Ʒ���ʾ�����ͨ�ָߺܶࡣ����رվ�Ӣ�������ɹ��ܣ�����ϷĿ¼���ҵ�cfg.ini���������༭GENELITEMONS=0���ɡ�", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 19 then
		ctx:AddContextNode(0, 0, "�Ҽ�ʹ�òر�ͼ�������ض���ͼ���ض����꿪�����ص�ͼ�����޷��������������Ļ���Ͻ���ʾ��ȷλ�á��ر�ͼ�������������BOSS����ȡ�á�", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 20 then
		ctx:AddContextNode(0, 0, "������Ʒʱ�����ҩ��ħ��ҩ�����־���ʱ����סCtrl���򼴿�һ�ι���һ��(20��)����Ʒ��", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 21 then
		ctx:AddContextNode(0, 0, "ѡ��һ����ң���סAlt��ͬʱ��һ��V���ɲ鿴�Է����װ����", 0)
		ctx:AddContextNode(0, 260,  "����������ҳ", 3)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 9998 then
		ctx:AddContextNode(0, 260,  "������ҳ", 2)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	elseif id == 9999 then
		ctx:AddContextNode(0, 0, "BackMIRΪһ����ע������һ�����Ѫ�Ķ�����Ϸ��������������������Ѫ������زģ��زİ�ȨΪʢ�����У�������ϷΪ�����Ϸ���������κι�����ߣ�����ȼ�������VIP�ȵȵ�ӯ����ʽ������ϷΪ����ѧϰ֮��Ѫ�����κ�ӯ����Ϊ���κ��˽�����Ϸ����ӯ��Ŀ�ľ��������޹ء�����֧�ֱ���Ϸ�Ŀ�����ά������ʹ�����淽ʽ���о�����", 0)
		ctx:AddContextNode(0, 247,  "������ҳ", 2)
		ctx:AddContextNode(0, 260,  "֧��������", 10000)
		ctx:AddContextNode(0, 273,  "�ر�", 1)
	end
end
