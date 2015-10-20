//#include "stdafx.h"
#include "MirMap.h"
#include <assert.h>
#include "SKnl3Helper.h"

SWilFileEx::SWilFileEx(const char* lpszFileName)
{
	assert(lpszFileName != NULL);
	m_pIndexTable = NULL;
	m_pPalette = NULL;
	m_bitmaps = NULL;
	m_hWilFile = NULL;
	m_bUserManage = false;

	Load(lpszFileName);
}

SWilFileEx::SWilFileEx()
{
	m_pIndexTable = NULL;
	m_pPalette = NULL;
	m_bitmaps = NULL;
	m_hWilFile = NULL;
	m_bUserManage = false;
}

SWilFileEx::~SWilFileEx()
{
	UnLoad();
}

bool SWilFileEx::Load(const char* lpszFileName)
{
	//	���ж��Ƿ�������
	if(m_pIndexTable ||
		m_pPalette ||
		m_bitmaps)
	{
		return false;
	}

	strcpy(m_szWilPath, lpszFileName);
	int nStrLen = strlen(m_szWilPath);
	strcpy(m_szWixPath, lpszFileName);
	m_szWixPath[nStrLen - 1] = 'x';

	//	��Wix�ļ�����
	HANDLE hWixFile = SKNL3CreateMemoryFileMapping(m_szWixPath);
	int nOffset = 0;
	if(hWixFile)
	{
		const char* pWixData = (const char*)hWixFile;

		for(int i = 0; i < 44; ++i)
		{
			m_stWixHead.Title[i] = *((const char*)(pWixData + nOffset));
			++nOffset;
		}

		m_stWixHead.IndexCount = *((DWORD*)(pWixData + nOffset));
		nOffset += sizeof(DWORD);

		if(m_pIndexTable)
		{
			delete [] m_pIndexTable;
		}
		m_pIndexTable = new DWORD[m_stWixHead.IndexCount];
		memset(m_pIndexTable, 0, m_stWixHead.IndexCount * sizeof(DWORD));

		for(int i = 0; i < m_stWixHead.IndexCount; ++i)
		{
			int nDataIndex = *((DWORD*)(pWixData + nOffset));
			m_pIndexTable[i] = nDataIndex;
			nOffset += sizeof(DWORD);
		}

		::UnmapViewOfFile(hWixFile);

		//	��Wil
		HANDLE hWilFile = ::CreateFile(m_szWilPath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
		if(hWilFile != INVALID_HANDLE_VALUE)
		{
			if(m_bitmaps)
			{
				delete [] m_bitmaps;
			}
			//	������Ӧ��BITMAP
			m_bitmaps = new HBITMAP[m_stWixHead.IndexCount];
			memset(m_bitmaps, 0, m_stWixHead.IndexCount * sizeof(HBITMAP));

			//	��Wil�ļ�ͷ
			char buf[44];
			DWORD nCounter = 0;
			if(!::ReadFile(hWilFile, buf, sizeof(buf), &nCounter, NULL))
			{
				goto _READ_ERROR_WIL;
			}
			if(nCounter != 44)
			{
				goto _READ_ERROR_WIL;
			}
			memcpy(m_stWilHead.Title, buf, sizeof(m_stWilHead.Title));

			for(int i = 0; i < 3; ++i)
			{
				if(!::ReadFile(hWilFile, buf, sizeof(DWORD), &nCounter, NULL))
				{
					goto _READ_ERROR_WIL;
				}
				if(nCounter != 4)
				{
					goto _READ_ERROR_WIL;
				}

				switch(i)
				{
				case 0:
					{
						memcpy(&m_stWilHead.ImageCount, buf, 4);
					}break;
				case 1:
					{
						memcpy(&m_stWilHead.ColorCount, buf, 4);
					}break;
				case 2:
					{
						memcpy(&m_stWilHead.PaletteSize, buf, 4);
					}break;
				}
			}

			if(m_pPalette)
			{
				delete [] m_pPalette;
			}
			m_pPalette = new DWORD[m_stWilHead.ColorCount];
			memset(m_pPalette, 0, sizeof(DWORD) * m_stWilHead.ColorCount);

			char* readBuf = new char[m_stWilHead.PaletteSize];
			if(!::ReadFile(hWilFile, readBuf, m_stWilHead.PaletteSize, &nCounter, NULL))
			{
				goto _READ_ERROR_WIL;
			}
			if(nCounter != m_stWilHead.PaletteSize)
			{
				goto _READ_ERROR_WIL;
			}
			memcpy(m_pPalette, readBuf, m_stWilHead.PaletteSize);
			delete [] readBuf;

			::CloseHandle(hWilFile);
			return true;
		}
		else
		{
			int nErrorCode = ::GetLastError();
			char errorBuf[100];
			sprintf(errorBuf, "Read file error code : %d", nErrorCode);
			//::MessageBox(NULL, errorBuf, _T("ERROR"), MB_OK | MB_ICONERROR);
			return false;
		}
	}


_READ_ERROR_WIL:
	//::MessageBox(NULL, _T("Wil��ȡ����"), _T("ERROR"), MB_OK | MB_ICONERROR);
	return false;

_READ_ERROR_WIX:
	//::MessageBox(NULL, _T("Wix��ȡ����"), _T("ERROR"), MB_OK | MB_ICONERROR);
	return false;
}

void SWilFileEx::UnLoad()
{
	ReleaseBitmaps();

	if(m_bitmaps)
	{
		delete [] m_bitmaps;
		m_bitmaps = NULL;
	}
	if(m_pIndexTable)
	{
		delete [] m_pIndexTable;
		m_pIndexTable = NULL;
	}
	if(m_pPalette)
	{
		delete [] m_pPalette;
		m_pPalette = NULL;
	}

	if(m_hWilFile)
	{
		::CloseHandle(m_hWilFile);
		m_hWilFile = NULL;
	}

	memset(&m_stWilHead, 0, sizeof(m_stWilHead));
	memset(&m_stWixHead, 0, sizeof(m_stWixHead));
	memset(m_szWilPath, 0, sizeof(m_szWilPath));
	memset(m_szWixPath, 0, sizeof(m_szWixPath));
	m_lstGetInfo.clear();
}

HBITMAP SWilFileEx::GetBitmap(HDC hDC, int _index)
{
	assert(m_pPalette != NULL &&
		m_pIndexTable != NULL);

	if(_index >= m_stWilHead.ImageCount ||
		_index <0)
	{
		return 0;
	}

	//	�Ȼ�ȡ�Ƿ��л���
	if(m_bitmaps[_index])
	{
		return m_bitmaps[_index];
	}

	//	����������ȡImageInfo
	ImageInfo stImageInfo;
	if(!m_hWilFile)
	{
		//	��һ�λ�ȡ �ȴ��ļ�
		m_hWilFile = ::CreateFile(m_szWilPath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
	}
	
	if(m_hWilFile != INVALID_HANDLE_VALUE)
	{
		if(HFILE_ERROR == ::SetFilePointer(m_hWilFile, m_pIndexTable[_index], 0, FILE_BEGIN))
		{
			::CloseHandle(m_hWilFile);
			m_hWilFile = NULL;
			return 0;
		}
		DWORD nCounter = 0;
		if(!::ReadFile(m_hWilFile, &stImageInfo.Width, sizeof(WORD), &nCounter, NULL))
		{
			goto _READ_ERROR_WIL;
		}
		if(!::ReadFile(m_hWilFile, &stImageInfo.Height, sizeof(WORD), &nCounter, NULL))
		{
			goto _READ_ERROR_WIL;
		}
		if(!::ReadFile(m_hWilFile, stImageInfo.unknow, 4, &nCounter, NULL))
		{
			goto _READ_ERROR_WIL;
		}

		BYTE* pImageData = new BYTE[stImageInfo.Height * stImageInfo.Width];
		if(!::ReadFile(m_hWilFile, pImageData, stImageInfo.Height * stImageInfo.Width, &nCounter, NULL))
		{
			goto _READ_ERROR_WIL;
		}

		//::CloseHandle(m_hWilFile);

		//	��������
		size_t nHeaderSize = sizeof(BITMAPINFO) + m_stWilHead.ColorCount * sizeof(RGBQUAD);
		PBITMAPINFO bi;
		bi = (PBITMAPINFO)malloc(nHeaderSize);
		memset(bi, 0, nHeaderSize);
		bi->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
		bi->bmiHeader.biWidth = stImageInfo.Width;
		bi->bmiHeader.biHeight = stImageInfo.Height;
		bi->bmiHeader.biPlanes = 1;
		bi->bmiHeader.biBitCount = 8;
		bi->bmiHeader.biCompression = BI_RGB;
		bi->bmiHeader.biSizeImage = (bi->bmiHeader.biWidth * 8 + 31) / 32 * 4 * bi->bmiHeader.biHeight;
		bi->bmiHeader.biClrImportant = 0;
		bi->bmiHeader.biClrUsed = 0;

		//	����ɫ��
		RGBQUAD quad;
		BYTE* pPaletteData = (BYTE*)m_pPalette;
		for(int i = 0; i < m_stWilHead.ColorCount; ++i)
		{
			quad.rgbRed = pPaletteData[i * 4 + 2];
			quad.rgbGreen = pPaletteData[i * 4 + 1];
			quad.rgbBlue = pPaletteData[i * 4 + 0];
			quad.rgbReserved = pPaletteData[i * 4 + 3];
			bi->bmiColors[i] = quad;
		}

		HBITMAP hOut = CreateDIBitmapFromData(hDC, bi, pImageData);

		free(bi);
		delete [] pImageData;
		m_bitmaps[_index] = hOut;

		if(!m_bUserManage)
		{
			m_lstGetInfo.push_back(_index);
		}
		return hOut;
	}
	else
	{
		int nErrorCode = ::GetLastError();
		char errorBuf[100];
		sprintf(errorBuf, "Read file error code : %d", nErrorCode);
		::MessageBox(NULL, errorBuf, _T("ERROR"), MB_OK | MB_ICONERROR);
	}

_READ_ERROR_WIL:
	::CloseHandle(m_hWilFile);
	m_hWilFile = NULL;
	//::MessageBox(NULL, _T("Wil��ȡ����"), _T("ERROR"), MB_OK | MB_ICONERROR);
	return 0;
}

void SWilFileEx::ReleaseBitmaps()
{
// 	for(int i = 0; i < m_stWilHead.ImageCount; ++i)
// 	{
// 		if(m_bitmaps[i] != 0)
// 		{
// 			::DeleteObject(m_bitmaps[i]);
// 			m_bitmaps[i] = 0;
// 		}
// 	}
	if(m_bUserManage)
	{
		return;
	}
	for(list<int>::const_iterator iter = m_lstGetInfo.begin();
		iter != m_lstGetInfo.end();
		++iter)
	{
		if(m_bitmaps[*iter])
		{
			::DeleteObject(m_bitmaps[*iter]);
			m_bitmaps[*iter] = 0;
		}
	}
	m_lstGetInfo.clear();
}

void SWilFileEx::Release(int _index)
{
// 	if(m_bUserManage)
// 	{
// 		return;
// 	}
	if(m_bitmaps[_index])
	{
		::DeleteObject(m_bitmaps[_index]);
		m_bitmaps[_index] = 0;
	}
}

HBITMAP SWilFileEx::CreateDIBitmapFromData(HDC hDevice, PBITMAPINFO lpBitmapInfo, BYTE* pData)
{
	PLOGPALETTE lpPalette = NULL;
	int nColors = lpBitmapInfo->bmiHeader.biClrUsed > 0 ? lpBitmapInfo->bmiHeader.biClrUsed : 1 << lpBitmapInfo->bmiHeader.biBitCount;

	//	Ϊ�߼���ɫ������ڴ�
	lpPalette = (PLOGPALETTE)malloc(sizeof(LOGPALETTE) + nColors * sizeof(PALETTEENTRY));
	lpPalette->palNumEntries = nColors;
	lpPalette->palVersion = 0x300;
	for(int i = 0; i < nColors; ++i)
	{
		lpPalette->palPalEntry[i].peBlue = lpBitmapInfo->bmiColors[i].rgbBlue;
		lpPalette->palPalEntry[i].peGreen = lpBitmapInfo->bmiColors[i].rgbGreen;
		lpPalette->palPalEntry[i].peRed = lpBitmapInfo->bmiColors[i].rgbRed;
		lpPalette->palPalEntry[i].peFlags = 0;
	}

	HPALETTE hPalette= ::CreatePalette(lpPalette);
	HPALETTE hOld = 0;
	free(lpPalette);

	hOld = ::SelectPalette(hDevice, hPalette, FALSE);
	if(GDI_ERROR == ::RealizePalette(hDevice))
	{
		return 0;
	}

	HBITMAP hOutBitmap = ::CreateDIBitmap(hDevice, (PBITMAPINFOHEADER)lpBitmapInfo, CBM_INIT, pData, lpBitmapInfo, DIB_RGB_COLORS);
	::SelectPalette(hDevice, hOld, FALSE);
	::DeleteObject(hPalette);

	return hOutBitmap;
}





//	NoEx
SWilFile::SWilFile(const char* lpszFileName)
{
	assert(lpszFileName != NULL);
	m_pIndexTable = NULL;
	m_pPalette = NULL;
	m_hWilFile = NULL;

	Load(lpszFileName);
}

SWilFile::SWilFile()
{
	m_pIndexTable = NULL;
	m_pPalette = NULL;
	m_hWilFile = NULL;
}

SWilFile::~SWilFile()
{
	UnLoad();
}

bool SWilFile::Load(const char* lpszFileName)
{
	//	���ж��Ƿ�������
	if(m_pIndexTable ||
		m_pPalette)
	{
		return false;
	}

	strcpy(m_szWilPath, lpszFileName);
	int nStrLen = strlen(m_szWilPath);
	strcpy(m_szWixPath, lpszFileName);
	m_szWixPath[nStrLen - 1] = 'x';

	//	��Wix�ļ�����
	HANDLE hWixFile = SKNL3CreateMemoryFileMapping(m_szWixPath);
	int nOffset = 0;
	if(hWixFile)
	{
		const char* pWixData = (const char*)hWixFile;

		for(int i = 0; i < 44; ++i)
		{
			m_stWixHead.Title[i] = *((const char*)(pWixData + nOffset));
			++nOffset;
		}

		m_stWixHead.IndexCount = *((DWORD*)(pWixData + nOffset));
		nOffset += sizeof(DWORD);

		if(m_pIndexTable)
		{
			delete [] m_pIndexTable;
		}
		m_pIndexTable = new DWORD[m_stWixHead.IndexCount];
		memset(m_pIndexTable, 0, m_stWixHead.IndexCount * sizeof(DWORD));

		//	���Ե�һ��
		/*int nFirstOffset = *((DWORD*)(pWixData + 48));
		if(nFirstOffset < 0)
		{
			nOffset += sizeof(DWORD);
		}*/

		for(int i = 0; i < m_stWixHead.IndexCount; ++i)
		{
			DWORD dwDataIndex = *((DWORD*)(pWixData + nOffset));
			m_pIndexTable[i] = dwDataIndex;
			nOffset += sizeof(DWORD);
		}

		::UnmapViewOfFile(hWixFile);

		//	��Wil
		//HANDLE hWilFile = ::CreateFile(m_szWilPath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
		m_hWilFile = ::CreateFile(m_szWilPath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
		if(m_hWilFile != INVALID_HANDLE_VALUE)
		{
			//	��Wil�ļ�ͷ
			char buf[44];
			DWORD nCounter = 0;
			if(!::ReadFile(m_hWilFile, buf, sizeof(buf), &nCounter, NULL))
			{
				goto _READ_ERROR_WIL;
			}
			if(nCounter != 44)
			{
				goto _READ_ERROR_WIL;
			}
			memcpy(m_stWilHead.Title, buf, sizeof(m_stWilHead.Title));

			for(int i = 0; i < 3; ++i)
			{
				if(!::ReadFile(m_hWilFile, buf, sizeof(DWORD), &nCounter, NULL))
				{
					goto _READ_ERROR_WIL;
				}
				if(nCounter != 4)
				{
					goto _READ_ERROR_WIL;
				}

				switch(i)
				{
				case 0:
					{
						memcpy(&m_stWilHead.ImageCount, buf, 4);
					}break;
				case 1:
					{
						memcpy(&m_stWilHead.ColorCount, buf, 4);
					}break;
				case 2:
					{
						memcpy(&m_stWilHead.PaletteSize, buf, 4);
					}break;
				}
			}

			if(m_pPalette)
			{
				delete [] m_pPalette;
				m_pPalette = NULL;
			}

			if(m_stWilHead.ColorCount <= 256)
			{
				m_pPalette = new DWORD[m_stWilHead.ColorCount];
				memset(m_pPalette, 0, sizeof(DWORD) * m_stWilHead.ColorCount);

				char* readBuf = new char[m_stWilHead.PaletteSize];
				if(!::ReadFile(m_hWilFile, readBuf, m_stWilHead.PaletteSize, &nCounter, NULL))
				{
					goto _READ_ERROR_WIL;
				}
				if(nCounter != m_stWilHead.PaletteSize)
				{
					goto _READ_ERROR_WIL;
				}
				memcpy(m_pPalette, readBuf, m_stWilHead.PaletteSize);
				delete [] readBuf;
			}

			//::CloseHandle(hWilFile);
			return true;
		}
		else
		{
			int nErrorCode = ::GetLastError();
			char errorBuf[100];
			sprintf(errorBuf, "Read file error code : %d", nErrorCode);
			//::MessageBox(NULL, errorBuf, _T("ERROR"), MB_OK | MB_ICONERROR);
			return false;
		}
	}


_READ_ERROR_WIL:
	//::MessageBox(NULL, _T("Wil��ȡ����"), _T("ERROR"), MB_OK | MB_ICONERROR);
	return false;

_READ_ERROR_WIX:
	//::MessageBox(NULL, _T("Wix��ȡ����"), _T("ERROR"), MB_OK | MB_ICONERROR);
	return false;
}

void SWilFile::UnLoad()
{
	if(m_pIndexTable)
	{
		delete [] m_pIndexTable;
		m_pIndexTable = NULL;
	}
	if(m_pPalette)
	{
		delete [] m_pPalette;
		m_pPalette = NULL;
	}

	if(m_hWilFile)
	{
		::CloseHandle(m_hWilFile);
		m_hWilFile = NULL;
	}

	memset(&m_stWilHead, 0, sizeof(m_stWilHead));
	memset(&m_stWixHead, 0, sizeof(m_stWixHead));
	memset(m_szWilPath, 0, sizeof(m_szWilPath));
	memset(m_szWixPath, 0, sizeof(m_szWixPath));
}

HBITMAP SWilFile::GetBitmap(HDC hDC, int _index)
{
	assert(m_pIndexTable != NULL);

	if(_index >= m_stWilHead.ImageCount ||
		_index <0)
	{
		return 0;
	}

	//	����������ȡImageInfo
	if(m_stWilHead.ColorCount == 0xFF + 1)
	{
		return GetBitmap8(hDC, _index);
	}
	else if(m_stWilHead.ColorCount == 0xFFFF + 1)
	{
		return GetBitmap16(hDC, _index);
	}

	return 0;
}

HBITMAP SWilFile::GetBitmap8(HDC hDC, int _index)
{
	assert(m_pPalette != NULL &&
		m_pIndexTable != NULL);

	if(_index >= m_stWilHead.ImageCount ||
		_index <0)
	{
		return 0;
	}

	//	����������ȡImageInfo
	ImageInfo stImageInfo;
	if(!m_hWilFile)
	{
		//	��һ�λ�ȡ �ȴ��ļ�
		m_hWilFile = ::CreateFile(m_szWilPath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
	}

	if(m_hWilFile != INVALID_HANDLE_VALUE)
	{
		if(HFILE_ERROR == ::SetFilePointer(m_hWilFile, m_pIndexTable[_index], 0, FILE_BEGIN))
		{
			::CloseHandle(m_hWilFile);
			m_hWilFile = NULL;
			return 0;
		}
		DWORD nCounter = 0;
		if(!::ReadFile(m_hWilFile, &stImageInfo.Width, sizeof(WORD), &nCounter, NULL))
		{
			goto _READ_ERROR_WIL;
		}
		if(!::ReadFile(m_hWilFile, &stImageInfo.Height, sizeof(WORD), &nCounter, NULL))
		{
			goto _READ_ERROR_WIL;
		}
		if(!::ReadFile(m_hWilFile, stImageInfo.unknow, 4, &nCounter, NULL))
		{
			goto _READ_ERROR_WIL;
		}

		DWORD dwImgSize = (stImageInfo.Width * 8 + 31) / 32 * 4 * stImageInfo.Height;
		//BYTE* pImageData = new BYTE[stImageInfo.Height * stImageInfo.Width];
		BYTE* pImageData = new BYTE[dwImgSize];
		//if(!::ReadFile(m_hWilFile, pImageData, stImageInfo.Height * stImageInfo.Width, &nCounter, NULL))
		if(!::ReadFile(m_hWilFile, pImageData, dwImgSize, &nCounter, NULL))
		{
			delete[] pImageData;
			goto _READ_ERROR_WIL;
		}

		//::CloseHandle(m_hWilFile);

		//	��������
		size_t nHeaderSize = sizeof(BITMAPINFOHEADER) + m_stWilHead.ColorCount * sizeof(RGBQUAD);
		PBITMAPINFO bi;
		bi = (PBITMAPINFO)malloc(nHeaderSize);
		memset(bi, 0, nHeaderSize);
		bi->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
		bi->bmiHeader.biWidth = stImageInfo.Width;
		bi->bmiHeader.biHeight = stImageInfo.Height;
		bi->bmiHeader.biPlanes = 1;
		bi->bmiHeader.biBitCount = 8;
		bi->bmiHeader.biCompression = BI_RGB;
		bi->bmiHeader.biSizeImage = /*(bi->bmiHeader.biWidth * 8 + 31) / 32 * 4 * bi->bmiHeader.biHeight;*/dwImgSize;
		bi->bmiHeader.biClrImportant = 0;
		bi->bmiHeader.biClrUsed = 256;

		//	����ɫ��
		RGBQUAD quad;
		BYTE* pPaletteData = (BYTE*)m_pPalette;
		for(int i = 0; i < m_stWilHead.ColorCount; ++i)
		{
			quad.rgbRed = pPaletteData[i * 4 + 2];
			quad.rgbGreen = pPaletteData[i * 4 + 1];
			quad.rgbBlue = pPaletteData[i * 4 + 0];
			quad.rgbReserved = pPaletteData[i * 4 + 3];
			bi->bmiColors[i] = quad;
		}

		HBITMAP hOut = CreateDIBitmapFromData(hDC, bi, pImageData);
		if(hOut == 0)
		{
			
		}

		free(bi);
		delete [] pImageData;
		return hOut;
	}
	else
	{
		int nErrorCode = ::GetLastError();
		char errorBuf[100];
		sprintf(errorBuf, "Read file error code : %d", nErrorCode);
		::MessageBox(NULL, errorBuf, _T("ERROR"), MB_OK | MB_ICONERROR);
	}

_READ_ERROR_WIL:
	::CloseHandle(m_hWilFile);
	m_hWilFile = NULL;
	::MessageBox(NULL, _T("Wil��ȡ����"), _T("ERROR"), MB_OK | MB_ICONERROR);
	return 0;
}

HBITMAP SWilFile::GetBitmap16(HDC hDC, int _index)
{
	assert(m_pIndexTable != NULL);

	if(_index >= m_stWilHead.ImageCount ||
		_index <0)
	{
		return 0;
	}

	//	����������ȡImageInfo
	ImageInfo stImageInfo;
	if(!m_hWilFile)
	{
		//	��һ�λ�ȡ �ȴ��ļ�
		m_hWilFile = ::CreateFile(m_szWilPath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL);
	}

	if(m_hWilFile != INVALID_HANDLE_VALUE)
	{
		if(HFILE_ERROR == ::SetFilePointer(m_hWilFile, m_pIndexTable[_index], 0, FILE_BEGIN))
		{
			::CloseHandle(m_hWilFile);
			m_hWilFile = NULL;
			return 0;
		}
		DWORD nCounter = 0;
		if(!::ReadFile(m_hWilFile, &stImageInfo.Width, sizeof(WORD), &nCounter, NULL))
		{
			goto _READ_ERROR_WIL;
		}
		if(!::ReadFile(m_hWilFile, &stImageInfo.Height, sizeof(WORD), &nCounter, NULL))
		{
			goto _READ_ERROR_WIL;
		}
		if(!::ReadFile(m_hWilFile, stImageInfo.unknow, 4, &nCounter, NULL))
		{
			goto _READ_ERROR_WIL;
		}

		DWORD dwImgSize = (stImageInfo.Width * 16 + 31) / 32 * 4 * stImageInfo.Height;
		BYTE* pImageData = new BYTE[dwImgSize];
		if(!::ReadFile(m_hWilFile, pImageData, /*stImageInfo.Height * stImageInfo.Width * 2*/dwImgSize, &nCounter, NULL))
		{
			delete[] pImageData;
			goto _READ_ERROR_WIL;
		}

		//::CloseHandle(m_hWilFile);

		//	��������
		size_t nHeaderSize = sizeof(BITMAPINFOHEADER) + 3 * sizeof(RGBQUAD);
		PBITMAPINFO bi;
		bi = (PBITMAPINFO)malloc(nHeaderSize);
		memset(bi, 0, nHeaderSize);
		bi->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
		bi->bmiHeader.biWidth = stImageInfo.Width;
		bi->bmiHeader.biHeight = stImageInfo.Height;
		bi->bmiHeader.biPlanes = 1;
		bi->bmiHeader.biBitCount = 16;
		bi->bmiHeader.biCompression = BI_BITFIELDS;
		bi->bmiHeader.biSizeImage = dwImgSize;
		bi->bmiHeader.biClrImportant = 0;
		bi->bmiHeader.biClrUsed = 0;

		//	����ɫ��
		*(DWORD*)(&bi->bmiColors[0]) = 0xF800;
		*(DWORD*)(&bi->bmiColors[1]) = 0x07E0;
		*(DWORD*)(&bi->bmiColors[2]) = 0x001F;

		HBITMAP hOut = ::CreateDIBitmap(hDC, (PBITMAPINFOHEADER)bi, CBM_INIT, pImageData, bi, DIB_RGB_COLORS);

		free(bi);
		delete [] pImageData;
		return hOut;
	}
	else
	{
		int nErrorCode = ::GetLastError();
		char errorBuf[100];
		sprintf(errorBuf, "Read file error code : %d", nErrorCode);
		::MessageBox(NULL, errorBuf, _T("ERROR"), MB_OK | MB_ICONERROR);
	}

_READ_ERROR_WIL:
	::CloseHandle(m_hWilFile);
	m_hWilFile = NULL;
	::MessageBox(NULL, _T("Wil��ȡ����"), _T("ERROR"), MB_OK | MB_ICONERROR);
	return 0;
}

void SWilFile::Release(int _index)
{
	
}

HBITMAP SWilFile::CreateDIBitmapFromData(HDC hDevice, PBITMAPINFO lpBitmapInfo, BYTE* pData)
{
	PLOGPALETTE lpPalette = NULL;
	int nColors = lpBitmapInfo->bmiHeader.biClrUsed > 0 ? lpBitmapInfo->bmiHeader.biClrUsed : 1 << lpBitmapInfo->bmiHeader.biBitCount;

	//	Ϊ�߼���ɫ������ڴ�
	lpPalette = (PLOGPALETTE)malloc(sizeof(LOGPALETTE) + nColors * sizeof(PALETTEENTRY));
	lpPalette->palNumEntries = nColors;
	lpPalette->palVersion = 0x300;
	for(int i = 0; i < nColors; ++i)
	{
		lpPalette->palPalEntry[i].peBlue = lpBitmapInfo->bmiColors[i].rgbBlue;
		lpPalette->palPalEntry[i].peGreen = lpBitmapInfo->bmiColors[i].rgbGreen;
		lpPalette->palPalEntry[i].peRed = lpBitmapInfo->bmiColors[i].rgbRed;
		lpPalette->palPalEntry[i].peFlags = 0;
	}

	HPALETTE hPalette= ::CreatePalette(lpPalette);
	HPALETTE hOld = 0;
	free(lpPalette);

	hOld = ::SelectPalette(hDevice, hPalette, FALSE);
	if(GDI_ERROR == ::RealizePalette(hDevice))
	{
		return 0;
	}

	HBITMAP hOutBitmap = ::CreateDIBitmap(hDevice, (PBITMAPINFOHEADER)lpBitmapInfo, CBM_INIT, pData, lpBitmapInfo, DIB_RGB_COLORS);
	::SelectPalette(hDevice, hOld, FALSE);
	::DeleteObject(hPalette);

	if(hOutBitmap == 0)
	{
		char msgbuf[200];
		sprintf(msgbuf, "%d", ::GetLastError());
		msgbuf[199] = 0;
	}

	return hOutBitmap;
}

bool SWilFile::ExtractBitmap8(const char* _pszDestFile, int _index)
{
	HANDLE hDestFile = INVALID_HANDLE_VALUE;
	if(_index < 0 ||
		_index >= m_stWilHead.ImageCount)
	{
		return false;
	}
	hDestFile = ::CreateFile(_pszDestFile, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, NULL, NULL);
	if(hDestFile == INVALID_HANDLE_VALUE)
	{
		return false;
	}

	if(HFILE_ERROR == ::SetFilePointer(m_hWilFile, m_pIndexTable[_index], 0, FILE_BEGIN))
	{
		//::CloseHandle(m_hWilFile);
		//m_hWilFile = NULL;
		return false;
	}
	DWORD nCounter = 0;
	WORD wImgWidth = 0;
	WORD wImgHeight = 0;
	if(!::ReadFile(m_hWilFile, &wImgWidth, sizeof(WORD), &nCounter, NULL))
	{
		//goto _READ_ERROR_WIL;
		return false;
	}
	if(!::ReadFile(m_hWilFile, &wImgHeight, sizeof(WORD), &nCounter, NULL))
	{
		//goto _READ_ERROR_WIL;
		return false;
	}

	DWORD dwImgSize = (wImgWidth * 8 + 31) / 32 * 4 * wImgHeight;
	BITMAPINFOHEADER stBitmapHeader;
	memset(&stBitmapHeader, 0, sizeof(BITMAPINFOHEADER));
	stBitmapHeader.biSize = sizeof(BITMAPINFOHEADER);
	stBitmapHeader.biWidth = wImgWidth;
	stBitmapHeader.biHeight = wImgHeight;
	stBitmapHeader.biPlanes = 1;
	stBitmapHeader.biBitCount = 8;
	stBitmapHeader.biCompression = BI_RGB;
	stBitmapHeader.biSizeImage = dwImgSize;
	stBitmapHeader.biClrImportant = 0;
	stBitmapHeader.biClrUsed = 256;

	DWORD dwWrite = 0;
	WriteFile(hDestFile, "BM", 2, &dwWrite, NULL);
	DWORD dwTotalSize = 14 + 40 + 256*4 + dwImgSize;
	//	Write the total size
	WriteFile(hDestFile, &dwTotalSize, sizeof(DWORD), &dwWrite, NULL);
	//	Write the reserver
	dwTotalSize = 0;
	WriteFile(hDestFile, &dwTotalSize, sizeof(DWORD), &dwWrite, NULL);
	//	Write the offset
	dwTotalSize = 14 + 40 + 256*4;
	WriteFile(hDestFile, &dwTotalSize, sizeof(DWORD), &dwWrite, NULL);
	//	Write the header
	WriteFile(hDestFile, &stBitmapHeader, sizeof(stBitmapHeader), &dwWrite, NULL);
	//	Write the palette
	WriteFile(hDestFile, m_pPalette, 256 * 4, &dwWrite, NULL);

	//	Get the filedata
	char szBuf[1024];
	//DWORD dwImgSize = m_pInfo[_index].uImgWidth * m_pInfo[_index].uImgHeight * 1;
	DWORD dwCanRead = 0;
	DWORD dwRead = 0;

	::SetFilePointer(m_hWilFile, m_pIndexTable[_index] + 8, 0, FILE_BEGIN);
	while(dwImgSize > 0)
	{
		dwCanRead = (dwImgSize > sizeof(szBuf) ? sizeof(szBuf) : dwImgSize);
		ReadFile(m_hWilFile, szBuf, dwCanRead, &dwRead, NULL);
		WriteFile(hDestFile, szBuf, dwRead, &dwWrite, NULL);
		dwImgSize -= dwRead;
	}

#ifdef _CONSOLE_PRINT_
	printf("Extract %s\n",
		_pszDestFile);
#endif
	CloseHandle(hDestFile);

	//	Write offset
	/*
	char szPath[MAX_PATH];
		strcpy(szPath, _pszDestFile);
		PathRemoveFileSpec(szPath);
		strcat(szPath, "\\Placements");
		if(!PathFileExists(szPath))
		{
			mkdir(szPath);
		}
		char szName[20];
		sprintf(szName, "\\%06d.txt",
			_index);
		//sprintf(szBuf, "%s%s",
		//szPath, szName);
		strcat(szPath, szName);
		char szOft[10];
		short sToken = 0x0A0D;
		hDestFile = ::CreateFile(szPath, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, NULL, NULL);
		if(hDestFile != INVALID_HANDLE_VALUE)
		{
			sprintf(szOft, "%d", m_pInfo[_index].sImgOftX);
			WriteFile(hDestFile, szOft, strlen(szOft), &dwWrite, NULL);
			WriteFile(hDestFile, &sToken, sizeof(short), &dwWrite, NULL);
			sprintf(szOft, "%d", m_pInfo[_index].sImgOftY);
			WriteFile(hDestFile, szOft, strlen(szOft), &dwWrite, NULL);
			WriteFile(hDestFile, &sToken, sizeof(short), &dwWrite, NULL);
		}
		CloseHandle(hDestFile);*/
	

	return true;
}