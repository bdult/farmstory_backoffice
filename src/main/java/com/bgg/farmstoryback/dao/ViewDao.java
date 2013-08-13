package com.bgg.farmstoryback.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
@SuppressWarnings("unchecked")
public class ViewDao extends SqlSessionDaoSupport {
	
	public List<HashMap<String, String>> memberList() {
		return (List<HashMap<String, String>>)getSqlSession().selectList( "viewQuery.memberList");
	}

	public Map<String, String> getOneRole(Map<String, Object> oneRoleMap){
		return (Map<String, String>)getSqlSession().selectOne("viewQuery.getOneRole", oneRoleMap);
	}
	
}
