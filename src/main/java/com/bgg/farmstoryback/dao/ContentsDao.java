package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bgg.farmstoryback.dto.UserDto;


@Repository
public class ContentsDao extends SqlSessionDaoSupport {

	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("contentsQuery.list");
	}
	public List<Map> listBySeriseId(String seriseId) {
		return (List<Map>)getSqlSession().selectList("contentsQuery.listBySeriseId", seriseId);
	}

	public void create(Map<String, Object> contentsInfo) {
		getSqlSession().insert("contentsQuery.create", contentsInfo);
		
	}
	
}
