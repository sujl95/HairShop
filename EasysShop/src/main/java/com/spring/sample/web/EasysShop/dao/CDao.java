package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CDao implements ICDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getCustomerlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("customer.getCustomerlist", params);
	}

	@Override
	public int getcustomerCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.getcustomerCnt", params);
	}

	@Override
	public void deleteCus(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("customer.deleteCus", params);
	}

	@Override
	public List<HashMap<String, String>> getcList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("customer.getcList", params);
	}

}
