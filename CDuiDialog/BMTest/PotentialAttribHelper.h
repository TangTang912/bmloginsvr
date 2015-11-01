#ifndef _INC_POTENTIALATTRIBHELPER_
#define _INC_POTENTIALATTRIBHELPER_
//////////////////////////////////////////////////////////////////////////
#include <Windows.h>
#include <stdio.h>
//////////////////////////////////////////////////////////////////////////
/*
Mp: |32-20bit 12bit Ǳ����������(4095max)|19-16bit 4bit ����������(15max)|15-8 8bit Ǳ������ƫ��(����+ƫ��ȷ��Ǳ��) (255max)|8-1bit 8bit ��ǰװ����Ǳ������ 0Ϊû��Ǳ�� (255max)|
*/
//////////////////////////////////////////////////////////////////////////
class PotentialAttribHelper
{
public:
	static WORD GetPotentialBase(DWORD _dwData)
	{
		DWORD dwBase = (_dwData & 0xfff00000) >> 20;
		return (WORD)dwBase;
	}
	static void SetPotentialBase(DWORD& _dwData, WORD _wBase)
	{
		WORD wBase = _wBase & 0x0fff;
		_dwData |= (wBase << 20);
	}

	static WORD GetPotentialIndex(DWORD _dwData)
	{
		DWORD dwIndex = _dwData & 0x000000ff;
		return (WORD)dwIndex;
	}
	static void SetPotentialIndex(DWORD& _dwData, BYTE _bIndex)
	{
		_dwData &= 0xffffff00;
		_dwData |= _bIndex;
	}

	static BYTE GetPotentialOffset(DWORD _dwData)
	{
		DWORD dwOffset = (_dwData & 0x0000ff00) >> 8;
		return (BYTE)dwOffset;
	}
	static void SetPotentialOffset(DWORD& _dwData, BYTE _bOft)
	{
		_dwData &= 0xffff00ff;
		_dwData |= (_bOft << 8);
	}

	static BYTE GetPotentialTime(DWORD _dwData)
	{
		DWORD dwTime = (_dwData & 0x000f0000) >> 16;
		return dwTime;
	}
	static void SetPotentialTime(DWORD _dwData, BYTE _bTimes)
	{
		_dwData &= 0xfff0ffff;
		_dwData |= (_bTimes << 16);
	}

	static DWORD MakePotential(WORD _wBase, BYTE _bOffset, BYTE _bPotentialIndex, BYTE _bTimes)
	{
		DWORD dwData = 0;
		SetPotentialBase(dwData, _wBase);
		SetPotentialOffset(dwData, _bOffset);
		SetPotentialIndex(dwData, _bPotentialIndex);
		SetPotentialTime(dwData, _bTimes);
		return dwData;
	}

	//	unit test
	static bool Test()
	{
		DWORD dwData = MakePotential(34, 12, 0, 0);
		printf("Get potential data base 34, offset 12, index 0, times 0, Data:%d\n", dwData);

		if(34 != GetPotentialBase(dwData))
		{
			printf("Invalid base\n");
			return false;
		}
		if(12 != GetPotentialOffset(dwData))
		{
			printf("Invalid offset\n");
			return false;
		}
		if(0 != GetPotentialIndex(dwData))
		{
			printf("Invalid index\n");
			return false;
		}
		if(0 != GetPotentialTime(dwData))
		{
			printf("Invalid times\n");
			return false;
		}

		return true;
	}
};
//////////////////////////////////////////////////////////////////////////
#endif