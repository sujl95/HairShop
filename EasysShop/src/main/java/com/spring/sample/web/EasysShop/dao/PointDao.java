package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDao implements IPointDao{
	@Autowired
	public SqlSession sqlsession;

	@Override
	public List<HashMap<String, String>> getPointList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlsession.selectList("Point.getPointList", params);
	}
}
