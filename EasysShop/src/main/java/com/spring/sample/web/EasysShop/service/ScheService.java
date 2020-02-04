package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.EasysShop.dao.IScheDao;


@Service
public class ScheService implements IScheService {
	@Autowired
	public IScheDao iScheDao;

	@Override
	public List<HashMap<String, String>> getreslist(HashMap<String, String> params) throws Throwable {
		return iScheDao.getreslist(params);
	}

	@Override
	public void reserinsertData(HashMap<String, String> params) throws Throwable {
		iScheDao.reserinsertData(params);
	}

	@Override
	public List<HashMap<String, String>> getschelist(HashMap<String, String> params) throws Throwable {
		return iScheDao.getschelist(params);
	}

	@Override
	public void scheinsertData(HashMap<String, String> params) throws Throwable {
		iScheDao.scheinsertData(params);
	}

	@Override
	public int getscheduleCnt(HashMap<String, String> params) throws Throwable {
		return iScheDao.getscheduleCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getscheduleList(HashMap<String, String> params) throws Throwable {
		return iScheDao.getscheduleList(params);
	}

	@Override
	public int getreservationCnt(HashMap<String, String> params) throws Throwable {
		return iScheDao.getreservationCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getreservationList(HashMap<String, String> params) throws Throwable {
		return iScheDao.getreservationList(params);
	}

	@Override
	public HashMap<String, String> getresdata(HashMap<String, String> params) throws Throwable {
		return iScheDao.getresdata(params);
	}

	@Override
	public void resupdateData(HashMap<String, String> params) throws Throwable {
		iScheDao.resupdateData(params);
	}

	@Override
	public void resdeleteData(HashMap<String, String> params) throws Throwable {
		iScheDao.resdeleteData(params);		
	}

	@Override
	public int getcalendarCnt(HashMap<String, String> params) throws Throwable {
		return iScheDao.getcalendarCnt(params);		
	}

	@Override
	public List<HashMap<String, String>> getcalendarList(HashMap<String, String> params) throws Throwable {
		return iScheDao.getcalendarList(params);		
	}

	@Override
	public HashMap<String, String> getcaldata(HashMap<String, String> params) throws Throwable {
		return iScheDao.getcaldata(params);	
	}

	@Override
	public void calupdateData(HashMap<String, String> params) throws Throwable {
		iScheDao.calupdateData(params);				
	}

	@Override
	public void caldeleteData(HashMap<String, String> params) throws Throwable {
		iScheDao.caldeleteData(params);				
	}
}
