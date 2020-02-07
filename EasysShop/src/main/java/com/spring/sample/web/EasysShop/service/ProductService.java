package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.EasysShop.dao.IProductDao;


@Service
public class ProductService implements IProductService {
	@Autowired
	public IProductDao iProductDao;

	@Override
	public List<HashMap<String, String>> getSellList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iProductDao.getSellList(params);
	}


}
