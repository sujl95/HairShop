package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

public interface IProcService {

	public List<HashMap<String, String>> getProcList(HashMap<String, String> params) throws Throwable;

}
