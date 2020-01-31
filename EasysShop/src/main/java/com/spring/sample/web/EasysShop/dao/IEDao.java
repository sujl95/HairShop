package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface IEDao {

	List<HashMap<String, String>> getreslist(HashMap<String, String> params) throws Throwable ;

}
