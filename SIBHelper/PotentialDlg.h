#pragma once


// CPotentialDlg �Ի���

class CPotentialDlg : public CDialog
{
	DECLARE_DYNAMIC(CPotentialDlg)

public:
	CPotentialDlg(CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CPotentialDlg();

// �Ի�������
	enum { IDD = IDD_DLG_POTENTIAL };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

	virtual void OnOK();

	DECLARE_MESSAGE_MAP()
};
