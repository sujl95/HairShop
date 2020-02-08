package com.spring.sample.web.EasysShop.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface IEDao {

	List<HashMap<String, String>> getcustgradeList(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getcustgradedata(HashMap<String, String> params) throws Throwable;

	void custcodeAdd(HashMap<String, String> params) throws Throwable;

	void custcodeUpdate(HashMap<String, String> params) throws Throwable;

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

	List<HashMap<String, String>> getitemcodeList(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getitemcodedata(HashMap<String, String> params) throws Throwable;

	void itemcodeAdd(HashMap<String, String> params) throws Throwable;

	void itemcodeUpdate(HashMap<String, String> params) throws Throwable;

	void itemcodedel(HashMap<String, String> params) throws Throwable;

}
