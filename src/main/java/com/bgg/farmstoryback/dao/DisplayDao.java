package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
public class DisplayDao extends SqlSessionDaoSupport {
	
	private Logger logger = LoggerFactory.getLogger(getClass());


	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> topDisplaylist() {
		return (List<Map>)getSqlSession().selectList("displayQuery.topDisplaylist");
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> bannerDisplaylist() {
		return (List<Map>)getSqlSession().selectList("displayQuery.bannerDisplaylist");
	}

	@SuppressWarnings({ "rawtypes"})
	public Map detail(Map requestParamMap) {
		return (Map)getSqlSession().selectOne("displayQuery.detail", requestParamMap);
	}

	public List<Map> popupList() {
		return (List<Map>)getSqlSession().selectList("displayQuery.popupList");
	}
	
}
