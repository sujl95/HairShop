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

	@Override
	public List<HashMap<String, String>> getitemcodeList(HashMap<String, String> params) throws Throwable {
		return iEDao.getitemcodeList(params);
	}

	@Override
	public HashMap<String, String> getitemcodedata(HashMap<String, String> params) throws Throwable {
		return iEDao.getitemcodedata(params);
	}

	@Override
	public void itemcodeAdd(HashMap<String, String> params) throws Throwable {
		iEDao.itemcodeAdd(params);		
	}

	@Override
	public void itemcodeUpdate(HashMap<String, String> params) throws Throwable {
		iEDao.itemcodeUpdate(params);		
	}

	@Override
	public void itemcodedel(HashMap<String, String> params) throws Throwable {
		iEDao.itemcodedel(params);		
	}

	@Override
	public List<HashMap<String, String>> getitemcateList(HashMap<String, String> params) throws Throwable {
		return iEDao.getitemcateList(params);	
	}

	@Override
	public List<HashMap<String, String>> getitemScateList(HashMap<String, String> params) throws Throwable {
		return iEDao.getitemScateList(params);	
	}

	@Override
	public List<HashMap<String, String>> getitemtypeList(HashMap<String, String> params) throws Throwable {
		return iEDao.getitemtypeList(params);
	}

	@Override
	public void itemtypedel(HashMap<String, String> params) throws Throwable {
		iEDao.itemtypedel(params);
	}

	@Override
	public int itemtypeck(HashMap<String, String> params) throws Throwable {
		return iEDao.itemtypeck(params);
	}

	@Override
	public int itemnmtypeck(HashMap<String, String> params) throws Throwable {
		return iEDao.itemnmtypeck(params);
	}

	@Override
	public void itemtypeadd(HashMap<String, String> params) throws Throwable {
		iEDao.itemtypeadd(params);
	}

	@Override
	public HashMap<String, String> getitemtypedata(HashMap<String, String> params) throws Throwable {
		return iEDao.getitemtypedata(params);
	}

	@Override
	public void itemtypecodeUpdate(HashMap<String, String> params) throws Throwable {
		iEDao.itemtypecodeUpdate(params);
	}

}
