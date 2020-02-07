package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface IPointDao {

	public List<HashMap<String, String>> getPointList(HashMap<String, String> params) throws Throwable ;

}
