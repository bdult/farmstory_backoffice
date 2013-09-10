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
	public Map<String, Object> getOneRole(Map<String, Object> oneRoleMap){
		return (Map<String, Object>)getSqlSession().selectOne("userQuery.getOneRole", oneRoleMap);
	}

	/**
	 * member_type 체크 (1:admin, 2:user)
	 * @param userListMap
	 * @return
	 */
	public Map<String, Object> typeCheck(Map<String, Object> userListMap){
		return (Map<String, Object>)getSqlSession().selectOne("userQuery.typeCheck", userListMap);
	}
	
	/**
	 * 리스트 하나보기
	 * @param userListMap
	 * @return
	 */
	public Map<String, Object> getUserOne(Map<String, Object> userListMap){
		return (Map<String, Object>)getSqlSession().selectOne("userQuery.getUserOne", userListMap);
	}
	
	/**
	 * 자녀 리스트 하나 보기
	 * @param childListMap
	 * @return
	 */
	public Map<String, Object> getChildOne(Map<String, Object> childListMap){
		return (Map<String, Object>)getSqlSession().selectOne("userQuery.getChildOne", childListMap);
	}
	
	public int getAdminTotalCount(Map<String, Object> paramMap){
		return (Integer)getSqlSession().selectOne("userQuery.adminTotalCount", paramMap);
	}
	
	/**
	 * 유저리스트 보기
	 * @return
	 */
	public List<HashMap<String, Object>> userList() {
		return (List<HashMap<String, Object>>)getSqlSession().selectList("userQuery.userList");
	}
	
	/**
	 * admin 유저 리스트 보기
	 * @return
	 */
	public List<HashMap<String, Object>> adminUserList() {
		return (List<HashMap<String, Object>>)getSqlSession().selectList("userQuery.adminUserList");
	}
	
	/**
	 * 자녀리스트 보기
	 * @param childListMap
	 * @return
	 */
	public List<HashMap<String, Object>> childList(String childListMap) {
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
	public void insertUser(Map<String, Object> userListMap){
		getSqlSession().insert("userQuery.insertUser",userListMap);
	}
	
	/**
	 * 자녀리스트 생성
	 * @param childListMap
	 * @return
	 */
	public void insertChild(Map<String, Object> childListMap){
		getSqlSession().insert("userQuery.insertChild", childListMap);
	}
	
	
	/**
	 * 유저리스트 수정
	 * @param userListMap
	 * @return
	 */
	public void updateUser(Map<String, Object> userListMap){
		getSqlSession().update("userQuery.updateUser", userListMap);
	}
	
	/**
	 * 자녀리스트 수정
	 * @param childListMap
	 * @return
	 */
	public void updateChild(Map<String, Object> childListMap){
		getSqlSession().update("userQuery.updateChild", childListMap);
	}
	
	/**
	 * 유저리스트 삭제
	 * @param userListMap
	 * @return
	 */
	public void deleteUser(String userListMap){
		getSqlSession().delete("userQuery.deleteUser", userListMap);
	}
	
	/**
	 * 자녀리스트 삭제
	 * @param childListMap
	 * @return
	 */
	public void deleteChild(String childListMap){
		getSqlSession().delete("userQuery.deleteChild", childListMap);
	}
	
}
