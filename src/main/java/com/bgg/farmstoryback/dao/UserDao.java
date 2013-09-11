package com.bgg.farmstoryback.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


import java.util.HashMap;
import java.util.Map;


@Repository
@SuppressWarnings("unchecked")
public class UserDao extends SqlSessionDaoSupport {

	
//	public List<HashMap<String, String>> memberList() {
//		return (List<HashMap<String, String>>)getSqlSession().selectList( "userQuery.memberList");
//	}

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
	public Map<String, Object> detail(Map<String, Object> userListMap){
		return (Map<String, Object>)getSqlSession().selectOne("userQuery.detail", userListMap);
	}
	
	/**
	 * 회원 리스트
	 * @return
	 */
	public List<HashMap<String, Object>> userList(Map parameter) {
		return (List<HashMap<String, Object>>)getSqlSession().selectList("userQuery.userList", parameter);
	}
	
	/**
	 * 자녀리스트 보기
	 * @param childListMap
	 * @return
	 */
	public List<HashMap<String, Object>> childList(Map<String, Object> childListMap) {
		return (List<HashMap<String, Object>>)getSqlSession().selectList("userQuery.childList", childListMap);
	}
	
	/**
	 * 자녀 상세정보
	 * @param childListMap
	 * @return
	 */
	public Map<String, Object> childDetail(Map<String, Object> childListMap){
		return (Map<String, Object>)getSqlSession().selectOne("userQuery.childDetail", childListMap);
	}
	
	
	/**
	 * 관리자 회원 생성
	 * @param userListMap
	 * @return
	 */
	public void addAdminUser(Map<String, Object> userListMap){
		getSqlSession().insert("userQuery.addAdminUser",userListMap);
	}
	
	/**
	 * 관리자 회원 정보 수정
	 * @param userListMap
	 * @return
	 */
	public void modifyAdminUser(Map<String, Object> userListMap){
		getSqlSession().update("userQuery.modifyAdminUser", userListMap);
	}
	
	/**
	 * 회원 삭제
	 * @param userListMap
	 * @return
	 */
	public void deleteUser(String userListMap){
		getSqlSession().update("userQuery.deleteUser", userListMap);
	}

	public int totalCount(Map parameter) {
		return (Integer)getSqlSession().selectOne("userQuery.totalCount", parameter);
	}

	public int adminUserCheckCount(Map parameter) {
		return (Integer)getSqlSession().selectOne("userQuery.adminUserCheckCount", parameter);
	}

	public int userIdCheckCount(Map paramMap) {
		return (Integer)getSqlSession().selectOne("userQuery.userIdCheckCount", paramMap);
	}
	
}