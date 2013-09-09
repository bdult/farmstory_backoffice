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
	
	public List<Map> list(Map parameter) {
		return (List<Map>)getSqlSession().selectList("contentsQuery.list", parameter);
	}

	public void create(Map parameter) {
		getSqlSession().insert("contentsQuery.create", parameter);
		
	}
	
	public Map detail(String contents_id) {
		return (Map)getSqlSession().selectOne("contentsQuery.detail", contents_id);
	}
	
	public void delete(String contents_id) {
		getSqlSession().delete("contentsQuery.delete", contents_id);
	}
	
	public void modify(Map itemModInfo) {
		getSqlSession().update("contentsQuery.modify", itemModInfo);
		
	}
	public int totalCount(Map parameter) {
		return (Integer)getSqlSession().selectOne("contentsQuery.totalCount", parameter);
	}

	public List top5() {
		return getSqlSession().selectList("contentsQuery.top5");
	}

}
