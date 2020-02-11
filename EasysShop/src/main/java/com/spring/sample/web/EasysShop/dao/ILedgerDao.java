package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

public interface ILedgerDao {

	public List<HashMap<String, String>> ledgerList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> warehousingList(HashMap<String, String> params) throws Throwable;

	public int warehousingListCnt(HashMap<String, String> params) throws Throwable;

	public void warehousingDel(HashMap<String, String> params) throws Throwable;

}
