// BMCrashReportDlg.h : ͷ�ļ�
//

#pragma once

#include <string>
#include "HyperLink.h"

// CBMCrashReportDlg �Ի���
class CBMCrashReportDlg : public CDialog
{
// ����
public:
	CBMCrashReportDlg(CWnd* pParent = NULL);	// ��׼���캯��

// �Ի�������
	enum { IDD = IDD_BMCRASHREPORT_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��
	virtual BOOL PreTranslateMessage(MSG* pMsg);


// ʵ��
protected:
	HICON m_hIcon;

	// ���ɵ���Ϣӳ�亯��
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()

	void ViewReport();

protected:


	std::string m_xDumpfilePath; 
	CHyperLink m_xHyperLinkOpenReportDirectory;
	CHyperLink m_xHyperLinkViewReport;

public:
	afx_msg void OnBnClickedButton1();
	afx_msg LRESULT OnHyperLinkClicked(WPARAM wParam, LPARAM lParam);
};
