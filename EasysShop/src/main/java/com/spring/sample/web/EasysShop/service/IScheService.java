package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

public interface IScheService {

	List<HashMap<String, String>> getreslist(HashMap<String, String> params) throws Throwable ;

	void reserinsertData(HashMap<String, String> params) throws Throwable ;

	List<HashMap<String, String>> getschelist(HashMap<String, String> params) throws Throwable ;

	void scheinsertData(HashMap<String, String> params) throws Throwable;

	int getscheduleCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getscheduleList(HashMap<String, String> params) throws Throwable;

	int getreservationCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getreservationList(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getresdata(HashMap<String, String> params) throws Throwable;

	void resupdateData(HashMap<String, String> params) throws Throwable;

	void resdeleteData(HashMap<String, String> params) throws Throwable;

}
