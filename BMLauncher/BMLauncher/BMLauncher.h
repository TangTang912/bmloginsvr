// BMLauncher.h : PROJECT_NAME Ӧ�ó������ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"		// ������


// CBMLauncherApp:
// �йش����ʵ�֣������ BMLauncher.cpp
//

class CBMLauncherApp : public CWinApp
{
public:
	CBMLauncherApp();

// ��д
	public:
	virtual BOOL InitInstance();

// ʵ��

	DECLARE_MESSAGE_MAP()
};

extern CBMLauncherApp theApp;