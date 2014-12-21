#include "StdAfx.h"
#define COMPILE_MULTIMON_STUBS
#include "multimon.h"
#include "CDuiDialog.h"

using namespace DuiLib;
//////////////////////////////////////////////////////////////////////////
BEGIN_MESSAGE_MAP(CDuiDialog, CDialog)
	//ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	//ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_WM_CREATE()
	//ON_WM_SETCURSOR()
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDOK, &CDuiDialog::OnBnClickedOk)
	ON_BN_CLICKED(IDCANCEL, &CDuiDialog::OnBnClickedCancel)
END_MESSAGE_MAP()
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
CDuiDialog::CDuiDialog(UINT _nIDTemplate, CWnd* _pParent, const char* _pszXmlFile)
	:CDialog(_nIDTemplate, _pParent)
{
	m_xXmlFile = _pszXmlFile;
	//m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

BOOL CDuiDialog::PreTranslateMessage(MSG* pMsg)
{
	//m_pm.MessageHandler(pMsg->message, pMsg->wParam, pMsg->lParam, );
	if(m_pm.TranslateMessage(pMsg))
	{
		//	don't dispatch this message
		return TRUE;
	}

	/*LRESULT lRet = 0;
	if(m_pm.MessageHandler(pMsg->message, pMsg->wParam, pMsg->lParam, lRet))
	{
		return TRUE;
	}*/

	//	WM_CHAR must be dispatched to support rich edit
	/*if(pMsg->message == WM_CHAR)
	{
		LRESULT lRet = 0;
		m_pm.MessageHandler(pMsg->message, pMsg->wParam, pMsg->lParam, lRet);
	}*/

	return __super::PreTranslateMessage(pMsg);
}

LRESULT CDuiDialog::WindowProc(UINT message, WPARAM wParam, LPARAM lParam)
{
	//return __super::WindowProc(message, wParam, lParam);
	//	input windows message into Duilib
	LRESULT lRet = 0;

	try
	{
		if(message == WM_COMMAND)
		{
			//
			bool bHandled = false;
			lRet = MessageHandler(message, wParam, lParam, bHandled);
			if(bHandled)
			{
				return lRet;
			}

			if(m_pm.MessageHandler(message, wParam, lParam, lRet))
			{
				return lRet;
			}

			lRet = __super::WindowProc(message, wParam, lParam);
			return lRet;
		}

		//	Version 2
		if(m_pm.MessageHandler(message, wParam, lParam, lRet))
		{
			return lRet;
		}
		else
		{
			lRet = __super::WindowProc(message, wParam, lParam);
		}
	}
	catch(...)
	{
		//glog.log(__FUNCTION__, "exception...");
		int err = errno;
		int a = 0;
	}

	return lRet;

#if		0
	//	Version 1
	bool bFilterDUIMsg = FilterDUIMessage(message, wParam, lParam, lRet);
	bool bDUIProcessed = false;

	if(!bFilterDUIMsg)
	{
		bDUIProcessed = m_pm.MessageHandler(message, wParam, lParam, lRet);
	}

	bool bFilterMFCMsg = FilterMFCMessage(message, wParam, lParam, lRet);
	if(!bFilterMFCMsg)
	{
		if(bDUIProcessed)
		{
			__super::WindowProc(message, wParam, lParam);
		}
		else
		{
			lRet = __super::WindowProc(message, wParam, lParam);
		}
	}

	return lRet;
#endif

#if		0
	//	Version 0
	if(FilterDUIMessage(message, wParam, lParam, lRet))
	{
		//	Processed, don't let m_pm to process it
		lRet = __super::WindowProc(message, wParam, lParam);
	}
	else
	{
		if(!m_pm.MessageHandler(message, wParam, lParam, lRet))
		{
			lRet = __super::WindowProc(message, wParam, lParam);
		}
		else
		{
			//	some event has been processed by m_pm, so don't invoke function below again.
			if(FilterMFCMessage(message, wParam, lParam, lRet))
			{
				//	nothing
			}
			else
			{
				__super::WindowProc(message, wParam, lParam);
			}
		}
	}
#endif

	return lRet;
}

int CDuiDialog::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	lpCreateStruct->style = (WS_VISIBLE | WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN | WS_CLIPSIBLINGS);
	lpCreateStruct->dwExStyle = 0;

	int nRet = __super::OnCreate(lpCreateStruct);

	if(!InitializeDuiSkin())
	{
		DUI__Trace("InitializeDuiSkin failed...You must specify the resource path and resource xml file first before creating the dialog.");
		return -1;
	}

	return nRet;
}

void CDuiDialog::OnPaint()
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
		//dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		//	Do nothing
		//CDialog::OnPaint();
	}
}

void CDuiDialog::OnClose()
{
	//
	OnCancel();
}

/*BOOL CDuiDialog::OnSetCursor(CWnd* pWnd, UINT nHitTest, UINT message)
{
	//return TRUE;
	HCURSOR hCursor = ::LoadCursor(NULL, MAKEINTRESOURCE(IDC_ARROW));
	::SetCursor(hCursor);
	return TRUE;
	return __super::OnSetCursor(pWnd, nHitTest, message);
}*/

void CDuiDialog::Notify(TNotifyUI& msg)
{
	if(msg.sType == DUI_MSGTYPE_WINDOWINIT)
	{
		OnWindowInit(msg);
	}
}

bool CDuiDialog::FilterDUIMessage(UINT _uMsg, WPARAM _wParam, LPARAM _lParam, LRESULT& _lRet)
{
	return false;
}

bool CDuiDialog::FilterMFCMessage(UINT message, WPARAM wParam, LPARAM lParam, LRESULT& _lRet)
{
	bool bFiltered = false;

	switch(message)
	{
	case WM_SETCURSOR:
		{
			bFiltered = true;
		}break;
	case  WM_ERASEBKGND:
		{
			bFiltered = true;
		}break;
	default:
		{
			bFiltered = false;
		}break;
	}

	return bFiltered;
}

LRESULT CDuiDialog::MessageHandler(UINT uMsg, WPARAM wParam, LPARAM lParam, bool& bHandled)
{
	switch(uMsg)
	{
	case WM_NCPAINT:
		{
			bHandled = true;
			return 0;
		}break;
	case WM_NCCALCSIZE:
		{
			bHandled = true;
			return 0;
		}break;
	case WM_NCACTIVATE:
		{
			bHandled = true;
			if( ::IsIconic(GetSafeHwnd()) ) bHandled = false;
			return (wParam == 0) ? TRUE : FALSE;
		}break;
	case WM_NCHITTEST:
		{
			bHandled = true;
			LRESULT lRet = Dui_OnNCHitTest(lParam);
			return lRet;
		}break;
	case WM_GETMINMAXINFO:
		{
			LRESULT lRet = Dui_OnGetMaxMinInfo(wParam, lParam, bHandled);
			return lRet;
		}break;
	/*case WM_SIZE:
		{
			return Dui_OnSize(wParam, lParam, bHandled);
		}break;*/
	}

	return 0;
}

void CDuiDialog::OnWindowInit(TNotifyUI& _msg)
{
	
}

LRESULT CDuiDialog::Dui_OnNCHitTest(LPARAM _lParam)
{
	POINT pt; pt.x = GET_X_LPARAM(_lParam); pt.y = GET_Y_LPARAM(_lParam);
	::ScreenToClient(GetSafeHwnd(), &pt);

	RECT rcClient;
	::GetClientRect(GetSafeHwnd(), &rcClient);

	if( !::IsZoomed(GetSafeHwnd()) ) {
		RECT rcSizeBox = m_pm.GetSizeBox();
		if( pt.y < rcClient.top + rcSizeBox.top ) {
			if( pt.x < rcClient.left + rcSizeBox.left ) return HTTOPLEFT;
			if( pt.x > rcClient.right - rcSizeBox.right ) return HTTOPRIGHT;
			return HTTOP;
		}
		else if( pt.y > rcClient.bottom - rcSizeBox.bottom ) {
			if( pt.x < rcClient.left + rcSizeBox.left ) return HTBOTTOMLEFT;
			if( pt.x > rcClient.right - rcSizeBox.right ) return HTBOTTOMRIGHT;
			return HTBOTTOM;
		}
		if( pt.x < rcClient.left + rcSizeBox.left ) return HTLEFT;
		if( pt.x > rcClient.right - rcSizeBox.right ) return HTRIGHT;
	}

	RECT rcCaption = m_pm.GetCaptionRect();
	if( pt.x >= rcClient.left + rcCaption.left && pt.x < rcClient.right - rcCaption.right \
		&& pt.y >= rcCaption.top && pt.y < rcCaption.bottom ) {
			CControlUI* pControl = static_cast<CControlUI*>(m_pm.FindControl(pt));
			if( pControl && _tcscmp(pControl->GetClass(), _T("ButtonUI")) != 0 && 
				_tcscmp(pControl->GetClass(), _T("OptionUI")) != 0 &&
				_tcscmp(pControl->GetClass(), _T("TextUI")) != 0 )
				return HTCAPTION;
		}

		return HTCLIENT;
}

LRESULT CDuiDialog::Dui_OnSize(WPARAM _wParam, LPARAM _lParam, bool& _bHandled)
{
	SIZE szRoundCorner = m_pm.GetRoundCorner();
	if( !::IsIconic(GetSafeHwnd()) && (szRoundCorner.cx != 0 || szRoundCorner.cy != 0) ) {
		CDuiRect rcWnd;
		::GetWindowRect(GetSafeHwnd(), &rcWnd);
		rcWnd.Offset(-rcWnd.left, -rcWnd.top);
		rcWnd.right++; rcWnd.bottom++;
		HRGN hRgn = ::CreateRoundRectRgn(rcWnd.left, rcWnd.top, rcWnd.right, rcWnd.bottom, szRoundCorner.cx, szRoundCorner.cy);
		::SetWindowRgn(GetSafeHwnd(), hRgn, TRUE);
		::DeleteObject(hRgn);
	}

	_bHandled = false;
	return 0;
}

LRESULT CDuiDialog::Dui_OnGetMaxMinInfo(WPARAM _wParam, LPARAM _lParam, bool& _bHandled)
{
	//MONITORINFO oMonitor;
	//ZeroMemory(&oMonitor, sizeof(oMonitor));
	//oMonitor.cbSize = sizeof(oMonitor);
	//GetMonitorInfo(MonitorFromWindow(GetSafeHwnd(), MONITOR_DEFAULTTONULL), &oMonitor);
	//CDuiRect rcWork = oMonitor.rcWork;
	//LPMINMAXINFO lpMMI = (LPMINMAXINFO) _lParam;
	//lpMMI->ptMaxPosition.x = 0;//rcWork.left;
	//lpMMI->ptMaxPosition.y = 0;//rcWork.top;
	//lpMMI->ptMaxSize.x = rcWork.right - rcWork.left;
	//lpMMI->ptMaxSize.y = rcWork.bottom - rcWork.top;
	//_bHandled = false;

	LPMINMAXINFO lpMMI = (LPMINMAXINFO) _lParam;

	MONITORINFO oMonitor = {};
	oMonitor.cbSize = sizeof(oMonitor);
	::GetMonitorInfo(::MonitorFromWindow(*this, MONITOR_DEFAULTTONEAREST), &oMonitor);
	CDuiRect rcWork = oMonitor.rcWork;
	CDuiRect rcMonitor = oMonitor.rcMonitor;
	rcWork.Offset(-oMonitor.rcMonitor.left, -oMonitor.rcMonitor.top);

	// �������ʱ����ȷ��ԭ������
	lpMMI->ptMaxPosition.x	= rcWork.left;
	lpMMI->ptMaxPosition.y	= rcWork.top;

	lpMMI->ptMaxTrackSize.x =rcWork.GetWidth();
	lpMMI->ptMaxTrackSize.y =rcWork.GetHeight();

	lpMMI->ptMinTrackSize.x =m_pm.GetMinInfo().cx;
	lpMMI->ptMinTrackSize.y =m_pm.GetMinInfo().cy;
	_bHandled = true;
	return 0;
}











bool CDuiDialog::InitializeDuiSkin()
{
	if(m_xXmlFile.empty())
	{
		return false;
	}

	m_pm.Init(GetSafeHwnd());
	CDialogBuilder builder;
	CControlUI* pRoot = builder.Create(m_xXmlFile.c_str(), (UINT)0, NULL, &m_pm);
	if(NULL == pRoot)
	{
		DUI__Trace("Failed to parse XML[%s]", CPaintManagerUI::GetResourcePath() + m_xXmlFile.c_str());
		return false;
	}
	ASSERT(pRoot && "Failed to parse XML");
	m_pm.AttachDialog(pRoot);
	m_pm.AddNotifier(this);
	m_pm.AddMessageFilter(this);

	//	ȥ��ϵͳ������
	LONG styleValue = ::GetWindowLong(GetSafeHwnd(), GWL_STYLE);
	styleValue &= ~WS_CAPTION;
	::SetWindowLong(*this, GWL_STYLE, styleValue | WS_CLIPSIBLINGS | WS_CLIPCHILDREN);

	return true;
}


void CDuiDialog::OnBnClickedOk()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
}

void CDuiDialog::OnBnClickedCancel()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
}
