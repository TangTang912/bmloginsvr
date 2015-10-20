#ifndef _INC_SKNL3HELPER_
#define _INC_SKNL3HELPER_

#include <Windows.h>
#include <TlHelp32.h>
#include <WinNT.h>
#include <tchar.h>

#include "structdefine.h"

/*
 *	��������Ȩ�� hToken: ����token, lpszPrivilegeName: Ȩ���� fEnable: �Ƿ����ø�Ȩ��, pPrePrivileges: �滻ǰ��Ȩ��
 *	����ֵ true: ���óɹ� false: ����ʧ��
 */
bool SKNL3EnablePrivilege(HANDLE hToken, LPCTSTR lpszPrivilegeName, bool bEnable, PTOKEN_PRIVILEGES pPrePrivileges);
/*
 *	������ǰ���̵���Ȩ��
 */
bool SKNL3EnableCurrentDbgPrivilege(bool bEnable);
/*
 *	���ݽ�������ȡ����PID
 */
DWORD SKNL3GetProcessPID(LPCTSTR lpszProcessName);
/*
 *	�Ƿ�Ϸ���PE�ļ�
 */
bool SKNL3IsValidPeFile(HANDLE hFileMap);
/*
 *	����һ���ļ����ڴ�ӳ��
 */
HANDLE SKNL3CreateMemoryFileMapping(LPCTSTR lpszFileName);
/*
 *	RVAת��Ϊ�����ַƫ��
 */
DWORD SKNL3GetPhysicalOffsetByRVA(HANDLE hFileMap, DWORD rva);
/*
 *	VAת��Ϊ�����ַƫ��
 */
DWORD SKNL3GetPhysicalOffsetByVA(HANDLE hFileMap, DWORD va);
/*
 *	���PE�ļ�������DLL����
 */
DWORD SKNL3GetImportDllSum(HANDLE hFileMap);
/*
 *	���PE�ļ������������ַƫ��
 */
DWORD SKNL3GetImportTablePAOffset(HANDLE hFileMap);
/*
 *	���ĳ��DLL�ĵ��뺯������
 */
DWORD SKNL3GetImportFunctionSumByIndex(HANDLE hFileMap, DWORD dwDllIndex);
DWORD SKNL3GetImportFunctionSumByName(HANDLE hFileMap, const char* lpszFuncName);
/*
 *	���DLL���뺯������
 */
const char* SKNL3GetImportFunctionName(HANDLE hFileMap, DWORD dwDllIndex, DWORD dwFuncIndex);
/*
 *	��ȡ����DLL���ļ���
 */
const char* SKNL3GetImportDllNameByIndex(HANDLE hFileMap, DWORD dwDllIndex);
/*
 *	��ȡ����DLL����
 */
DWORD SKNL3GetImportDllIndexByName(HANDLE hFileMap, const char* lpszDllName);
/*
 *	�Ƿ��е��뺯��������Ϣ(��Щ������ŵ����)
 */
bool SKNL3IsImportByName(HANDLE hFileMap, DWORD dwDllIndex);
/*
 *	������û�����Ƶĵ��� ��ȡ��������
 */
DWORD SKNL3GetImportFunctionOrder(HANDLE hFileMap, DWORD dwDllIndex, DWORD dwFuncIndex);
/*
 *	��ó�����ڵ�RVA
 */
DWORD SKNL3GetPeEntryPoint(HANDLE hFileMap);




/*
 *	����ļ���С
 */
DWORD SKNL3GetFileSize(LPCTSTR lpszFileName);
/*
 *	�������Ŀ¼
 */
BOOL SKNL3GetCurrentAppPath(LPSTR lpBuffer, size_t _buffer_size);

#endif