package com.bgg.farmstoryback.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.dao.BoardDao;


@Service
public class BoardService {
	
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	private PageUtil pageUtil;
	
	public List<Map> boardList() {
		return boardList(null);
	}
	
	public List<Map> CsBoardList() {
		Map param = new HashMap();
		param.put(ConstantsForParam.BOARD_TYPE, "CS");
		return boardList(param);
	}
	
	public List<Map> top(int limitCount) {
		Map param = new HashMap();
		param.put(ConstantsForParam.PAGE_START_NO, "1");
		param.put(ConstantsForParam.PAGE_PER_PAGE, limitCount);
		return boardList(param);
	}
	

	public List<Map> contentsListByBoardId(Map requestParamMap) {
		return boardDao.contenstListByBoardId(requestParamMap);
	}

	public Map contentsDeail(Map requestParamMap) {
		return boardDao.contentsDetail(requestParamMap);
	}
	
	
	
	private List<Map> boardList(Map requestParam){
		return boardDao.boardList(requestParam);
	}

//	public void create(Map boardInfo) {
//		boardDao.create(boardInfo);
//	}
//
//	public Map detail(Map boardInfo) {
//		return boardDao.detail(boardInfo);
//	}
//
//	public void deleteByName(String boardName) {
//		boardDao.deleteByName(boardName);
//	}
//
//	
//	public List<Map> list(Map pageInfo) {
//		return boardDao.list(pageInfo);
//	}
//	
//	public Map boardInfoByName(String boardName) {
//		return boardDao.boardInfoByName(boardName);
//	}
//
//	public void delete(Map boardInfo) {
//		boardDao.delete(boardInfo);
//	}
//
//	public void modify(Map boardInfo) {
//		boardDao.modify(boardInfo);
//	}
//
//	public int totalCount(Map parameter) {
//		return boardDao.totalCount(parameter);
//	}


	

	

	
}
