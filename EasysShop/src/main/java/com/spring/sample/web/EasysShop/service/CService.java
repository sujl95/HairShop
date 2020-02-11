package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.EasysShop.dao.ICDao;


@Service
public class CService implements ICService {
	@Autowired
	public ICDao iCDao;

	@Override
	public List<HashMap<String, String>> getCustomerlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCDao.getCustomerlist(params);
	}

	@Override
	public int getcustomerCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCDao.getcustomerCnt(params);
	}

	@Override
	public void deleteCus(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iCDao.deleteCus(params);
	}

	@Override
	public List<HashMap<String, String>> getcList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCDao.getcList(params);
	}

}
