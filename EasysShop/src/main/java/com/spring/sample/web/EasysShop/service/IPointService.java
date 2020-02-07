package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

public interface IPointService {

	public List<HashMap<String, String>> getPointList(HashMap<String, String> params) throws Throwable;

}
