// BMLauncherDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"

#pragma comment(lib,"Ws2_32.lib")
#include <winsock2.h>

#include "BMLauncher.h"
#include "BMLauncherDlg.h"
#include "LauncherUtils.h"
#include "SimpleIni.h"
#include "BMHttpManager.h"
#include "EasyUtils.h"
#include "cJSON.h"

#include <fastdelegate.h>
#include <FastDelegateBind.h>

#include <Shlwapi.h>
#pragma comment(lib, "shlwapi.lib")

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define PAGE_SINGLE				0
#define PAGE_ONLINESERVER		1
#define PAGE_ONLINECLIENT		2
#define PAGE_DONATE				3
#define PAGE_REGISTER			4

//////////////////////////////////////////////////////////////////////////
using namespace DuiLib;

// ����Ӧ�ó��򡰹��ڡ��˵���� CAboutDlg �Ի���

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// �Ի�������
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

// ʵ��
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()


// CBMLauncherDlg �Ի���




CBMLauncherDlg::CBMLauncherDlg(CWnd* pParent /*=NULL*/)
	: CDuiDialog(CBMLauncherDlg::IDD, pParent, "skin.xml")
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CBMLauncherDlg::DoDataExchange(CDataExchange* pDX)
{
	CDuiDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CBMLauncherDlg, CDuiDialog)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


// CBMLauncherDlg ��Ϣ�������

BOOL CBMLauncherDlg::OnInitDialog()
{
	CDuiDialog::OnInitDialog();

	// ��������...���˵�����ӵ�ϵͳ�˵��С�

	// IDM_ABOUTBOX ������ϵͳ���Χ�ڡ�
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// ���ô˶Ի����ͼ�ꡣ��Ӧ�ó��������ڲ��ǶԻ���ʱ����ܽ��Զ�
	//  ִ�д˲���
	SetIcon(m_hIcon, TRUE);			// ���ô�ͼ��
	SetIcon(m_hIcon, FALSE);		// ����Сͼ��

	// TODO: �ڴ���Ӷ���ĳ�ʼ������
	LoadConfig();

	//	���ص�½�ļ�
	DownloadConfigFile();

	return TRUE;  // ���ǽ��������õ��ؼ������򷵻� TRUE
}

void CBMLauncherDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDuiDialog::OnSysCommand(nID, lParam);
	}
}

// �����Ի��������С����ť������Ҫ����Ĵ���
//  �����Ƹ�ͼ�ꡣ����ʹ���ĵ�/��ͼģ�͵� MFC Ӧ�ó���
//  �⽫�ɿ���Զ���ɡ�

void CBMLauncherDlg::OnPaint()
{
	CDuiDialog::OnPaint();
	/*if (IsIconic())
	{
		CPaintDC dc(this); // ���ڻ��Ƶ��豸������

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// ʹͼ���ڹ����������о���
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// ����ͼ��
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}*/
}

//���û��϶���С������ʱϵͳ���ô˺���ȡ�ù��
//��ʾ��
HCURSOR CBMLauncherDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

void CBMLauncherDlg::DownloadConfigFile()
{
	char szDestPath[MAX_PATH] = {0};
	GetRootPath(szDestPath);
	strcat(szDestPath, "/config/url.ini");

	if(!PathFileExists(szDestPath))
	{
#ifdef _DEBUG
		if(!EasyDownloadFile("http://sryanyuan.github.io/web/config/url_d.ini", szDestPath))
#else
		if(!EasyDownloadFile("http://sryanyuan.github.io/web/config/url.ini", szDestPath))
#endif
		{
			MessageBox("�޷����������ļ�", "����", MB_ICONERROR | MB_OK);
			return;
		}
	}

	char* pContent = EasyReadFile(szDestPath);
	if(NULL == pContent)
	{
		MessageBox("�޷���ȡ�����ļ�", "����", MB_ICONERROR | MB_OK);
		return;
	}

	CSimpleIniA xIniFile;
	if(SI_OK != xIniFile.LoadFile(szDestPath))
	{
		MessageBox("�޷����������ļ�", "����", MB_ICONERROR | MB_OK);
		delete[] pContent;
		return;
	}

	const char* pszRegUrl = xIniFile.GetValue("CONFIG", "REGURL");
	if(NULL != pszRegUrl)
	{
		m_xRegHttpAddr = pszRegUrl;
	}

	delete[] pContent;
	pContent = NULL;
}

void CBMLauncherDlg::LoadConfig()
{
	CSimpleIniA xIniFile;

	char szPath[MAX_PATH];
	GetRootPath(szPath);
	strcat(szPath, "/launcher.ini");
	if(!PathFileExists(szPath))
	{
		return;
	}

	SI_Error ret = xIniFile.LoadFile(szPath);
	if(SI_OK != ret)
	{
		return;
	}

	const char* pszValue = xIniFile.GetValue("config", "port_single", "");
	if(NULL != pszValue &&
		0 != strlen(pszValue))
	{
		m_pm.FindControl("edit_port_single")->SetText(pszValue);
	}

	pszValue = xIniFile.GetValue("config", "ip_onlineserver", "");
	if(NULL != pszValue &&
		0 != strlen(pszValue))
	{
		m_pm.FindControl("edit_ip_onlineserver")->SetText(pszValue);
	}

	pszValue = xIniFile.GetValue("config", "port_onlineserver", "");
	if(NULL != pszValue &&
		0 != strlen(pszValue))
	{
		m_pm.FindControl("edit_port_onlineserver")->SetText(pszValue);
	}

	pszValue = xIniFile.GetValue("config", "ip_onlineclient", "");
	if(NULL != pszValue &&
		0 != strlen(pszValue))
	{
		m_pm.FindControl("edit_ip_onlineclient")->SetText(pszValue);
	}

	pszValue = xIniFile.GetValue("config", "port_onlineclient", "");
	if(NULL != pszValue &&
		0 != strlen(pszValue))
	{
		m_pm.FindControl("edit_port_onlineclient")->SetText(pszValue);
	}

	pszValue = xIniFile.GetValue("config", "account_onlineclient", "");
	if(NULL != pszValue &&
		0 != strlen(pszValue))
	{
		m_pm.FindControl("edit_account_onlineclient")->SetText(pszValue);
	}

	pszValue = xIniFile.GetValue("config", "password_onlineclient", "");
	if(NULL != pszValue &&
		0 != strlen(pszValue))
	{
		m_pm.FindControl("edit_password_onlineclient")->SetText(pszValue);
	}
}

void CBMLauncherDlg::SaveConfig()
{
	CSimpleIniA xIniFile;

	char szPath[MAX_PATH];
	GetRootPath(szPath);
	strcat(szPath, "/launcher.ini");

	xIniFile.SetValue("config", "port_single", m_pm.FindControl("edit_port_single")->GetText());

	xIniFile.SetValue("config", "ip_onlineserver", m_pm.FindControl("edit_ip_onlineserver")->GetText());

	xIniFile.SetValue("config", "port_onlineserver", m_pm.FindControl("edit_port_onlineserver")->GetText());

	xIniFile.SetValue("config", "ip_onlineclient", m_pm.FindControl("edit_ip_onlineclient")->GetText());

	xIniFile.SetValue("config", "port_onlineclient", m_pm.FindControl("edit_port_onlineclient")->GetText());

	xIniFile.SetValue("config", "account_onlineclient", m_pm.FindControl("edit_account_onlineclient")->GetText());

	xIniFile.SetValue("config", "password_onlineclient", m_pm.FindControl("edit_password_onlineclient")->GetText());

	xIniFile.SaveFile(szPath);
}


//////////////////////////////////////////////////////////////////////////
void CBMLauncherDlg::Notify(TNotifyUI& msg)
{
	const char* pszSenderName = msg.pSender->GetName();
	CTabLayoutUI* pLayout = (CTabLayoutUI*)m_pm.FindControl("modelayout");
	int nCurSel = pLayout->GetCurSel();

	if(msg.sType == DUI_MSGTYPE_CLICK)
	{
		if(0 == _tcscmp(pszSenderName, "button_quit")) {
			SaveConfig();
			OnCancel();
		}
		else if(0 == _tcscmp(pszSenderName, "option_single"))
		{
			SwitchTabLayout(PAGE_SINGLE);
		}
		else if(0 == _tcscmp(pszSenderName, "option_onlineserver"))
		{
			SwitchTabLayout(PAGE_ONLINESERVER);
		}
		else if(0 == _tcscmp(pszSenderName, "option_onlineclient"))
		{
			SwitchTabLayout(PAGE_ONLINECLIENT);
		}
		else if(0 == _tcscmp(pszSenderName, "option_donate"))
		{
			SwitchTabLayout(PAGE_DONATE);
		}
		else if(0 == _tcscmp(pszSenderName, "option_register"))
		{
			SwitchTabLayout(PAGE_REGISTER);
		}
		else if(0 == _tcscmp(pszSenderName, "button_login_single") ||
			0 == _tcscmp(pszSenderName, "button_login_onlineserver") ||
			0 == _tcscmp(pszSenderName, "button_login_onlineclient"))
		{
			DoLogin(nCurSel);
		}
		else if(0 == _tcscmp(pszSenderName, "button_diagnosis"))
		{
			DoDiagnosis();
		}
		else if(0 == _tcscmp(pszSenderName, "button_patcher"))
		{
			char szPath[MAX_PATH];
			GetRootPath(szPath);
			strcat(szPath, "\\patcher\\*.zip");
			Launcher_CheckPatcher(szPath);
		}
		else if(0 == _tcscmp(pszSenderName, "button_mailverify"))
		{
			DoMailVerify();
		}
		else if(0 == _tcscmp(pszSenderName, "button_reg"))
		{
			DoRegAccount();
		}
	}

	__super::Notify(msg);
}


void CBMLauncherDlg::SwitchTabLayout(int _nTabPage)
{
	CTabLayoutUI* pLayout = (CTabLayoutUI*)m_pm.FindControl("modelayout");
	if(NULL == pLayout)
	{
		return;
	}

	pLayout->SelectItem(_nTabPage);

	if(_nTabPage == PAGE_DONATE)
	{
		static bool s_bLoaded = false;

		if(!s_bLoaded)
		{
			CWebBrowserUI* pWeb = (CWebBrowserUI*)m_pm.FindControl("browser");
			pWeb->Navigate2("http://sryanyuan.github.io/web");
			s_bLoaded = true;
		}
	}
}

void CBMLauncherDlg::DoMailVerify()
{
	const char* pszMailAddr = m_pm.FindControl("edit_reg_mailverify")->GetText();
	if(NULL == pszMailAddr ||
		strlen(pszMailAddr) == 0 ||
		strlen(pszMailAddr) > 49)
	{
		MessageBox("�Ƿ����ʼ���ַ", "����", MB_ICONERROR | MB_OK);
		return;
	}

	string xMailAddr = pszMailAddr;
	if(string::npos == xMailAddr.find('@'))
	{
		MessageBox("�Ƿ����ʼ���ַ", "����", MB_ICONERROR | MB_OK);
		return;
	}

	if(m_xRegHttpAddr.empty())
	{
		MessageBox("�޷���������ַ", "����", MB_ICONERROR | MB_OK);
		return;
	}

	char szUrl[MAX_PATH];
	sprintf(szUrl, "%s/mailverify?mail=%s", m_xRegHttpAddr.c_str(), pszMailAddr);

	if(!BMHttpManager::GetInstance()->DoGetRequestSync(szUrl, fastdelegate::bind(&CBMLauncherDlg::OnMailVerifyResult, this)))
	{
		if(m_xRegHttpAddr.empty())
		{
			MessageBox("����ʱ��ʧ��", "����", MB_ICONERROR | MB_OK);
		}
	}
}

void CBMLauncherDlg::OnMailVerifyResult(const char* _pData, size_t _uLen)
{
	cJSON* pRoot = cJSON_Parse(_pData);
	if(NULL == pRoot)
	{
		MessageBox("�޷�����json����", "����", MB_ICONERROR | MB_OK);
		return;
	}

	cJSON* pResult = cJSON_GetObjectItem(pRoot, "errcode");
	int nRet = pResult->valueint;

	cJSON* pErrMsg = cJSON_GetObjectItem(pRoot, "errmsg");
	const char* pszMsg = pErrMsg->valuestring;

	if(0 != nRet)
	{
		char szErrMsg[MAX_PATH];
		sprintf(szErrMsg, "����ʧ��:%s", pszMsg);
		ErrorMsgBox(szErrMsg);
		return;
	}
	else
	{
		MessageBox("����ɹ�����ע���½��������ʼ�����û�в��յ����������������ڣ���ѡ���ٴ���֤", "��ʾ", MB_OK | MB_ICONINFORMATION);

		m_pm.FindControl("edit_reg_regkey")->SetText(pszMsg);
	}
}

void CBMLauncherDlg::DoRegAccount()
{
	if(m_xRegHttpAddr.empty())
	{
		MessageBox("�޷���������ַ", "����", MB_ICONERROR | MB_OK);
		return;
	}

	const char* pszRegKey = m_pm.FindControl("edit_reg_regkey")->GetText();
	const char* pszAccount = m_pm.FindControl("edit_reg_account")->GetText();
	const char* pszPassword = m_pm.FindControl("edit_reg_password")->GetText();
	const char* pszMailAddr = m_pm.FindControl("edit_reg_mailverify")->GetText();

	if(NULL == pszMailAddr ||
		strlen(pszMailAddr) == 0 ||
		strlen(pszMailAddr) > 49)
	{
		MessageBox("�Ƿ����ʼ���ַ", "����", MB_ICONERROR | MB_OK);
		return;
	}
	string xMailAddr = pszMailAddr;
	if(string::npos == xMailAddr.find('@'))
	{
		MessageBox("�Ƿ����ʼ���ַ", "����", MB_ICONERROR | MB_OK);
		return;
	}


	if(NULL == pszRegKey ||
		NULL == pszAccount ||
		NULL == pszPassword)
	{
		ErrorMsgBox("��������Կ���˻�������");
		return;
	}

	if(strlen(pszRegKey) == 0 ||
		strlen(pszRegKey) > 49)
	{
		ErrorMsgBox("��Կ�������");
		return;
	}

	if(strlen(pszAccount) < 5 ||
		strlen(pszAccount) > 19)
	{
		ErrorMsgBox("�˻��������(5-19�ַ�)");
		return;
	}

	if(strlen(pszPassword) < 5 ||
		strlen(pszPassword) > 19)
	{
		ErrorMsgBox("�����������(5-19�ַ�)");
		return;
	}

	char szUrl[MAX_PATH];
	sprintf(szUrl, "%s/regaccount?mail=%s&key=%s&account=%s&password=%s", m_xRegHttpAddr.c_str(), pszMailAddr, pszRegKey, pszAccount, pszPassword);

	if(!BMHttpManager::GetInstance()->DoGetRequestSync(szUrl, fastdelegate::bind(&CBMLauncherDlg::OnRegAccountResult, this)))
	{
		ErrorMsgBox("����ʧ�ܻ�ʱ");
	}
}

void CBMLauncherDlg::OnRegAccountResult(const char* _pData, size_t _uLen)
{
	cJSON* pRoot = cJSON_Parse(_pData);
	if(NULL == pRoot)
	{
		MessageBox("�޷�����json����", "����", MB_ICONERROR | MB_OK);
		return;
	}

	cJSON* pResult = cJSON_GetObjectItem(pRoot, "errcode");
	int nRet = pResult->valueint;

	cJSON* pErrMsg = cJSON_GetObjectItem(pRoot, "errmsg");
	const char* pszMsg = pErrMsg->valuestring;

	if(0 != nRet)
	{
		char szErrMsg[MAX_PATH];
		sprintf(szErrMsg, "����ʧ��:%s", pszMsg);
		ErrorMsgBox(szErrMsg);
		return;
	}
	else
	{
		MessageBox("�������ύ����ע���½��������ʼ�����û�в��յ�����������������", "��ʾ", MB_OK | MB_ICONINFORMATION);
	}
}

void CBMLauncherDlg::DoLogin(int _nPage)
{
	if(_nPage == PAGE_SINGLE)
	{
		//	test port
		const char* pszPort = m_pm.FindControl("edit_port_single")->GetText();
		int nPort = atoi(pszPort);

		Launcher_Single(nPort);
	}
	else if(_nPage == PAGE_ONLINESERVER)
	{
		const char* pszIp = m_pm.FindControl("edit_ip_onlineserver")->GetText();
		const char* pszPort = m_pm.FindControl("edit_port_onlineserver")->GetText();
		int nPort = atoi(pszPort);

		Launcher_Server(pszIp, nPort);
	}
	else if(_nPage == PAGE_ONLINECLIENT)
	{
		const char* pszIp = m_pm.FindControl("edit_ip_onlineclient")->GetText();
		const char* pszPort = m_pm.FindControl("edit_port_onlineclient")->GetText();
		int nPort = atoi(pszPort);
		const char* pszAccount = m_pm.FindControl("edit_account_onlineclient")->GetText();
		const char* pszPassword = m_pm.FindControl("edit_password_onlineclient")->GetText();

		Launcher_Client(pszIp, nPort, pszAccount, pszPassword);
	}
}

void CBMLauncherDlg::DoDiagnosis()
{
	//	ch path
	char szPath[MAX_PATH];
	GetModuleFileName(NULL, szPath, sizeof(szPath));
	PathRemoveFileSpec(szPath);

	for(int i = 0; i < strlen(szPath); ++i)
	{
		if(0 == szPath[i])
		{
			break;
		}

		if(szPath[i] < 0)
		{
			MessageBox("��⵽����·�����벻Ҫ����Ϸ���ڴ������ĵ�·���С�   Exp:c:\\�½��ļ���\\backmir.exe �ʹ��������ġ�Ҳ��Ҫֱ�ӷ��������ϡ�",
				"����",
				MB_OK | MB_ICONERROR);
			return;
		}
	}

	int nColorDepth = CheckDisplayColorDepth();
	if(32 != nColorDepth)
	{
		MessageBox("��⵽��ǰ��ʾ��ɫ����Ϊ32λ�����������ϵ���Ҽ���ѡ����Ļ�ֱ��ʣ�������ҳ���ϵ���߼����ã��г�����ģʽ��Ȼ��ѡ�е�ǰ�ֱ����µ����ɫ��32λ�������ȷ�����ɡ�",
			"����",
			MB_OK | MB_ICONERROR);
		return;
	}

	MessageBox("�������л���һ�����������޷����У�������Ϸ�˿��Ƿ�ռ�á�����E6������ر�I7�������ĳ��̼߳�����",
		"��ʾ",
		MB_OK | MB_ICONINFORMATION);
}