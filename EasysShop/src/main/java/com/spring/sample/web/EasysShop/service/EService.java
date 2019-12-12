package com.spring.sample.web.EasysShop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.sample.web.EasysShop.dao.IEDao;


@Service
public class EService implements IEService {
	@Autowired
	public IEDao iEDao;
}
