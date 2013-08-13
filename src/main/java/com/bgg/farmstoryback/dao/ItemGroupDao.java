package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class ItemGroupDao extends SqlSessionDaoSupport {

	
	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("itemGroupQuery.list");
	}

	public List<Map> listByBrandId(String brandId) {
		return (List<Map>)getSqlSession().selectList("itemGroupQuery.listByBrandId", brandId);
	}

	public void create(Map parameterMap) {
		getSqlSession().insert("itemGroupQuery.create", parameterMap);
	}

	public void modify(Map seriseInfo) {
		getSqlSession().update("itemGroupQuery.modify", seriseInfo);
	}

	public Map detail(String groupId) {
		return (Map)getSqlSession().selectOne("itemGroupQuery.detail", groupId);
	}

	public void delete(String groupId) {
		getSqlSession().delete("itemGroupQuery.delete", groupId);
	}
	
}
