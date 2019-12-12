package com.spring.sample.web.EasysShop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EDao implements IEDao {
	@Autowired
	public SqlSession sqlSession;
}
