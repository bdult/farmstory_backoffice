package com.bgg.farmstoryback.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class UserDao extends SqlSessionDaoSupport {

	/** 아이디로 유저정보를 조회
	 * 필요값 Map #id
	 * @param userDTO
	 * @return
	 */
	
	public Map<String, String> getUserOne(Map<String, String> userDTO){
		return (Map<String, String>)getSqlSession().selectOne("", userDTO);
	}
	
	public List<HashMap<String, String>> userList() {
		return (List<HashMap<String, String>>)getSqlSession().selectList("userQuery.userList");
	}
	
	public int insertUser(Map<String, String> userDTO){
		return getSqlSession().insert("userQuery.insertUser",userDTO);
	}
	
	public int updateUser(Map<String, String> UserDTO){
		return getSqlSession().update("userQuery.updateUser", UserDTO);
	}
	
	public int deleteUser(Map<String, String> UserDTO){
		return getSqlSession().delete("userQuery.deleteUser", UserDTO);
	}
}
