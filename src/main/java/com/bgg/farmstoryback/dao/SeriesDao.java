package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class SeriesDao extends SqlSessionDaoSupport {

	
	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("seriesQuery.list");
	}

	public List<Map> listByBrandId(String brandId) {
		return (List<Map>)getSqlSession().selectList("seriesQuery.listByBrandId", brandId);
	}

	public void create(Map parameterMap) {
		getSqlSession().insert("seriesQuery.create", parameterMap);
	}

	public List<Map> listByCateId(String cateId) {
		return (List<Map>)getSqlSession().selectList("seriesQuery.listByCateId", cateId);
	}

	public void modify(Map seriseInfo) {
		getSqlSession().update("seriesQuery.modify", seriseInfo);
	}

	public Map detail(int seriseIdx) {
		return (Map)getSqlSession().selectOne("seriesQuery.detail", seriseIdx);
	}

	public void delete(Map seriseInfo) {
		getSqlSession().delete("seriesQuery.delete", seriseInfo);
	}
	
}
