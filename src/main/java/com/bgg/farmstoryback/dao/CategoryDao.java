package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bgg.farmstoryback.dto.UserDto;


@Repository
public class CategoryDao extends SqlSessionDaoSupport {

	public List<Map<String, Object>> list() {
		return (List<Map<String, Object>>)getSqlSession().selectList("cateQuery.list");
	}

	public int connectionTest() {
		return (Integer)getSqlSession().selectOne("cateQuery.connCheck");
	}
}
