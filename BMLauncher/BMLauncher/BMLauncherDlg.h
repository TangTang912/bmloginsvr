// BMLauncherDlg.h : ͷ�ļ�
//

#pragma once

#include "CDuiDialog.h"
#include <string>

using std::string;

// CBMLauncherDlg �Ի���
class CBMLauncherDlg : public CDuiDialog
{
// ����
public:
	CBMLauncherDlg(CWnd* pParent = NULL);	// ��׼���캯��

// �Ի�������
	enum { IDD = IDD_BMLAUNCHER_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��

public:
	virtual void Notify(DuiLib::TNotifyUI& msg);

public:
	void SwitchTabLayout(int _nTabPage);
	void DoLogin(int _nPage);
	void DoDiagnosis();
	void DoMailVerify();
	void OnMailVerifyResult(const char* _pData, size_t _uLen);
	void DoRegAccount();
	void OnRegAccountResult(const char* _pData, size_t _uLen);
	void OnGsAddrResult(const char *_pData, size_t _uLen);
	void OnOnlineRoomClicked();
	void OnGetBattleNetAddress();

	void LoadConfig();
	void SaveConfig();
	void DownloadConfigFile();

	void ErrorMsgBox(const char* _pszText)
	{
		MessageBox(_pszText, "����", MB_ICONERROR | MB_OK);
	}

// ʵ��
protected:
	HICON m_hIcon;

	//	http�����ַ
	string m_xRegHttpAddr;
	//	��Ϸ�����������ַ
	string m_xGameRoomHttpAddr;
	//	ս��IP
	string m_xBattleNetIP;
	string m_xBattleNetPort;

	// ���ɵ���Ϣӳ�亯��
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
};
