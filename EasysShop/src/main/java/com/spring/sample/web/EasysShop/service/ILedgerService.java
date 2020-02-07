package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

public interface ILedgerService {

	List<HashMap<String, String>> ledgerList(HashMap<String, String> params) throws Throwable;

}
