// ItemEditDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "SIBHelper.h"
#include "ItemEditDlg.h"


// CItemEditDlg �Ի���

IMPLEMENT_DYNAMIC(CItemEditDlg, CDialog)

CItemEditDlg::CItemEditDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CItemEditDlg::IDD, pParent)
{

}

CItemEditDlg::~CItemEditDlg()
{
}

void CItemEditDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BOOL CItemEditDlg::OnInitDialog()
{
	return __super::OnInitDialog();
}

//////////////////////////////////////////////////////////////////////////
bool CItemEditDlg::LoadConfigFile(const char* _pszFilename)
{
	if(!m_xIniFile.LoadFile(_pszFilename))
	{
		return false;
	}

	return false;
}


BEGIN_MESSAGE_MAP(CItemEditDlg, CDialog)
END_MESSAGE_MAP()


// CItemEditDlg ��Ϣ�������
