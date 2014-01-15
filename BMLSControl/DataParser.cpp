#include "DataParser.h"
//////////////////////////////////////////////////////////////////////////
DataParser::DataParser(unsigned int _size /* = MAX_PACKET_SIZE */)
: m_xBuffer(_size)
{
	//
	m_pHandler = NULL;
}

DataParser::~DataParser()
{
	//
}

//////////////////////////////////////////////////////////////////////////
/************************************************************************/
/* void OnSocketData(void* _pData, unsigned int _len)
/* Param:	_pData received data
/*			_len received data length
/* Return:	None
/************************************************************************/
#ifdef BUFFER_EXCEPTION

#define CHECK_CAPACITY(LEN)		if(m_xBuffer.GetAvailableLength() < LEN)\
{\
	throw std::exception("No more buffer on parsing progress");\
	return;\
}

#else

#define CHECK_CAPACITY(LEN)		if(m_xBuffer.GetAvailableLength() < LEN)\
{\
	return;\
}

#endif

void DataParser::OnSocketData(const void* _pData, unsigned int _len)
{
	//
	/*if(m_xBuffer.GetAvailableLength() < _len)
	{
#ifdef BUFFER_EXCEPTION
		throw std::exception("No more buffer on parsing progress");
#endif
		return;
	}*/

	if(m_xBuffer.IsEmpty())
	{
		//	����Ϊ�� �ȶ�ȡ���ݳ���
		if(_len < sizeof(unsigned int))
		{
			//	���Ȳ���
			//////////////////////////////////////////////////////////////////////////
			CHECK_CAPACITY(_len);
			//////////////////////////////////////////////////////////////////////////
			m_xBuffer.Write(_pData, _len);
			return;
		}
		//	���ȿɶ�
		else
		{
			const char* pSocketData = (const char*)_pData;
			unsigned int uPacketLen = *(unsigned int*)_pData;
			unsigned int uLeftLen = _len;
			m_xBuffer << uPacketLen;
			//	uPacketLen��������� ת��Ϊ���������
			uPacketLen = PACKET_LENGTH(uPacketLen);
			pSocketData += sizeof(unsigned int);
			uLeftLen -= sizeof(unsigned int);

			while(uLeftLen >= uPacketLen - sizeof(unsigned int))
			{
				//////////////////////////////////////////////////////////////////////////
				CHECK_CAPACITY(uPacketLen - sizeof(unsigned int));
				//////////////////////////////////////////////////////////////////////////
				m_xBuffer.Write(pSocketData, uPacketLen - sizeof(unsigned int));
				pSocketData += (uPacketLen - sizeof(unsigned int));
				uLeftLen -= (uPacketLen - sizeof(unsigned int));
				//	һ�����ݰ���������
				if(m_pHandler)
				{
					m_pHandler((const void*)m_xBuffer.GetBuffer(),
						m_xBuffer.GetLength());
				}
				m_xBuffer.Reset();

				//	next one
				if(uLeftLen >= sizeof(unsigned int))
				{
					uPacketLen = *(unsigned int*)pSocketData;
					pSocketData += sizeof(unsigned int);
					uLeftLen -= sizeof(unsigned int);
					m_xBuffer << uPacketLen;
					//	uPacketLen��������� ת��Ϊ���������
					uPacketLen = PACKET_LENGTH(uPacketLen);
				}
				else
				{
					//	���ݲ���
					//////////////////////////////////////////////////////////////////////////
					CHECK_CAPACITY(uLeftLen);
					//////////////////////////////////////////////////////////////////////////
					m_xBuffer.Write(pSocketData, uLeftLen);
					return;
				}
			}

			if(uLeftLen > 0)
			{
				//////////////////////////////////////////////////////////////////////////
				CHECK_CAPACITY(uLeftLen);
				//////////////////////////////////////////////////////////////////////////
				m_xBuffer.Write(pSocketData, uLeftLen);
			}
		}
	}
	else
	{
		//	�������ݲ�Ϊ�� �ж��ܷ��ȡ����
		unsigned int uPacketLen = 0;
		const char* pSocketData = (const char*)_pData;
		unsigned int uLeftLen = _len;

		if(m_xBuffer.GetLength() >= sizeof(unsigned int))
		{
			uPacketLen = *(unsigned int*)m_xBuffer.GetBuffer();
			//	uPacketLen��������� ת��Ϊ���������
			uPacketLen = PACKET_LENGTH(uPacketLen);
		}
		else if(m_xBuffer.GetLength() + _len >= sizeof(unsigned int))
		{
			//	���泤��+���� ���Զ�������
			unsigned int uReadLen = sizeof(unsigned int) - m_xBuffer.GetLength();
			//////////////////////////////////////////////////////////////////////////
			CHECK_CAPACITY(uReadLen);
			//////////////////////////////////////////////////////////////////////////
			m_xBuffer.Write(pSocketData, uReadLen);
			pSocketData += uReadLen;
			uLeftLen -= uReadLen;
			uPacketLen = *(unsigned int*)m_xBuffer.GetBuffer();
			//	uPacketLen��������� ת��Ϊ���������
			uPacketLen = PACKET_LENGTH(uPacketLen);
		}
		else
		{
			//	�޷��������ݳ��� д������
			//////////////////////////////////////////////////////////////////////////
			CHECK_CAPACITY(_len);
			//////////////////////////////////////////////////////////////////////////
			m_xBuffer.Write(_pData, _len);
			return;
		}

		//	�����и�������
		unsigned int uInBufferLen = 0;
		uInBufferLen = m_xBuffer.GetLength() - sizeof(unsigned int);

		//	��ʼ����
		while(uLeftLen + uInBufferLen >= uPacketLen - sizeof(unsigned int))
		{
			/*m_xBuffer.Write(pSocketData, uPacketLen - sizeof(unsigned int));
			pSocketData += (uPacketLen - sizeof(unsigned int));
			uLeftLen -= (uPacketLen - sizeof(unsigned int));*/
			//////////////////////////////////////////////////////////////////////////
			CHECK_CAPACITY(uPacketLen - sizeof(unsigned int) - uInBufferLen);
			//////////////////////////////////////////////////////////////////////////
			m_xBuffer.Write(pSocketData, uPacketLen - sizeof(unsigned int) - uInBufferLen);
			pSocketData += (uPacketLen - sizeof(unsigned int) - uInBufferLen);
			uLeftLen -= (uPacketLen - sizeof(unsigned int) - uInBufferLen);

			//	һ�����ݰ���������
			if(m_pHandler)
			{
				m_pHandler((const void*)m_xBuffer.GetBuffer(),
					m_xBuffer.GetLength());
			}
			m_xBuffer.Reset();
			uInBufferLen = 0;

			//	next one
			if(uLeftLen >= sizeof(unsigned int))
			{
				uPacketLen = *(unsigned int*)pSocketData;
				pSocketData += sizeof(unsigned int);
				uLeftLen -= sizeof(unsigned int);
				m_xBuffer << uPacketLen;
				//	uPacketLen��������� ת��Ϊ���������
				uPacketLen = PACKET_LENGTH(uPacketLen);
			}
			else
			{
				//	���ݲ���
				//////////////////////////////////////////////////////////////////////////
				CHECK_CAPACITY(uLeftLen);
				//////////////////////////////////////////////////////////////////////////
				m_xBuffer.Write(pSocketData, uLeftLen);
				return;
			}
		}

		if(uLeftLen > 0)
		{
			//////////////////////////////////////////////////////////////////////////
			CHECK_CAPACITY(uLeftLen);
			//////////////////////////////////////////////////////////////////////////
			m_xBuffer.Write(pSocketData, uLeftLen);
		}
	}
}

/************************************************************************/
/* HandlePacket SetHandlePacket(HandlePacket _proc)
/* Param:	 _proc the pointer to the specific function
/* Return:	 the old function pointer
/************************************************************************/
HandlePacket DataParser::SetHandlePacket(HandlePacket _proc)
{
	HandlePacket pOldProc = m_pHandler;
	m_pHandler = _proc;
	return pOldProc;
}