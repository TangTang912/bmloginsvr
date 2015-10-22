#ifndef _INC_OLSHOPMANAGER_
#define _INC_OLSHOPMANAGER_
//////////////////////////////////////////////////////////////////////////
#include <map>
#include <list>
#include <vector>
//////////////////////////////////////////////////////////////////////////
struct OlShopBuyQueryInfo
{
	int nQueryID;
};
//////////////////////////////////////////////////////////////////////////
typedef std::map<int, OlShopBuyQueryInfo> OlShopBuyQueryInfoMap;
typedef std::list<int> OlShopItemList;
typedef std::vector<int> OlShopItemVector;
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

	//	�����Ʒ
	void AddShopItem(int _nID);
	void RemoveShopItem(int _nID);
	void GetShopItems(OlShopItemVector& _refItems);

private:
	int m_nQuerySeed;
	OlShopBuyQueryInfoMap m_xOlShopBuyQueryInfoMap;
	OlShopItemList m_xOlShopItemList;
};
//////////////////////////////////////////////////////////////////////////
#endif