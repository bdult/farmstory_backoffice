package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
public class PayDao extends SqlSessionDaoSupport {
	
	public List<Map> latestData() {
		return getSqlSession().selectList("payQuery.latestData");
	}
	
}
