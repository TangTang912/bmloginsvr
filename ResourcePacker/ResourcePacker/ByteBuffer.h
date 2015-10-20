#ifndef _INC_BYTEBUFFER_
#define _INC_BYTEBUFFER_
/*
 *	ByteBuffer
 *	�������л��������ݣ�����stl
 */
//////////////////////////////////////////////////////////////////////////
#include <exception>
#include <string>
#include <vector>
#include <list>
#include <map>
#include <assert.h>
//////////////////////////////////////////////////////////////////////////
//	Ĭ�ϻ��泤��
#define MAX_BUFFER_SIZE						(8*1024)	//8K
#define PREFIX
//	�Ƿ����쳣
#define BUFFER_EXCEPTION

#ifdef BUFFER_EXCEPTION

#define READ_EXCEPTION(TYPE)				throw std::exception("No more buffer while reading ["#TYPE"] to buffer")
#define WRITE_EXCEPTION(TYPE)				throw std::exception("No more buffer while writing ["#TYPE"] to buffer")

#define BUFFER_EXCEPTION_CATCH				catch(std::exception& e)\
											{\
												::MessageBox(NULL, e.what(), "exception", MB_OK | MB_ICONERROR | MB_TASKMODAL);\
											};
#define BUFFER_EXCEPTION_CATCH_RETURN(r)	catch(std::exception& e)\
											{\
												::MessageBox(NULL, e.what(), "exception", MB_OK | MB_ICONERROR | MB_TASKMODAL);\
												return r;\
											};
#define BUFFER_EXCEPTION_CATCH_RETURN_VOID	catch(std::exception& e)\
											{\
											::MessageBox(NULL, e.what(), "exception", MB_OK | MB_ICONERROR | MB_TASKMODAL);\
											return;\
											};
#define BUFFER_EXCEPTION_CATCH_ASSERT(expr)	catch(std::exception& e)\
											{\
												::MessageBox(NULL, e.what(), "exception", MB_OK | MB_ICONERROR | MB_TASKMODAL);\
												assert(expr);\
											};

#else

#define READ_EXCEPTION
#define WRITE_EXCEPTION

#define BUFFER_EXCEPTION_CATCH
#define BUFFER_EXCEPTION_CATCH_RETURN(r)
#define BUFFER_EXCEPTION_CATCH_ASSERT(expr)

#endif

#define SET_FLAG(_VAR_, _MASK_)				((_VAR_) |= _MASK_)
#define RESET_FLAG(_VAR_, _MASK_)			((_VAR_) &= (~_MASK_))
#define TEST_FLAG(_VAR_, _MASK_)			((_VAR_) & _MASK_)
#define TEST_FLAG_BOOL(_VAR_, _MASK_)		(((_VAR_) & _MASK_) != 0 ? true : false)


//////////////////////////////////////////////////////////////////////////
class ByteBuffer
{
public:
	explicit ByteBuffer(unsigned int _uSize = MAX_BUFFER_SIZE)
	{
		Reset();
		m_uMaxBufferSize = _uSize;
		m_szBuffer = new unsigned char[m_uMaxBufferSize];
	}
	explicit ByteBuffer(const void* _pData, unsigned int _nLen)
	{
		Reset();
		m_uMaxBufferSize = _nLen;
		m_szBuffer = new unsigned char[m_uMaxBufferSize];
		Write(_pData, _nLen);
	}
	virtual ~ByteBuffer()
	{
		delete[] m_szBuffer;
	}

public:
	//	д�� �ı�����ָ��
	unsigned int Write(const void* _pData, unsigned int _nLen);
	//	��ȡ �ı��ȡָ��
	unsigned int Read(void* _pData, unsigned int _nLen);
	//	��ȡ�ɶ�ȡ���ݳ���
	inline unsigned int GetLength() const
	{
		return m_uDestPointer - m_uCurPointer;
	}
	//	��������ָ�����ȡָ��
	inline void Reset()
	{
		m_uDestPointer = m_uCurPointer = 0;
	}
	//	��ȡ��ȡָ�봦����
	inline unsigned char* GetHead() const
	{
		return m_szBuffer + m_uCurPointer;
	}
	//	�ڵ�ǰ��ȡָ�봦����ƫ��
	inline unsigned int SetHeadOffset(unsigned int _uOft)
	{
		if(m_uCurPointer + _uOft > m_uDestPointer)
		{
			return 0;
		}
		m_uCurPointer += _uOft;
		return _uOft;
	}
	inline const unsigned char* GetBuffer() const
	{
		return m_szBuffer;
	}
	//	��ȡʣ���д�뻺�泤��
	inline unsigned int GetAvailableLength() const
	{
		return m_uMaxBufferSize - m_uDestPointer;
	}
	//	�Ƿ�Ϊ��
	inline bool IsEmpty() const
	{
		return m_uDestPointer == 0;
	}
	//	ʮ�������ַ������
	std::string ToHexString();
	//	��� ��0
	inline void Clear()
	{
		Reset();
		memset(m_szBuffer, 0, m_uMaxBufferSize);
	}

protected:
	ByteBuffer& operator=(const ByteBuffer& _xBuf);
	ByteBuffer(const ByteBuffer& _xBuf);

protected:
	//unsigned char m_szBuffer[MAX_BUFFER_SIZE];
	unsigned char* m_szBuffer;
	unsigned int m_uDestPointer;
	unsigned int m_uCurPointer;
	unsigned int m_uMaxBufferSize;
};

/************************************************************************/
/* �������� ��ȡʧ�� ��std::exception�쳣
/************************************************************************/
//	char unsigned char
PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, char& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, char _var);

PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, unsigned char& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, unsigned char _var);

//	short unsigned short
PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, short& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, short _var);

PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, unsigned short& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, unsigned short _var);

//	int unsigned int
PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, int& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, int _var);

PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, unsigned int& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, unsigned int _var);

//	long unsigned long
PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, long& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, long _var);

PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, unsigned long& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, unsigned long _var);

//	float double
PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, float& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, float _var);

PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, double& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, double _var);

//	bool
PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, bool& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, bool _var);

//	char*
PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, char* _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, const char* _var);

/************************************************************************/
/* STL���л�
/************************************************************************/
//	std::string
PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, std::string& _var);
PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, const std::string& _var);

//	vector
template<typename T>
inline PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, std::vector<T>& _var)
{
	size_t uSize = 0;
	_xBuffer >> uSize;

	if(uSize != 0)
	{
		T value;
		_var.clear();
		_var.resize(uSize);
		for(size_t i = 0; i < uSize; ++i)
		{
			_xBuffer >> value;
			//_var.push_back(value);
			_var[i] = value;
		}
	}
	return _xBuffer;
}
template<typename T>
inline PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, const std::vector<T>& _var)
{
	size_t uSize = _var.size();
	_xBuffer << uSize;
	if(uSize != 0)
	{
		for(std::vector<T>::const_iterator iter = _var.begin();
			iter != _var.end();
			++iter)
		{
			_xBuffer << *iter;
		}
	}
	return _xBuffer;
}


//	list
template<typename T>
inline PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, std::list<T>& _var)
{
	size_t uSize = 0;
	_xBuffer >> uSize;

	if(uSize != 0)
	{
		T value;
		for(size_t i = 0; i < uSize; ++i)
		{
			_xBuffer >> value;
			_var.push_back(value);
		}
	}
	return _xBuffer;
}
template<typename T>
inline PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, const std::list<T>& _var)
{
	size_t uSize = _var.size();
	_xBuffer << uSize;
	if(uSize != 0)
	{
		for(std::list<T>::const_iterator iter = _var.begin();
			iter != _var.end();
			++iter)
		{
			_xBuffer << *iter;
		}
	}
	return _xBuffer;
}

//	pair
template<typename KEY, typename VALUE>
inline PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, std::pair<KEY, VALUE>& _var)
{
	_xBuffer >> _var.first
		>> _var.second;
	return _xBuffer;
}
template<typename KEY, typename VALUE>
inline PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, const std::pair<KEY, VALUE>& _var)
{
	_xBuffer << _var.first
		<< _var.second;
	return _xBuffer;
}

//	map
template<typename KEY, typename VALUE>
inline PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, std::map<KEY, VALUE>& _var)
{
	size_t uSize = 0;
	_xBuffer >> uSize;

	if(uSize != 0)
	{
		std::pair<KEY, VALUE> pair;
		for(size_t i = 0; i < uSize; ++i)
		{
			_xBuffer >> pair;
			_var.insert(_var.end(), pair);
		}
	}
	return _xBuffer;
}
template<typename KEY, typename VALUE>
inline PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, const std::map<KEY, VALUE>& _var)
{
	size_t uSize = _var.size();
	_xBuffer << uSize;
	if(uSize != 0)
	{
		for(std::map<KEY, VALUE>::const_iterator iter = _var.begin();
			iter != _var.end();
			++iter)
		{
			_xBuffer << *iter;
		}
	}
	return _xBuffer;
}













/************************************************************************/
/* ������
/************************************************************************/
//	Extend macro
#define BYTEBUFFER_STRUCT_OPERATOR(type)\
	PREFIX ByteBuffer& operator>>(ByteBuffer& _xBuffer, type& _var);\
	PREFIX ByteBuffer& operator<<(ByteBuffer& _xBuffer, const type& _var);

#define BYTEBUFFER_STRUCT_READ(type)\
	ByteBuffer& operator>>(ByteBuffer& _xBuffer, type& _var)

#define BYTEBUFFER_STRUCT_WRITE(type)\
	ByteBuffer& operator<<(ByteBuffer& _xBuffer, const type& _var)

//////////////////////////////////////////////////////////////////////////
#endif