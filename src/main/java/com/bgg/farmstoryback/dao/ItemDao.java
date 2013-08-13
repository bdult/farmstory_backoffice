package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class ItemDao extends SqlSessionDaoSupport {

	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("itemQuery.list");
	}
	public List<Map> listByGroupId(String seriseId) {
		return (List<Map>)getSqlSession().selectList("itemQuery.listByGroupId", seriseId);
	}

	public void create(Map<String, Object> contentsInfo) {
		getSqlSession().insert("itemQuery.create", contentsInfo);
		
	}
	public void deleteByGroupId(String groupId) {
		getSqlSession().delete("itemQuery.deleteByGroupId", groupId);
	}
	public Map detail(String itemId) {
		return (Map)getSqlSession().selectOne("itemQuery.detail", itemId);
	}
	public void delete(String itemId) {
		getSqlSession().delete("itemQuery.delete", itemId);
	}
	public void modify(Map itemModInfo) {
		getSqlSession().update("itemQuery.modify", itemModInfo);
		
	}
	
}
