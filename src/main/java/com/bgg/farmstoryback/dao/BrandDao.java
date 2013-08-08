package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class BrandDao extends SqlSessionDaoSupport {

	public List<Map> listByCateId(String cateId) {
		return (List<Map>)getSqlSession().selectList("brandQuery.listByCateId", cateId);
	}
	
	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("brandQuery.list");
	}

	public void create(Map parameterMap) {
		getSqlSession().insert("brandQuery.create", parameterMap);
	}
	
	public void createCateBrand(Map parameterMap) {
		getSqlSession().insert("brandQuery.createCateBrand", parameterMap);
	}
}
