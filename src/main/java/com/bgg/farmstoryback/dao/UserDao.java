package com.bgg.farmstoryback.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
@SuppressWarnings("unchecked")
public class UserDao extends SqlSessionDaoSupport {


	/**
	 * 리스트 하나보기
	 * @param userListMap
	 * @return
	 */
	public Map<String, String> getUserOne(Map<String, Object> userListMap){
		return (Map<String, String>)getSqlSession().selectOne("userQuery.getUserOne", userListMap);
	}
	
	/**
	 * 리스트 전체보기
	 * @return
	 */
	public List<HashMap<String, String>> userList() {
		return (List<HashMap<String, String>>)getSqlSession().selectList("userQuery.userList");
	}
	
	/**
	 * 유저리스트 생성
	 * @param userListMap
	 * @return
	 */
	public int insertUser(Map<String, String> userListMap){
		return getSqlSession().insert("userQuery.insertUser",userListMap);
	}
	
	/**
	 * 유저리스트 수정
	 * @param userListMap
	 * @return
	 */
	public int updateUser(Map<String, String> userListMap){
		return getSqlSession().update("userQuery.updateUser", userListMap);
	}
	
	/**
	 * 유저리스트 삭제
	 * @param userListMap
	 * @return
	 */
	public int deleteUser(Map<String, String> userListMap){
		return getSqlSession().delete("userQuery.deleteUser", userListMap);
	}
}