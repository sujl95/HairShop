package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

public interface IProcService {

	public List<HashMap<String, String>> getProcList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getProcMCate() throws Throwable;

	public List<HashMap<String, String>> getProcSCate(HashMap<String, String> params) throws Throwable;

}
