package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
public class BrandDao extends SqlSessionDaoSupport {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	public List<Map> list(Map parameter) {
		return (List<Map>)getSqlSession().selectList("brandQuery.list", parameter);
	}
	
	public void create(Map parameterMap) {
		getSqlSession().insert("brandQuery.create", parameterMap);
	}
	
	public void modify(Map parameterMap) {
		getSqlSession().update("brandQuery.modify", parameterMap);
	}

	public Map detail(Map parameter) {
		return (Map)getSqlSession().selectOne("brandQuery.detail", parameter);
	}

	public void delete(Map brandInfo) {
		getSqlSession().update("brandQuery.delete", brandInfo);
	}

	public int totalCount(Map parameter) {
		return (Integer)getSqlSession().selectOne("brandQuery.totalCount", parameter);
	}

	public List top(int limitCount) {
		return getSqlSession().selectList("brandQuery.top", limitCount);
	}

	public List<Map> listAll() {
		return getSqlSession().selectList("brandQuery.listAll");
	}
}
