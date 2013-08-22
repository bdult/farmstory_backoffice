package com.bgg.farmstoryback.service;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.BoardDao;


@Service
public class BoardService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	BoardDao boardDao;

	public void create(Map boardInfo) {
		boardDao.create(boardInfo);
	}

	public Map detail(Map boardInfo) {
		return boardDao.detail(boardInfo);
	}

	public void deleteByName(String boardName) {
		boardDao.deleteByName(boardName);
	}

	public List<Map> list() {
		return boardDao.list();
	}

	public Map boardInfoByName(String boardName) {
		return boardDao.boardInfoByName(boardName);
	}

	public void delete(Map boardInfo) {
		boardDao.delete(boardInfo);
	}
}
