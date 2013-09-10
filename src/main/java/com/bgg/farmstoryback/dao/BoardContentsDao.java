package com.bgg.farmstoryback.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
public class BoardContentsDao extends SqlSessionDaoSupport {

	private Logger logger = LoggerFactory.getLogger(getClass());

	public int create(Map boardInfo) {
		return getSqlSession().insert("boardContentsQuery.create", boardInfo);
	}

	public Map detail(Map boardInfo) {
		return (Map)getSqlSession().selectOne("boardContentsQuery.detail", boardInfo);
	}

	public List<Map> list(Map pageInfo) {
		return (List<Map>)getSqlSession().selectList("boardContentsQuery.list", pageInfo);
	}

	public int delete(Map boardInfo) {
		return getSqlSession().delete("boardContentsQuery.delete", boardInfo);
	}

	public int modify(Map boardInfo) {
		return getSqlSession().update("boardContentsQuery.modify",boardInfo);
	}

	public int totalCount(Map parameter) {
		return (Integer)getSqlSession().selectOne("boardContentsQuery.totalCount", parameter);
	}

}
