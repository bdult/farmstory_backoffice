package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bgg.farmstoryback.dto.UserDto;


@Repository
public class SeriseDao extends SqlSessionDaoSupport {

	
	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("seriseQuery.list");
	}

	public List<Map> listByBrandId(String cateId) {
		return (List<Map>)getSqlSession().selectList("seriseQuery.listByBrandId", cateId);
	}

	public void create(Map parameterMap) {
		getSqlSession().insert("seriseQuery.create", parameterMap);
	}
	
}
