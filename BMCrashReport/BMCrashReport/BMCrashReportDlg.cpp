// BMCrashReportDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "BMCrashReport.h"
#include "BMCrashReportDlg.h"
#include "../../../../CommonModule/CommandLineHelper.h"
#include "../../../../CommonModule/ZipDataReader.h"
#include <direct.h>
#include <Shlwapi.h>

#ifdef _DEBUG
#pragma comment(lib, "ziparchive_d.lib")
#else
#pragma comment(lib, "ziparchive.lib")
#endif
#pragma comment(lib, "shlwapi.lib")

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


//////////////////////////////////////////////////////////////////////////
const char* GetRootPath()
{
	static char s_szRootPath[MAX_PATH] = {0};
	if(s_szRootPath[0] == 0)
	{
		GetModuleFileName(NULL, s_szRootPath, sizeof(s_szRootPath));
		PathRemoveFileSpec(s_szRootPath);
	}
	return s_szRootPath;
}
//////////////////////////////////////////////////////////////////////////


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


// CBMCrashReportDlg �Ի���




CBMCrashReportDlg::CBMCrashReportDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CBMCrashReportDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CBMCrashReportDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CBMCrashReportDlg, CDialog)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_MESSAGE(WM_USER_HYPERLINK_CLICKED, &CBMCrashReportDlg::OnHyperLinkClicked)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


// CBMCrashReportDlg ��Ϣ�������

BOOL CBMCrashReportDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

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
	CoInitialize(NULL);

	CommandLineHelper xCmdHelper;
	bool bParseSuccess = false;

	//	params
	const char* pszDumpFile = NULL;
	const char* pszTitle = NULL;
	const char* pszErrorCode = NULL;
	DWORD dwErrorCode = 0;
	const char* pszErrorAddr = NULL;
	DWORD dwErrorAddr = 0;

	do 
	{
		if(!xCmdHelper.InitParam())
		{
			break;
		}
		pszDumpFile = xCmdHelper.GetParam("dumpfile");
		if(NULL == pszDumpFile)
		{
			break;
		}
		pszTitle = xCmdHelper.GetParam("title");
		if(NULL == pszTitle)
		{
			break;
		}
		pszErrorCode = xCmdHelper.GetParam("errorcode");
		if(NULL == pszErrorCode)
		{
			break;
		}
		dwErrorCode = atoi(pszErrorCode);
		if(0 == dwErrorCode)
		{
			break;
		}
		pszErrorAddr = xCmdHelper.GetParam("erroraddr");
		if(NULL == pszErrorAddr)
		{
			break;
		}
		dwErrorAddr = atoi(pszErrorAddr);
		if(0 == dwErrorAddr)
		{
			break;
		}

		bParseSuccess = true;
	} while (false);

	if(!bParseSuccess)
	{
		AfxMessageBox("��Ч�Ĳ���", MB_ICONERROR | MB_OK);
		EndDialog(0);
		return FALSE;
	}

	//	���Ʊ���
	m_xDumpfilePath = pszDumpFile;

	//	ˢ������
	char szDumfile[MAX_PATH];
	strcpy(szDumfile, pszDumpFile);
	const char* pszReturnedPath = PathFindFileName(szDumfile);

	char szDesc[512] = {0};
	sprintf(szDesc, "    %s ����������Ҫ�رա�������ɵĲ������Ǹ�⡣Ϊ�˸�����Ϸ��������ȶ��ԣ�����\"�򿪱���λ��\"��ť����ѡ�е�[%s]�ļ�����������������553056120@qq.com��������ύ���水ť���ύ���󱨸档", pszTitle, pszReturnedPath);
	GetDlgItem(IDC_STATIC_TITLE)->SetWindowText(szDesc);

	sprintf(szDesc, "%s ���󱨸�����", pszTitle);
	SetWindowText(szDesc);

	CButton* pSendReportCheckBox = (CButton*)GetDlgItem(IDC_CHECK1);
	if(pSendReportCheckBox)
	{
		pSendReportCheckBox->SetCheck(1);
	}

	CEdit* pEdit = (CEdit*)GetDlgItem(IDC_EDIT1);
	if(pEdit)
	{
		pEdit->SetLimitText(256);
	}

	//	���ó�����
	m_xHyperLinkOpenReportDirectory.SubclassDlgItem(IDC_STATIC_OPENREPORT, this);
	m_xHyperLinkViewReport.SubclassDlgItem(IDC_STATIC_VIEWREPORT, this);

	//	����˵��ʲô��
	sprintf(szDesc, "�����ַ��0x%08X �����룺0x%08X", dwErrorAddr, dwErrorCode);
	GetDlgItem(IDC_STATIC_ERRORINFO)->SetWindowText(szDesc);

	return TRUE;  // ���ǽ��������õ��ؼ������򷵻� TRUE
}

void CBMCrashReportDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// �����Ի��������С����ť������Ҫ����Ĵ���
//  �����Ƹ�ͼ�ꡣ����ʹ���ĵ�/��ͼģ�͵� MFC Ӧ�ó���
//  �⽫�ɿ���Զ���ɡ�

void CBMCrashReportDlg::OnPaint()
{
	if (IsIconic())
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
	}
}

//���û��϶���С������ʱϵͳ���ô˺���ȡ�ù��
//��ʾ��
HCURSOR CBMCrashReportDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

BOOL CBMCrashReportDlg::PreTranslateMessage(MSG* pMsg)
{
	if (pMsg->message == WM_KEYDOWN)

	{

		switch(pMsg->wParam)

		{

		case VK_RETURN:

			return TRUE;

		case VK_ESCAPE:

			return TRUE;

		default:

			break;

		}

	}

	return __super::PreTranslateMessage(pMsg);
}

void CBMCrashReportDlg::OnBnClickedButton1()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	char szExecuteCmd[MAX_PATH * 2];
	sprintf(szExecuteCmd, "explorer /select,%s", m_xDumpfilePath.c_str());
	WinExec(szExecuteCmd, SW_NORMAL);
}

LRESULT CBMCrashReportDlg::OnHyperLinkClicked(WPARAM wParam, LPARAM lParam)
{
	HWND hSender = (HWND)wParam;

	if(hSender == m_xHyperLinkOpenReportDirectory.GetSafeHwnd())
	{
		OnBnClickedButton1();
	}
	else if(hSender == m_xHyperLinkViewReport.GetSafeHwnd())
	{
		ViewReport();
	}

	return S_OK;
}

void CBMCrashReportDlg::ViewReport()
{
	if(m_xDumpfilePath.empty())
	{
		return;
	}

	if(!PathFileExists(m_xDumpfilePath.c_str()))
	{
		AfxMessageBox("���󱨸治����");
		return;
	}

	const char* pszPath = PathFindFileName(m_xDumpfilePath.c_str());
	//	remove extension
	char szFilename[MAX_PATH] = {0};
	strcpy(szFilename, pszPath);
	PathRemoveExtension(szFilename);

	char* pZipData = NULL;
	size_t uZipDataLength = 0;

	char szOpenFile[MAX_PATH] = {0};
	sprintf(szOpenFile, "%s.log", szFilename);

	if(READZIP_OK == ReadZipData(m_xDumpfilePath.c_str(), szOpenFile, (BYTE**)&pZipData, &uZipDataLength, ""))
	{
		HANDLE hFile = INVALID_HANDLE_VALUE;

		do 
		{
			char * pszTmpDir = getenv("TEMP");

			if(NULL == pszTmpDir ||
				strlen(pszTmpDir) == 0){
					break;
			}

			sprintf(szOpenFile, "%s/bmcrashreport", pszTmpDir);
			if(!PathFileExists(szOpenFile))
			{
				if(0 != mkdir(szOpenFile))
				{
					break;
				}
			}

			sprintf(szOpenFile, "%s/bmcrashreport/%s.log", pszTmpDir, szFilename);
			hFile = CreateFile(szOpenFile, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
			if(INVALID_HANDLE_VALUE == hFile)
			{
				int nLastError = GetLastError();
				sprintf(szOpenFile, "�򿪱���ʧ�ܣ������룺%d", nLastError);
				AfxMessageBox(szOpenFile);
				break;
			}

			DWORD dwWrite = 0;
			if(!WriteFile(hFile, pZipData, uZipDataLength, &dwWrite, NULL))
			{
				break;
			}
		} while (false);

		delete []pZipData;
		pZipData = NULL;

		if(INVALID_HANDLE_VALUE != hFile)
		{
			CloseHandle(hFile);
			hFile = INVALID_HANDLE_VALUE;

			//	open it
			char szCmd[MAX_PATH];
			sprintf(szCmd, "notepad.exe %s", szOpenFile);
			WinExec(szCmd, SW_SHOW);
		}
	}
	else
	{
		AfxMessageBox("�޷��򿪱���");
	}
}