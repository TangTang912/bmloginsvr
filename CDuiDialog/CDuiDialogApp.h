// CDuiDialog.h : PROJECT_NAME Ӧ�ó������ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"		// ������


// CCDuiDialogApp:
// �йش����ʵ�֣������ CDuiDialog.cpp
//

class CCDuiDialogApp : public CWinApp
{
public:
	CCDuiDialogApp();

// ��д
	public:
	virtual BOOL InitInstance();

// ʵ��

	DECLARE_MESSAGE_MAP()
};

extern CCDuiDialogApp theApp;