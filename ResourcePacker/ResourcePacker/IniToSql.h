#ifndef INITOSQL_H_
#define INITOSQL_H_
#include <sqlite\sqlite3.h>
#include <Windows.h>
#include <stdio.h>
#include <vector>
#include <map>
#include <string>
#include "SKnl3Helper.h"

//	װ������
struct ItemAttrib
{
	//	װ������ ΨһID
	UINT id;	//	����
	//	װ������
	char name[20];
	//	����ֵ
	BYTE lucky;	//	����ҩƷ 0:�ֳ�5�ݼ� 1:ֱ�Ӽ� ���ھ��� 0:��� 2:�س�
	//	����ֵ
	BYTE curse;	//	���ڹ��� �Ƿ��ڵ��� 0 == �ڵ��� 1 == �ڵ���   ���ITEM_COST��� 0:ҩƷ 1:����
	//	���
	BYTE hide;	//	
	//	׼ȷ
	BYTE accuracy;
	//	�����ٶ�
	BYTE atkSpeed;
	//	��Լ���
	BYTE atkPalsy;
	//	�ж�����
	BYTE atkPois;
	//	�ƶ��ٶ�
	BYTE moveSpeed;
	//	����
	BYTE weight;
	//	Ҫ������ 1 = �ȼ� 2 = ���� 3 = ħ���� 4 = ���� 5 = �Ա�
	BYTE reqType;
	//	Ҫ��ֵ	0 = ͨ�� 0 = սʿ 1 = ��ʦ 2 = ��ʿ   ||0 = �� 1 = Ů
	BYTE reqValue;
	//	��Ů
	BYTE sex;
	//	����
	BYTE type;
	//	������
	USHORT maxDC;
	USHORT DC;
	//	������
	USHORT maxAC;
	USHORT AC;
	//	ħ��
	USHORT maxMAC;
	USHORT MAC;
	//	����
	USHORT maxSC;//	����ȷ������Ĺ�������
	USHORT SC;//	����ȷ��������Ұ
	//	ħ����
	USHORT maxMC;	//	����ȷ�������Ƿ��ڳ��״̬
	USHORT MC;		//	����ȷ�������Ƿ�������������
	//	Ѫ��
	UINT maxHP;
	UINT HP;
	//	ħ
	UINT maxMP;	
	UINT MP;	
	//	����
	UINT maxEXPR;
	UINT EXPR;
	//	װ����Ҫ��ȼ� ��reqType����
	USHORT level;
	//	����
	USHORT extra;
	//	ͼƬ����  ���ڹ���������ʱ�� ��ʾ��ͼID
	USHORT tex;

	//	�۸�	//	����Ļ� ��ְҵ
	USHORT price;
};

int IniFileTransToSqlFile(const char* lpszCfg, sqlite3* pSql);
int SqlFileTransToIniFile(const char* lpszCfg, sqlite3* pSql);


int IniFileTransToSqlFileMain();
int SqlFileTransToIniFileMain();

bool Ini2SqlDropItem(sqlite3* _pSql, const char* _pszFilename);
bool Ini2SqlMonsters(sqlite3* _pSql, const char* _pszFilename);
bool Ini2SqlItems(sqlite3* _pSql, const char* _pszFilename);
bool Ini2SqlMagic(sqlite3* _pSql, const char* _pszFilename);

void GetIniFileSections(const char* _pszFile, std::vector<int>& _xOutput);
void GetIniFileKeys(const char* _pszAppName, const char* _pszFile, std::vector<int>& _xOutput);

bool GetNameToIDMap(const char* _pszFile, std::map<std::string, int>& _xOutput);
bool ParseDropItem(const char* _pszFile, char* _pBuf, int _id);
bool ParseDropItem(const char* _pszFile, char* _pBuf, int _id, std::map<std::string, int>& _xNameIDMap);

struct DBCallbackParam
{
	ItemAttrib* pItem;
	const char* szOutputFile;
};
int DBCallback(void* _param, int _count, char** _value, char** _name);

/*
*	����ļ���С
*/
//DWORD SKNL3GetFileSize(LPCTSTR lpszFileName);
/*
*	�������Ŀ¼
*/
//BOOL SKNL3GetCurrentAppPath(LPSTR lpBuffer, size_t _buffer_size);

#endif