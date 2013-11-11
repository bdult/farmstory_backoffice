package com.bgg.farmstoryback.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.PayDao;

@Service
public class PayService {
	
	@Autowired
	PayDao payDao;

	public List<Map> latestData() {
		return payDao.latestData();
	}

}
