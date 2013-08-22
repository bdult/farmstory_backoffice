package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
public class ContentsDao extends SqlSessionDaoSupport {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("contentsQuery.list");
	}
	public List<Map> listByGroupId(String seriseId) {
		return (List<Map>)getSqlSession().selectList("contentsQuery.listByGroupId", seriseId);
	}

	public void create(Map<String, Object> contentsInfo) {
		getSqlSession().insert("contentsQuery.create", contentsInfo);
		
	}
	public void deleteByGroupId(String groupId) {
		getSqlSession().delete("contentsQuery.deleteByGroupId", groupId);
	}
	public Map detail(String itemId) {
		return (Map)getSqlSession().selectOne("contentsQuery.detail", itemId);
	}
	public void delete(String itemId) {
		getSqlSession().delete("contentsQuery.delete", itemId);
	}
	public void modify(Map itemModInfo) {
		getSqlSession().update("contentsQuery.modify", itemModInfo);
		
	}
	
}
