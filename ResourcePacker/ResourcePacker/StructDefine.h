#ifndef _STRUCTDEFINE_H_
#define _STRUCTDEFINE_H_
#include <Windows.h>
/*
 *	����ֵ����
 */
#define SKNL3_ERROR_NOTFINDPROCESS	(-1)
#define SKNL3_ERROR_CANTCREATESNAP	(-2)
#define SKNL3_ERROR_CANTOPENFILE	(0)
#define SKNL3_ERROR_CANTFILEMAP		1
#define SKNL3_ERROR_SUCCESS			(0x11111111)

#define INVALID_VALUE				0x8000000

//=====================================================================================//
//Name: KSYSTEM_SERVICE_TABLE �� KSERVICE_TABLE_DESCRIPTOR                             //
//Descripion: �������� SSDT �ṹ                                                       //
//=====================================================================================//

typedef struct _KSYSTEM_SERVICE_TABLE
{

	PULONG  ServiceTableBase;        // SSDT (System Service Dispatch Table)�Ļ���ַ
	PULONG  ServiceCounterTableBase; // ���� SSDT ��ÿ�����񱻵��õĴ���
	ULONG   NumberOfService;     // �������ĸ���, NumberOfService * 4 ����������ַ��Ĵ�С
	ULONG   ParamTableBase;          // SSPT(System Service Parameter Table)�Ļ���ַ

} KSYSTEM_SERVICE_TABLE, *PKSYSTEM_SERVICE_TABLE;


typedef struct _KSERVICE_TABLE_DESCRIPTOR
{
	KSYSTEM_SERVICE_TABLE   ntoskrnl; // ntoskrnl.exe �ķ�����
	KSYSTEM_SERVICE_TABLE   win32k;   // win32k.sys �ķ�����(GDI32.dll/User32.dll ���ں�֧��)
	KSYSTEM_SERVICE_TABLE   notUsed1;
	KSYSTEM_SERVICE_TABLE   notUsed2;

} KSERVICE_TABLE_DESCRIPTOR, *PKSERVICE_TABLE_DESCRIPTOR;


//������ ntoskrnl.exe �������� SSDT
extern PKSERVICE_TABLE_DESCRIPTOR KeServiceDescriptorTable;


#endif