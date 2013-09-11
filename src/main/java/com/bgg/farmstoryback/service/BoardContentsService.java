package com.bgg.farmstoryback.service;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.BoardContentsDao;


@Service
public class BoardContentsService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	BoardContentsDao boardContentsDao;
	
	public int create(Map boardInfo) {
		return boardContentsDao.create(boardInfo);
	}

	public Map detail(Map boardInfo) {
		return boardContentsDao.detail(boardInfo);
	}

	public List<Map> list(Map pageInfo) {
		return boardContentsDao.list(pageInfo);
	}
	
	public int delete(Map boardInfo) {
		return boardContentsDao.delete(boardInfo);
	}

	public int modify(Map boardInfo) {
		return boardContentsDao.modify(boardInfo);
	}

	public int totalCount(Map parameter) {
		return boardContentsDao.totalCount(parameter);
	}

}
