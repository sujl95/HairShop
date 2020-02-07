package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface IProductDao {

	public List<HashMap<String, String>> getSellList(HashMap<String, String> params) throws Throwable;

}
