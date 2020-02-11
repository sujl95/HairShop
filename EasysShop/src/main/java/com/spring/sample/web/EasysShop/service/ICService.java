package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

public interface ICService {

	List<HashMap<String, String>> getCustomerlist(HashMap<String, String> params) throws Throwable;

	int getcustomerCnt(HashMap<String, String> params) throws Throwable;

	void deleteCus(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getcList(HashMap<String, String> params) throws Throwable;

}
