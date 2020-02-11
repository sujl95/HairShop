package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LedgerDao implements ILedgerDao{
	
	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> ledgerList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("led.ledgerList",params);
	}

	@Override
	public List<HashMap<String, String>> warehousingList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("led.warehousingList",params);
	}

	@Override
	public int warehousingListCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("led.warehousingListCnt",params);
	}

	@Override
	public void warehousingDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.delete("led.warehousingDel",params);
	}

}
