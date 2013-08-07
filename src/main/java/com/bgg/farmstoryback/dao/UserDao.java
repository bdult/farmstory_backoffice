package com.bgg.farmstoryback.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.bgg.farmstoryback.dto.UserDto;


@Repository
public class UserDao extends SqlSessionDaoSupport {

	public List<HashMap<String, String>> userList() {
		return (List<HashMap<String, String>>)getSqlSession().selectList("userQuery.userList");
	}
	
	public int insertUser(Map<String, String> userDTO){
		return getSqlSession().insert("userQuery.insertUser",userDTO);
	}
	
	public int updateUser(Map<String, String> userDTO){
		return getSqlSession().update("userQuery.updateUser", userDTO);
	}
	
	public int deleteUser(Map<String, String> userDTO){
		return getSqlSession().delete("userQuery.deleteUser", userDTO);
	}
}
