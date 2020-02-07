package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

public interface ILedgerDao {

	List<HashMap<String, String>> ledgerList(HashMap<String, String> params) throws Throwable;

}
