#include "OlShopManager.h"
//////////////////////////////////////////////////////////////////////////
OlShopManager::OlShopManager()
{
	m_nQuerySeed = 0;
}

OlShopManager::~OlShopManager()
{

}

//////////////////////////////////////////////////////////////////////////
bool OlShopManager::IsWaitForQuery(int _nUid)
{
	OlShopBuyQueryInfoMap::const_iterator fndIter = m_xOlShopBuyQueryInfoMap.find(_nUid);
	if(fndIter == m_xOlShopBuyQueryInfoMap.end())
	{
		return false;
	}
	return true;
}

int OlShopManager::SetWaitForQuery(int _nUid, bool _bSet)
{
	int nQueryID = GetQueryID(_nUid);
	if(!_bSet)
	{
		if(-1 != nQueryID)
		{
			//	���ڵȴ���ȡ���ȴ�
			OlShopBuyQueryInfoMap::const_iterator fndIter = m_xOlShopBuyQueryInfoMap.find(_nUid);
			if(fndIter != m_xOlShopBuyQueryInfoMap.end())
			{
				m_xOlShopBuyQueryInfoMap.erase(fndIter);
				return 0;
			}
		}
	}
	else
	{
		//	���õȴ�
		if(-1 == nQueryID)
		{
			OlShopBuyQueryInfo info;
			info.nQueryID = ++m_nQuerySeed;
			m_xOlShopBuyQueryInfoMap.insert(std::make_pair(_nUid, info));
			return info.nQueryID;
		}
	}
}

int OlShopManager::GetQueryID(int _nUid)
{
	OlShopBuyQueryInfoMap::const_iterator fndIter = m_xOlShopBuyQueryInfoMap.find(_nUid);
	if(fndIter == m_xOlShopBuyQueryInfoMap.end())
	{
		return -1;
	}
	return fndIter->second.nQueryID;
}

void OlShopManager::AddShopItem(int _nID)
{
	//	find exists
	bool bExists = false;

	for(OlShopItemList::const_iterator begIter = m_xOlShopItemList.begin();
		begIter != m_xOlShopItemList.end();
		++begIter){
			if(*begIter == _nID){
				return;
			}
	}

	m_xOlShopItemList.push_back(_nID);
}

void OlShopManager::RemoveShopItem(int _nID)
{
	for(OlShopItemList::iterator begIter = m_xOlShopItemList.begin();
		begIter != m_xOlShopItemList.end();
		++begIter){
			if(*begIter == _nID){
				m_xOlShopItemList.erase(begIter);
				return;
			}
	}
}

void OlShopManager::GetShopItems(OlShopItemVector& _refItems)
{
	_refItems.resize(m_xOlShopItemList.size());
	int nInsertIndex = 0;

	for(OlShopItemList::const_iterator begIter = m_xOlShopItemList.begin();
		begIter != m_xOlShopItemList.end();
		++begIter){
			_refItems[nInsertIndex++] = *begIter;
	}
}