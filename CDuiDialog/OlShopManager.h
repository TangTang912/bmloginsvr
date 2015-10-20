#ifndef _INC_OLSHOPMANAGER_
#define _INC_OLSHOPMANAGER_
//////////////////////////////////////////////////////////////////////////
#include <map>
//////////////////////////////////////////////////////////////////////////
struct OlShopBuyQueryInfo
{
	int nQueryID;
};
//////////////////////////////////////////////////////////////////////////
typedef std::map<int, OlShopBuyQueryInfo> OlShopBuyQueryInfoMap;
//////////////////////////////////////////////////////////////////////////
class OlShopManager
{
public:
	OlShopManager* GetInstance()
	{
		static OlShopManager s_ins;
		return &s_ins;
	}
public:
	~OlShopManager();

protected:
	OlShopManager();

public:
	//	�������Ƿ����ڵȴ�������֤
	bool IsWaitForQuery(int _nUid);
	//	����������ڵȴ�������֤
	int SetWaitForQuery(int _nUid, bool _bSet);
	//	�õ���ҵĲ�ѯƾ֤
	int GetQueryID(int _nUid);

private:
	int m_nQuerySeed;
	OlShopBuyQueryInfoMap m_xOlShopBuyQueryInfoMap;
};
//////////////////////////////////////////////////////////////////////////
#endif