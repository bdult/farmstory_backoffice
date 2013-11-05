package com.bgg.farmstoryback.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDao extends SqlSessionDaoSupport {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> boardList(Map requestParam) {
		return (List<Map>)getSqlSession().selectList("boardQuery.boardList", requestParam);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> contenstListByBoardId(Map requestParam) {
		return (List<Map>)getSqlSession().selectList("boardQuery.contentsListByBoardId", requestParam);
	}

	@SuppressWarnings({ "rawtypes" })
	public Map contentsDetail(Map requestParamMap) {
		return (Map)getSqlSession().selectOne("boardQuery.contentsDetail", requestParamMap);
	}
	
	@SuppressWarnings({ "rawtypes" })
	public void modifyContents(Map requestParamMap) {
		getSqlSession().update("boardQuery.modifyContents", requestParamMap);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> commentList(Map requestParamMap) {
		return getSqlSession().selectList("boardQuery.commentList", requestParamMap);
	}

	@SuppressWarnings({ "rawtypes" })
	public void addComment(Map requestParamMap) {
		getSqlSession().insert("boardQuery.addComment", requestParamMap);
	}

	@SuppressWarnings({ "rawtypes" })
	public Map commentDetail(Map requestParamMap) {
		return (Map)getSqlSession().selectOne("boardQuery.commentDetail", requestParamMap);
	}

	@SuppressWarnings({ "rawtypes" })
	public void modifyComment(Map requestParamMap) {
		getSqlSession().update("boardQuery.modifyComment", requestParamMap);
	}

	@SuppressWarnings({ "rawtypes" })
	public void deleteComment(Map requestParamMap) {
		getSqlSession().delete("boardQuery.deleteComment", requestParamMap);
	}

	public void addContents(Map requestParamMap) {
		getSqlSession().insert("boardQuery.addContents", requestParamMap);
	}

	public void deleteContents(Map requestParamMap) {
		getSqlSession().delete("boardQuery.deleteContents", requestParamMap);
	}

	public void deleteCommentByContentsId(Map requestParamMap) {
		getSqlSession().delete("boardQuery.deleteCommentByContentsId", requestParamMap);
	}

}
