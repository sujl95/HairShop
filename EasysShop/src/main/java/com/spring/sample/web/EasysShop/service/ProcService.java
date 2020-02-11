package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.EasysShop.dao.IProcDao;


@Service
public class ProcService implements IProcService {
	@Autowired
	public IProcDao iProcDao;

	@Override
	public List<HashMap<String, String>> getProcList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iProcDao.getProcList(params);
	}

	@Override
	public List<HashMap<String, String>> getProcMCate() throws Throwable {
		// TODO Auto-generated method stub
		return iProcDao.getProcMCate();
	}

	@Override
	public List<HashMap<String, String>> getProcSCate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iProcDao.getProcSCate(params);
	}

	@Override
	public List<HashMap<String, String>> getProcCodeList() throws Throwable {
		// TODO Auto-generated method stub
		return iProcDao.getProcCodeList();
	}

}
