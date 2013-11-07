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
	private BoardDao boardDao;
	
	@Autowired
	private PageUtil pageUtil;
	
	@Autowired
	private CodeService codeService;
	
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
	
	public void modifyContents(Map requestParamMap) {
		boardDao.modifyContents(requestParamMap);
	}
	
	private List<Map> boardList(Map requestParam){
		return boardDao.boardList(requestParam);
	}

	public List<Map> commentList(Map requestParamMap) {
		return boardDao.commentList(requestParamMap);
	}

	public void addComment(Map requestParamMap) {
		boardDao.addComment(requestParamMap);
	}

	public Map commentDetail(Map requestParamMap) {
		return boardDao.commentDetail(requestParamMap);
	}

	public void modifyComment(Map requestParamMap) {
		boardDao.modifyComment(requestParamMap);
	}

	public void deleteComment(Map requestParamMap) {
		boardDao.deleteComment(requestParamMap);
	}

	public void addContents(Map requestParamMap) {
		boardDao.addContents(requestParamMap);
	}

	public void deleteContents(Map requestParamMap) {
		boardDao.deleteCommentByContentsId(requestParamMap);
		boardDao.deleteContents(requestParamMap);
	}

	public List<Map> categoryList() {
		return codeService.boardContentsCategoryList();
	}

	

//	public void createMaster(Map boardInfo) {
//		boardDao.create(boardInfo);
//	}
//
//	public Map detailBoard(Map boardInfo) {
//		return boardDao.detail(boardInfo);
//	}
//
//	public void deleteByNameMaster(String boardName) {
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
