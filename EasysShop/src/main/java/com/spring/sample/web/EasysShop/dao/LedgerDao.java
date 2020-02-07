package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LedgerDao implements ILedgerDao{

	public SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> ledgerList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("led.ledgerList",params);
	}

}
