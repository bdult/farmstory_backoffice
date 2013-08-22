package com.bgg.farmstoryback.dao;


import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDao extends SqlSessionDaoSupport {

	private Logger logger = LoggerFactory.getLogger(getClass());
}
