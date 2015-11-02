#pragma once

#include "../../CommonModule/SimpleIni.h"
#include "../../CommonModule/ObjectData.h"

// CItemEditDlg �Ի���

class CItemEditDlg : public CDialog
{
	DECLARE_DYNAMIC(CItemEditDlg)

public:
	CItemEditDlg(CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CItemEditDlg();

// �Ի�������
	enum { IDD = IDD_DIALOG1 };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	virtual BOOL OnInitDialog();

	DECLARE_MESSAGE_MAP()

public:
	bool LoadConfigFile(const char* _pszFilename);

private:
	CSimpleIniA m_xIniFile;
};
