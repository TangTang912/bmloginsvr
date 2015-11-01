#ifndef _INC_STOVEMANAGER_
#define _INC_STOVEMANAGER_
//////////////////////////////////////////////////////////////////////////
#include <map>
#include <vector>
//////////////////////////////////////////////////////////////////////////
#define MAX_LIFESKILL_LEVEL	15
//////////////////////////////////////////////////////////////////////////
enum LifeSkillType
{
	//	ұ����ʯ
	kLifeSkill_SmeltOre = 0,
	kLifeSkill_SmeltWood,
	kLifeSkill_SmeltCloth,
	kLifeSkill_SmeltGem,
	kLifeSkill_SmeltEquip,
	kLifeSkill_Total,
};

struct LifeSkillInfo
{
	int nSkillType;
	int nMaxLevel;
	short uExp[15];
};
//////////////////////////////////////////////////////////////////////////
class StoveManager
{
public:
	static StoveManager* GetInstance()
	{
		static StoveManager* s_pIns = NULL;
		if(NULL == s_pIns)
		{
			s_pIns = new StoveManager;
		}
		return s_pIns;
	}
	~StoveManager();

protected:
	StoveManager();

public:
	bool Init();
	bool LoadBuffer(const char* _pBuffer, size_t _uSize);

	const LifeSkillInfo* GetLifeSkillInfo(LifeSkillType _eType);

private:
	LifeSkillInfo m_ayLifeSkills[kLifeSkill_Total];
};
//////////////////////////////////////////////////////////////////////////
#endif