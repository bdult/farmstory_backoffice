package com.bgg.farmstoryback.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


import java.util.HashMap;
import java.util.Map;


@Repository
@SuppressWarnings("unchecked")
public class UserDao extends SqlSessionDaoSupport {

	
	public List<HashMap<String, String>> memberList() {
		return (List<HashMap<String, String>>)getSqlSession().selectList( "userQuery.memberList");
	}

	/** 아이디와 비밀번호로 유저정보(id, pwd, role)가져오기
	 * @param oneRoleMap
	 * @return
	 */
	public Map<String, String> getOneRole(Map<String, Object> oneRoleMap){
		return (Map<String, String>)getSqlSession().selectOne("userQuery.getOneRole", oneRoleMap);
	}

	/**
	 * 리스트 하나보기
	 * @param userListMap
	 * @return
	 */
	public Map<String, String> getUserOne(Map<String, Object> userListMap){
		return (Map<String, String>)getSqlSession().selectOne("userQuery.getUserOne", userListMap);
	}
	
	public Map<String, Object> getChildOne(Map<String, Object> childListMap){
		return (Map<String, Object>)getSqlSession().selectOne("userQuery.getChildOne", childListMap);
	}
	
	/**
	 * 리스트 전체보기
	 * @return
	 */
	public List<HashMap<String, String>> userList() {
		return (List<HashMap<String, String>>)getSqlSession().selectList("userQuery.userList");
	}
	
	public List<HashMap<String, Object>> childList(Map<String, Object> childListMap) {
		return (List<HashMap<String, Object>>)getSqlSession().selectList("userQuery.childList", childListMap);
	}
	
	/**유저리스트 검색
	 * @param userListMap
	 * @return
	 */
	public List<HashMap<String, Object>> userSearch(Map<String, Object> userListMap) {
		return (List<HashMap<String, Object>>)getSqlSession().selectList("userQuery.userSearch", userListMap);
	}
	
	/**
	 * 유저리스트 생성
	 * @param userListMap
	 * @return
	 */
	public int insertUser(Map<String, String> userListMap){
		return getSqlSession().insert("userQuery.insertUser",userListMap);
	}
	
	public int insertChild(Map<String, Object> childListMap){
		return getSqlSession().insert("userQuery.insertChild", childListMap);
	}
	
	
	/**
	 * 유저리스트 수정
	 * @param userListMap
	 * @return
	 */
	public int updateUser(Map<String, String> userListMap){
		return getSqlSession().update("userQuery.updateUser", userListMap);
	}
	
	public int updateChild(Map<String, Object> childListMap){
		return getSqlSession().update("userQuery.updateChild", childListMap);
	}
	
	/**
	 * 유저리스트 삭제
	 * @param userListMap
	 * @return
	 */
	public int deleteUser(Map<String, String> userListMap){
		return getSqlSession().delete("userQuery.deleteUser", userListMap);
	}
	
	public int deleteChild(Map<String, Object> childListMap){
		return getSqlSession().delete("userQuery.deleteChild", childListMap);
	}
	
}
