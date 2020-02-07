package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.sample.web.EasysShop.dao.ILedgerDao;

@Service
public class LedgerService implements ILedgerService{

	public ILedgerDao iLedgerDao;
	
	@Override
	public List<HashMap<String, String>> ledgerList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLedgerDao.ledgerList(params);
	}

}
