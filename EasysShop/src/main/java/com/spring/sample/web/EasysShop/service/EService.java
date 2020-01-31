package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.EasysShop.dao.IEDao;


@Service
public class EService implements IEService {
	@Autowired
	public IEDao iEDao;

	@Override
	public List<HashMap<String, String>> getreslist(HashMap<String, String> params) throws Throwable {
		return iEDao.getreslist(params);
	}
}
