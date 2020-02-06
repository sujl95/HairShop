package com.spring.sample.web.EasysShop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.EasysShop.dao.IEDao;


@Service
public class EService implements IEService {
	@Autowired
	public IEDao iEDao;

	@Override
	public List<HashMap<String, String>> getcustgradeList(HashMap<String, String> params) throws Throwable {
		return iEDao.getcustgradeList(params);
	}

	@Override
	public HashMap<String, String> getcustgradedata(HashMap<String, String> params) throws Throwable {
		return iEDao.getcustgradedata(params);
	}

	@Override
	public void custcodeAdd(HashMap<String, String> params) throws Throwable {
		iEDao.custcodeAdd(params);
	}

	@Override
	public void custcodeUpdate(HashMap<String, String> params) throws Throwable {
		iEDao.custcodeUpdate(params);
	}

	@Override
	public void custgradedel(HashMap<String, String> params) throws Throwable {
		iEDao.custgradedel(params);
	}

	@Override
	public List<HashMap<String, String>> getempgradeList(HashMap<String, String> params) throws Throwable {
		return iEDao.getempgradeList(params);
	}

	@Override
	public HashMap<String, String> getempgradedata(HashMap<String, String> params) throws Throwable {
		return iEDao.getempgradedata(params);
	}

	@Override
	public void empcodeAdd(HashMap<String, String> params) throws Throwable {
		iEDao.empcodeAdd(params);
	}

	@Override
	public void empcodeUpdate(HashMap<String, String> params) throws Throwable {
		iEDao.empcodeUpdate(params);
	}

	@Override
	public void empgradedel(HashMap<String, String> params) throws Throwable {
		iEDao.empgradedel(params);
	}

	@Override
	public List<HashMap<String, String>> getcompcodeList(HashMap<String, String> params) throws Throwable {
		return iEDao.getcompcodeList(params);
	}

	@Override
	public HashMap<String, String> getcompdata(HashMap<String, String> params) throws Throwable {
		return iEDao.getcompdata(params);
	}

	@Override
	public void compcodeAdd(HashMap<String, String> params) throws Throwable {
		iEDao.compcodeAdd(params);
	}

	@Override
	public void compcodeUpdate(HashMap<String, String> params) throws Throwable {
		iEDao.compcodeUpdate(params);
	}

	@Override
	public void compdel(HashMap<String, String> params) throws Throwable {
		iEDao.compdel(params);
	}

}
