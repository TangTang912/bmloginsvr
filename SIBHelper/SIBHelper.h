// SIBHelper.h : PROJECT_NAME Ӧ�ó������ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error �ڰ������� PCH �Ĵ��ļ�֮ǰ������stdafx.h��
#endif

#include "resource.h"		// ������


// CSIBHelperApp:
// �йش����ʵ�֣������ SIBHelper.cpp
//

class CSIBHelperApp : public CWinApp
{
public:
	CSIBHelperApp();

// ��д
	public:
	virtual BOOL InitInstance();

// ʵ��

	DECLARE_MESSAGE_MAP()
};

extern CSIBHelperApp theApp;
