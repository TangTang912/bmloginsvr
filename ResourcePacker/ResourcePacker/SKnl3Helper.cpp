//#include "stdafx.h"
#include "SKnl3Helper.h"
#include <stdio.h>

/*
 *	��������Ȩ�� hToken: ����token, lpszPrivilegeName: Ȩ���� fEnable: �Ƿ����ø�Ȩ��, pPrePrivileges: �滻ǰ��Ȩ��
 *	����ֵ true: ���óɹ� false: ����ʧ��
 */
bool SKNL3EnablePrivilege(HANDLE hToken, LPCTSTR lpszPrivilegeName, bool bEnable, PTOKEN_PRIVILEGES pPrePrivileges)
{
	TOKEN_PRIVILEGES tp;
	tp.PrivilegeCount = 1;
	//	��ѯ privilegeName �ķ������ƣ���ʼ��Luid
	::LookupPrivilegeValue(NULL, lpszPrivilegeName, &tp.Privileges[0].Luid);
	//	������ӦLuid��Ȩ��
	tp.Privileges[0].Attributes = (bEnable ? SE_PRIVILEGE_ENABLED : FALSE);
	//	Ӧ��Ȩ�� ��Ȩ
	::AdjustTokenPrivileges(hToken, FALSE, &tp, sizeof(TOKEN_PRIVILEGES) ,pPrePrivileges, NULL);

	return (GetLastError() == ERROR_SUCCESS);
}
/*
 *	������ǰ���̵���Ȩ��
 */
bool SKNL3EnableCurrentDbgPrivilege(bool bEnable)
{
	HANDLE hCurToken = NULL;
	if(!::OpenProcessToken(::GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hCurToken))
	{
		return false;
	}

	bool bSuccess = SKNL3EnablePrivilege(hCurToken, SE_DEBUG_NAME, bEnable, NULL);
	if(!bSuccess)
	{
		::CloseHandle(hCurToken);
		return false;
	}

	return true;
}
/*
*	���ݽ�������ȡ����PID
*/
DWORD SKNL3GetProcessPID(LPCTSTR lpszProcessName)
{
	//	�������̿���
	HANDLE hProcessSnapshot = ::CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

	if(hProcessSnapshot == INVALID_HANDLE_VALUE)
	{
		return 0;
	}

	//	������ȡ������Ϣ
	PROCESSENTRY32 ps32;
	ps32.dwSize = sizeof(PROCESSENTRY32);

	if(::Process32First(hProcessSnapshot, &ps32))
	{
		if(!strcmp(ps32.szExeFile, lpszProcessName))
		{
			::CloseHandle(hProcessSnapshot);
			return ps32.th32ProcessID;
		}
		while(::Process32Next(hProcessSnapshot, &ps32))
		{
			if(!strcmp(ps32.szExeFile, lpszProcessName))
			{
				::CloseHandle(hProcessSnapshot);
				return ps32.th32ProcessID;
			}
		}
	}

	::CloseHandle(hProcessSnapshot);
	return 0;
}
/*
*	�Ƿ�Ϸ���PE�ļ�
*/
bool SKNL3IsValidPeFile(HANDLE hFileMap)
{
	if(!hFileMap)		{return false;}

	//	DOS MZ ͷ ��һ����ԱΪ MZ ħ�� �� e_lfanew Ϊָ�� PE �ļ�ͷ���ļ�ƫ��
	//	�ȼ��ħ��
	IMAGE_DOS_HEADER* pDosHeader = (IMAGE_DOS_HEADER*)hFileMap;
	if(pDosHeader->e_magic != IMAGE_DOS_SIGNATURE)
	{
		return false;
	}

	//	��e_lfanew ƫ�����PE�ļ�ͷ
	IMAGE_NT_HEADERS* pPeHeader = (IMAGE_NT_HEADERS*)((char*)pDosHeader + pDosHeader->e_lfanew);
	if(pPeHeader->Signature != IMAGE_NT_SIGNATURE)
	{
		return false;
	}

	return true;
}
/*
*	����һ���ļ����ڴ�ӳ��
*/
HANDLE SKNL3CreateMemoryFileMapping(LPCTSTR lpszFileName)
{
	HANDLE hFile = NULL;
	HANDLE hMapFile = NULL;
	HANDLE hMapView = NULL;

#ifdef _DEBUG
	char szErr[10];
#endif

	do 
	{
		hFile = ::CreateFile(lpszFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
		if(hFile == INVALID_HANDLE_VALUE)
		{
			hFile = NULL;
#ifdef _DEBUG
			sprintf(szErr, "%d", GetLastError());
			OutputDebugString(szErr);
#endif
			break;
		}

		hMapFile = ::CreateFileMapping(hFile, NULL, PAGE_READWRITE, 0, 0, 0);
		if(!hMapFile)
		{
			break;
		}

		::CloseHandle(hFile);
		hFile = NULL;
		hMapView = ::MapViewOfFile(hMapFile, FILE_MAP_READ | FILE_MAP_WRITE, 0, 0, 0);
		if(!hMapView)
		{
			break;
		}

		::CloseHandle(hMapFile);
		hMapFile = NULL;
	} while (0);

	//	����ͷ�
	{
		if(hFile)
		{
			::CloseHandle(hFile);
		}
		if(hMapFile)
		{
			::CloseHandle(hMapFile);
		}
	}

	return hMapView;
}
/*
*	RVAת��Ϊ�����ַƫ��
*/
DWORD SKNL3GetPhysicalOffsetByRVA(HANDLE hFileMap, DWORD rva)
{
	IMAGE_DOS_HEADER* pDosHeader = (IMAGE_DOS_HEADER*)hFileMap;
	IMAGE_NT_HEADERS* pPeHeader = (IMAGE_NT_HEADERS*)((char*)pDosHeader + pDosHeader->e_lfanew);
	IMAGE_SECTION_HEADER* pSectionTable = (IMAGE_SECTION_HEADER*)((char*)pPeHeader + sizeof(IMAGE_NT_HEADERS));
	int nSectionSum = pPeHeader->FileHeader.NumberOfSections;
	//	VirtualAddress �ö�ӳ�����ڴ�������ַ
	//	PointerToRawData �ö�Ҫӳ����ļ������ַ
	//	VirtualSize Ҫӳ�����ڴ�Ĵ�С
	//	�����ַ = ����ڸö�RVA��ƫ�� + �öε������ַ
	for(int i = 0; i < nSectionSum; ++i)
	{
		//	�ж�rva�Ƿ��ڶ���
		if(rva >= (pSectionTable + i)->VirtualAddress &&
			rva <= (pSectionTable + i)->VirtualAddress + (pSectionTable + i)->Misc.VirtualSize)
		{
			//	����ƫ�����ʵ��λ��
			return ((pSectionTable + i)->PointerToRawData + rva - (pSectionTable + i)->VirtualAddress);
		}
	}

	return 0;
}
/*
*	VAת��Ϊ�����ַƫ��
*/
DWORD SKNL3GetPhysicalOffsetByVA(HANDLE hFileMap, DWORD va)
{
	DWORD nImageBase = (DWORD)::GetModuleHandle(NULL);
	DWORD rva = va - nImageBase;
	return SKNL3GetPhysicalOffsetByRVA(hFileMap, rva);
}
/*
 *	���PE�ļ�������DLL����
 */
DWORD SKNL3GetImportDllSum(HANDLE hFileMap)
{
	IMAGE_IMPORT_DESCRIPTOR* pImportTable = (IMAGE_IMPORT_DESCRIPTOR*)((DWORD)hFileMap + SKNL3GetImportTablePAOffset(hFileMap));

	int nCounter = 0;
	while(1)
	{
		if ((pImportTable + nCounter)->Characteristics == 0 &&
			(pImportTable + nCounter)->FirstThunk == 0 &&
			(pImportTable + nCounter)->ForwarderChain == 0 &&
			(pImportTable + nCounter)->Name == 0 &&
			(pImportTable + nCounter)->OriginalFirstThunk == 0 &&
			(pImportTable + nCounter)->TimeDateStamp == 0)
		{
			return nCounter;
		}
		++nCounter;
	}
	return nCounter;
}
/*
*	���PE�ļ������������ַƫ��
*/
DWORD SKNL3GetImportTablePAOffset(HANDLE hFileMap)
{
	IMAGE_DOS_HEADER* pDosHeader = (IMAGE_DOS_HEADER*)hFileMap;
	IMAGE_NT_HEADERS* pPeHeader = (IMAGE_NT_HEADERS*)((char*)pDosHeader + pDosHeader->e_lfanew);

	//	��ȡ�����RVA��PA
	DWORD pImportTableRVA = pPeHeader->OptionalHeader.DataDirectory[1].VirtualAddress;
	DWORD pImportTablePA = SKNL3GetPhysicalOffsetByRVA(hFileMap, pImportTableRVA);
	return pImportTablePA;
}
/*
*	���ĳ��DLL�ĵ��뺯������
*/
DWORD SKNL3GetImportFunctionSumByIndex(HANDLE hFileMap, DWORD dwDllIndex)
{
	//	��ȡ������ַ
	IMAGE_IMPORT_DESCRIPTOR* pImportTable = (IMAGE_IMPORT_DESCRIPTOR*)((DWORD)hFileMap + SKNL3GetImportTablePAOffset(hFileMap)) + dwDllIndex;
	IMAGE_THUNK_DATA* pThunkDataRVA = (IMAGE_THUNK_DATA*)pImportTable->OriginalFirstThunk;
	//	��ֹOriginalFirstThunkΪ0
	if(pThunkDataRVA == NULL)
	{
		//	����FirstThunk
		pThunkDataRVA = (IMAGE_THUNK_DATA*)pImportTable->FirstThunk;
	}
	IMAGE_THUNK_DATA* pThunkDataPA = (IMAGE_THUNK_DATA*)((DWORD)hFileMap + SKNL3GetPhysicalOffsetByRVA(hFileMap, (DWORD)pThunkDataRVA));

	int nCounter = 0;
	while (1)
	{
		if((pThunkDataPA + nCounter)->u1.Function == 0)
		{
			return nCounter;
		}
		++nCounter;
	}
	return nCounter;
}
DWORD SKNL3GetImportFunctionSumByName(HANDLE hFileMap, const char* lpszFuncName)
{
	//	��ȡ������ַ
	IMAGE_IMPORT_DESCRIPTOR* pImportTable = (IMAGE_IMPORT_DESCRIPTOR*)((DWORD)hFileMap + SKNL3GetImportTablePAOffset(hFileMap));

	//	�����ж�Dll����
	bool bFound = false;
	bool bEqu = false;
	const char* pImportDllName = NULL;
	for(int i = 0; i < SKNL3GetImportDllSum(hFileMap); ++i)
	{
		pImportDllName = (const char*)((DWORD)hFileMap + (DWORD)SKNL3GetPhysicalOffsetByRVA(hFileMap, pImportTable->Name));
		if(strcmp(lpszFuncName, pImportDllName))
		{
			pImportTable += 1;
		}
		else
		{
			bFound = true;
			break;
		}
	}

	if(!bFound)
	{
		return 0;
	}

	IMAGE_THUNK_DATA* pThunkDataRVA = (IMAGE_THUNK_DATA*)pImportTable->OriginalFirstThunk;
	//	��ֹOriginalFirstThunkΪ0
	if(pThunkDataRVA == NULL)
	{
		//	����FirstThunk
		pThunkDataRVA = (IMAGE_THUNK_DATA*)pImportTable->FirstThunk;
	}

	IMAGE_THUNK_DATA* pThunkDataPA = (IMAGE_THUNK_DATA*)((DWORD)hFileMap + SKNL3GetPhysicalOffsetByRVA(hFileMap, (DWORD)pThunkDataRVA));

	int nCounter = 0;
	while (1)
	{
		if((pThunkDataPA + nCounter)->u1.Function == 0)
		{
			return nCounter;
		}
		++nCounter;
	}
	return nCounter;
}
/*
*	���DLL���뺯������
*/
const char* SKNL3GetImportFunctionName(HANDLE hFileMap, DWORD dwDllIndex, DWORD dwFuncIndex)
{
	IMAGE_IMPORT_DESCRIPTOR* pImportTable = (IMAGE_IMPORT_DESCRIPTOR*)((DWORD)hFileMap + SKNL3GetImportTablePAOffset(hFileMap)) + dwDllIndex;
	IMAGE_THUNK_DATA* pFristThunkDataRVA = (IMAGE_THUNK_DATA*)pImportTable->OriginalFirstThunk;
	//	��ֹOriginalFirstThunkΪ0
	if(pFristThunkDataRVA == NULL)
	{
		//	����FirstThunk
		pFristThunkDataRVA = (IMAGE_THUNK_DATA*)pImportTable->FirstThunk;
	}
	//	��ȡ��Ӧ������IMAGE_THUNK_DATA
	IMAGE_THUNK_DATA* pTargetThunkDataRVA = pFristThunkDataRVA + dwFuncIndex;
	//	����RVAȡ��IMAGE_IMPORT_BY_NAME��PA
	IMAGE_THUNK_DATA* pTargetThunkDataPA = (IMAGE_THUNK_DATA*)((DWORD)hFileMap + SKNL3GetPhysicalOffsetByRVA(hFileMap, (DWORD)pTargetThunkDataRVA));
	IMAGE_IMPORT_BY_NAME* pTargetNameRVA = (IMAGE_IMPORT_BY_NAME*)(pTargetThunkDataPA->u1.Function);
	IMAGE_IMPORT_BY_NAME* pTargetNamePA = (IMAGE_IMPORT_BY_NAME*)((DWORD)hFileMap + SKNL3GetPhysicalOffsetByRVA(hFileMap, (DWORD)pTargetNameRVA));
	return (const char*)(pTargetNamePA->Name);
}
/*
*	��ȡ����DLL���ļ���
*/
const char* SKNL3GetImportDllNameByIndex(HANDLE hFileMap, DWORD dwDllIndex)
{
	IMAGE_IMPORT_DESCRIPTOR* pImportTable = (IMAGE_IMPORT_DESCRIPTOR*)((DWORD)hFileMap + SKNL3GetImportTablePAOffset(hFileMap)) + dwDllIndex;
	const char* pNameRVA = (const char*)pImportTable->Name;
	const char* pNamePA = (const char*)((DWORD)hFileMap + SKNL3GetPhysicalOffsetByRVA(hFileMap, (DWORD)pNameRVA));
	return pNamePA;
}
/*
*	��ȡ����DLL����
*/
DWORD SKNL3GetImportDllIndexByName(HANDLE hFileMap, const char* lpszDllName)
{
	DWORD dwCounter = 0;
	IMAGE_IMPORT_DESCRIPTOR* pFirstDescriptorPA = (IMAGE_IMPORT_DESCRIPTOR*)((DWORD)hFileMap + SKNL3GetImportTablePAOffset(hFileMap));
	const char* lpszNameRVA = NULL;
	const char* lpszNamePA = NULL;
	bool bFound = false;

	for(int i = 0; i < SKNL3GetImportDllSum(hFileMap); ++i)
	{
		lpszNameRVA = (const char*)(pFirstDescriptorPA + i)->Name;
		lpszNamePA = (const char*)((DWORD)hFileMap + SKNL3GetPhysicalOffsetByRVA(hFileMap, (DWORD)lpszNameRVA));
		if(!strcmp(lpszDllName, lpszNamePA))
		{
			bFound = true;
			return dwCounter;
		}
		++dwCounter;
	}

	if(bFound)
	{
		return dwCounter;
	}
	else
	{
		return INVALID_VALUE;
	}
}
/*
*	�Ƿ��е��뺯��������Ϣ(��Щ������ŵ����)
*/
bool SKNL3IsImportByName(HANDLE hFileMap, DWORD dwDllIndex)
{
	IMAGE_IMPORT_DESCRIPTOR* pImportTable = (IMAGE_IMPORT_DESCRIPTOR*)((DWORD)hFileMap + SKNL3GetImportTablePAOffset(hFileMap)) + dwDllIndex;
	IMAGE_THUNK_DATA* pFristThunkDataRVA = (IMAGE_THUNK_DATA*)pImportTable->OriginalFirstThunk;
	//	��ֹOriginalFirstThunkΪ0
	if(pFristThunkDataRVA == NULL)
	{
		//	����FirstThunk
		pFristThunkDataRVA = (IMAGE_THUNK_DATA*)pImportTable->FirstThunk;
	}
	IMAGE_THUNK_DATA* pFisrtThunkDataPA = (IMAGE_THUNK_DATA*)((DWORD)hFileMap + SKNL3GetPhysicalOffsetByRVA(hFileMap, (DWORD)pFristThunkDataRVA));
	DWORD dwRet = pFisrtThunkDataPA->u1.Function;
	dwRet &= IMAGE_ORDINAL_FLAG;
	if(dwRet == 0)
	{
		return true;
	}
	return false;
}
/*
 *	������û�����Ƶĵ��� ��ȡ��������
 */
DWORD SKNL3GetImportFunctionOrder(HANDLE hFileMap, DWORD dwDllIndex, DWORD dwFuncIndex)
{
	if(SKNL3IsImportByName(hFileMap, dwDllIndex))
	{
		return INVALID_VALUE;
	}

	IMAGE_IMPORT_DESCRIPTOR* pImportTable = (IMAGE_IMPORT_DESCRIPTOR*)((DWORD)hFileMap + SKNL3GetImportTablePAOffset(hFileMap)) + dwDllIndex;
	IMAGE_THUNK_DATA* pFristThunkDataRVA = (IMAGE_THUNK_DATA*)pImportTable->OriginalFirstThunk;
	//	��ֹOriginalFirstThunkΪ0
	if(pFristThunkDataRVA == NULL)
	{
		//	����FirstThunk
		pFristThunkDataRVA = (IMAGE_THUNK_DATA*)pImportTable->FirstThunk;
	}
	IMAGE_THUNK_DATA* pFisrtThunkDataPA = (IMAGE_THUNK_DATA*)((DWORD)hFileMap + SKNL3GetPhysicalOffsetByRVA(hFileMap, (DWORD)pFristThunkDataRVA)) + dwFuncIndex;
	DWORD dwRet = pFisrtThunkDataPA->u1.Function;
	dwRet &= (~IMAGE_ORDINAL_FLAG);

	return dwRet;
}
/*
*	��ó�����ڵ�RVA
*/
DWORD SKNL3GetPeEntryPoint(HANDLE hFileMap)
{
	IMAGE_DOS_HEADER* pDosHeader = (IMAGE_DOS_HEADER*)hFileMap;
	IMAGE_NT_HEADERS* pPeHeader = (IMAGE_NT_HEADERS*)((char*)pDosHeader + pDosHeader->e_lfanew);
	return pPeHeader->OptionalHeader.AddressOfEntryPoint;
}












/*
*	����ļ���С
*/
DWORD SKNL3GetFileSize(LPCTSTR lpszFileName)
{
	if(lpszFileName == NULL)
	{
		return -1;
	}

	if(lstrlen(lpszFileName) > MAX_PATH)
	{
		return -1;
	}

	WIN32_FIND_DATA wfd;
	HANDLE hFind = ::FindFirstFile(lpszFileName, &wfd);
	if(hFind == INVALID_HANDLE_VALUE)
	{
		return -1;
	}
	::FindClose(hFind);

	if(wfd.nFileSizeHigh != 0)
	{
		return -1;
	}

	return wfd.nFileSizeLow;
}
/*
*	�������Ŀ¼
*/
BOOL SKNL3GetCurrentAppPath(LPSTR lpBuffer, size_t _buffer_size)
{
	::GetModuleFileName(NULL, lpBuffer, _buffer_size);
	
	//	������ 0
	int nStrLen = strlen(lpBuffer);
	lpBuffer += nStrLen;

	for(int i = 0; i < nStrLen; ++i)
	{
		if(*(lpBuffer--) == '\\')
		{
			lpBuffer += 2;
			*lpBuffer = '\0';
			return TRUE;
		}
	}

	return TRUE;
}