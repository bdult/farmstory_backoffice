package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDao extends SqlSessionDaoSupport {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> categoryList() {
		return (List<Map<String, Object>>)getSqlSession().selectList("categoryQuery.categoryList");
	}
}
