package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDao extends SqlSessionDaoSupport {

	private Logger logger = LoggerFactory.getLogger(getClass());

	public List<Map> list(Map pageInfo) {
		return getSqlSession().selectList("codeQuery.list", pageInfo);
	}

	public int totalCount(Map pageInfo) {
		return (Integer)getSqlSession().selectOne("codeQuery.totalCount", pageInfo);
	}

	public Map detail(String code_idx) {
		return (Map)getSqlSession().selectOne("codeQuery.detail", code_idx);
	}

	public void delete(Map<String, Object> parameter) {
		getSqlSession().delete("codeQuery.deleteChild", parameter);
		getSqlSession().delete("codeQuery.delete", parameter	);
	}

	public void modify(Map<String, String> parameter) {
		getSqlSession().update("codeQuery.modify", parameter);
	}

}
