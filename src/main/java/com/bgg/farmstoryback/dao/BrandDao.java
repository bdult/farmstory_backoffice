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
	
	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("brandQuery.list");
	}
	
	public List<Map> listByPageNum(Map pageInfo) {
		return (List<Map>)getSqlSession().selectList("brandQuery.listByPageNum", pageInfo);
	}

	public void create(Map parameterMap) {
		getSqlSession().insert("brandQuery.create", parameterMap);
	}
	
	public void modify(Map parameterMap) {
		getSqlSession().update("brandQuery.modify", parameterMap);
	}

	public Map detail(String brandId) {
		return (Map)getSqlSession().selectOne("brandQuery.detail", brandId);
	}

	public void delete(Map brandInfo) {
		getSqlSession().update("brandQuery.delete", brandInfo);
	}

	public List<Map> search(String search) {
		return getSqlSession().selectList("brandQuery.search", search);
	}

	public int totalCount() {
		return (Integer)getSqlSession().selectOne("brandQuery.totalCount");
	}

	public List top5() {
		return getSqlSession().selectList("brandQuery.top5");
	}
}
