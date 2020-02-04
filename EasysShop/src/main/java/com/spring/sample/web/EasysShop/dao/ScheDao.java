package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheDao implements IScheDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getreslist(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("reservation.getreslist",params);
	}

	@Override
	public void reserinsertData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("reservation.reserinsertData",params);
	}

	@Override
	public List<HashMap<String, String>> getschelist(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("reservation.getschelist",params);
	}

	@Override
	public void scheinsertData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("reservation.scheinsertData",params);
	}

	@Override
	public int getscheduleCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("reservation.getscheduleCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getscheduleList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("reservation.getscheduleList",params);
	}

	@Override
	public int getreservationCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("reservation.getreservationCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getreservationList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("reservation.getreservationList",params);
	}

	@Override
	public HashMap<String, String> getresdata(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("reservation.getresdata",params);
	}

	@Override
	public void resupdateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("reservation.resupdateData",params);
	}

	@Override
	public void resdeleteData(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("reservation.resdeleteData",params);
	}

	@Override
	public int getcalendarCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("reservation.getcalendarCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getcalendarList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("reservation.getcalendarList",params);
	}

	@Override
	public HashMap<String, String> getcaldata(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("reservation.getcaldata",params);
	}

	@Override
	public void calupdateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("reservation.calupdateData",params);		
	}

	@Override
	public void caldeleteData(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("reservation.caldeleteData",params);		
	}
}
