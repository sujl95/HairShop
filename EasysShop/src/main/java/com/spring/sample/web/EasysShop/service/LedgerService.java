package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.EasysShop.dao.ILedgerDao;

@Service
public class LedgerService implements ILedgerService{
	
	@Autowired
	public ILedgerDao iLedgerDao;
	
	@Override
	public List<HashMap<String, String>> ledgerList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLedgerDao.ledgerList(params);
	}

	@Override
	public List<HashMap<String, String>> warehousingList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLedgerDao.warehousingList(params);
	}

	@Override
	public int warehousingListCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLedgerDao.warehousingListCnt(params);
	}

	@Override
	public void warehousingDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLedgerDao.warehousingDel(params);
	}
	

}
