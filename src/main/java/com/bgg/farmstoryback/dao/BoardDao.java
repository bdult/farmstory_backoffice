package com.bgg.farmstoryback.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDao extends SqlSessionDaoSupport {

	private Logger logger = LoggerFactory.getLogger(getClass());

	public void create(Map boardInfo) {
		getSqlSession().insert("boardQuery.create", boardInfo);
	}

	public Map detail(Map boardInfo) {
		return (Map)getSqlSession().selectOne("boardQuery.detail", boardInfo);
	}

	public void deleteByName(String boardName) {
		getSqlSession().update("boardQuery.deleteByName", boardName);
	}

	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("boardQuery.list");
	}

	public Map boardInfoByName(String boardName) {
		return (Map)getSqlSession().selectOne("boardQuery.boardInfoByName", boardName);
	}

	public void delete(Map boardInfo) {
		getSqlSession().delete("boardQuery.delete", boardInfo);
		
	}
}
