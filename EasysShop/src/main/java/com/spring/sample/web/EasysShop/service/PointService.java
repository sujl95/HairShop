package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.EasysShop.dao.IPointDao;


@Service
public class PointService implements IPointService {
	@Autowired
	public IPointDao iPointDao;

	@Override
	public List<HashMap<String, String>> getPointList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iPointDao.getPointList(params);
	}

}
