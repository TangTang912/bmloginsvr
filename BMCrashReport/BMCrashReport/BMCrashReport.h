// BMCrashReport.h : PROJECT_NAME Ӧ�ó������ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"		// ������


// CBMCrashReportApp:
// �йش����ʵ�֣������ BMCrashReport.cpp
//

class CBMCrashReportApp : public CWinApp
{
public:
	CBMCrashReportApp();

// ��д
	public:
	virtual BOOL InitInstance();

// ʵ��

	DECLARE_MESSAGE_MAP()
};

extern CBMCrashReportApp theApp;