package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

public interface IEService {
	
//	고객 등급 코드 리스트
	List<HashMap<String, String>> getcustgradeList(HashMap<String, String> params) throws Throwable;
	
//  고객 등급 코드 데이터
	HashMap<String, String> getcustgradedata(HashMap<String, String> params) throws Throwable;
	
//	고객 등급 등록
	void custcodeAdd(HashMap<String, String> params) throws Throwable;
	
//	고객 등급 수정
	void custcodeUpdate(HashMap<String, String> params) throws Throwable;
	
//	고객 등급 삭제
	void custgradedel(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getempgradeList(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getempgradedata(HashMap<String, String> params) throws Throwable;

	void empcodeAdd(HashMap<String, String> params) throws Throwable;

	void empcodeUpdate(HashMap<String, String> params) throws Throwable;

	void empgradedel(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getcompcodeList(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getcompdata(HashMap<String, String> params) throws Throwable;

	void compcodeAdd(HashMap<String, String> params) throws Throwable;

	void compcodeUpdate(HashMap<String, String> params) throws Throwable;

	void compdel(HashMap<String, String> params) throws Throwable;
	
	
}
