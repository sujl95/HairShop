package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ICDao {

	List<HashMap<String, String>> getCustomerlist(HashMap<String, String> params) throws Throwable;

	int getcustomerCnt(HashMap<String, String> params) throws Throwable;

	void deleteCus(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getcList(HashMap<String, String> params) throws Throwable;

}
