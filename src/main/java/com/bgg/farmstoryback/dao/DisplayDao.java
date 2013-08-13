package com.bgg.farmstoryback.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
public class DisplayDao extends SqlSessionDaoSupport {
	
	private Logger _logger = LoggerFactory.getLogger(getClass());
	
	public void create(Map displayInfo) {
		getSqlSession().insert("displayQuery.create", displayInfo);
	}

	public Map detail(String displayId) {
		return (Map)getSqlSession().selectOne("displayQuery.detail", displayId);
	}

	public String displayIdByName(String displayNm) {
		return (String)getSqlSession().selectOne("displayQuery.displayIdByName", displayNm);
	}

	
}
