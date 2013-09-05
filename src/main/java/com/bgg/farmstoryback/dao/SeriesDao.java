package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class SeriesDao extends SqlSessionDaoSupport {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("seriesQuery.list");
	}

	public Map detail(String series_id) {
		return (Map)getSqlSession().selectOne("seriesQuery.detail", series_id);
	}

	public void create(Map parameter) {
		getSqlSession().insert("seriesQuery.create", parameter);
	}

	public void modify(Map<String, String> parameter) {
		getSqlSession().update("seriesQuery.modify", parameter);
		
	}

	public void delete(Map parameter) {
		getSqlSession().delete("seriesQuery.delete", parameter);
		
	}

	public int hasCount(Map parameter) {
		return (Integer)getSqlSession().selectOne("seriesQuery.hasCount", parameter);
	}

	public int searchIdByName(Map parameter) {
		return (Integer)getSqlSession().selectOne("seriesQuery.searchIdByName", parameter);
	}

	public List<Map> searchByName(String seriesName) {
		return (List<Map>)getSqlSession().selectList("seriesQuery.searchByName", seriesName);
	}

	public List<Map> listOfTop() {
		return (List<Map>)getSqlSession().selectList("seriesQuery.listOfTop");
	}

	public List<Map> listOfChild(int parentSeriesId) {
		return (List<Map>)getSqlSession().selectList("seriesQuery.listOfChild", parentSeriesId);
	}
	
}
