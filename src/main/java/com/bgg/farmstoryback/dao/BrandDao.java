package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class BrandDao extends SqlSessionDaoSupport {

	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("brandQuery.list");
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
}
