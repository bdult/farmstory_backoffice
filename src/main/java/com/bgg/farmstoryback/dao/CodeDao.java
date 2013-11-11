package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDao extends SqlSessionDaoSupport {

	
	public List<Map> list(Map paramInfo) {
		return getSqlSession().selectList("codeQuery.list", paramInfo);
	}

	public List<Map> parentCodeList() {
		return getSqlSession().selectList("codeQuery.parentCodeList");
	}

	public List<Map> displayCodeList() {
		return getSqlSession().selectList("codeQuery.displayCodeList");
	}

	public List<Map> paymentCodeList() {
		return getSqlSession().selectList("codeQuery.paymentCodeList");
	}
	
	public List<Map> payProcessCodeList() {
		return getSqlSession().selectList("codeQuery.payProcessCodeList");
	}

	public List<Map> locationCodeList() {
		return getSqlSession().selectList("codeQuery.locationCodeList");
	}
	
	public List<Map> boardContentsCategoryList() {
		return getSqlSession().selectList("codeQuery.boardContentsCategoryList");
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

	public int hasCount(Map<String, String> parameter) {
		return (Integer)getSqlSession().selectOne("codeQuery.hasCount", parameter);
	}

	public void add(Map<String, String> parameter) {
		getSqlSession().insert("codeQuery.add", parameter);
	}



}
