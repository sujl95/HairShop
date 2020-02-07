package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

public interface IProductService {

	public List<HashMap<String, String>> getSellList(HashMap<String, String> params) throws Throwable;

}
