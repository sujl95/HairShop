package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EDao implements IEDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getreslist(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("reservation/getreslist",params);
	}
}
