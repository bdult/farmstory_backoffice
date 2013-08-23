package com.bgg.farmstoryback.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.ContentsDao;

@Service
public class ContentsService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private ContentsDao conDao;
	
	public List<Map> list() {
		return conDao.list();
	}
}
