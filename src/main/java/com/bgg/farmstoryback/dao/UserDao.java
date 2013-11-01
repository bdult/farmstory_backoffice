package com.bgg.farmstoryback.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;











import java.util.HashMap;
import java.util.Map;


@Repository
@SuppressWarnings("unchecked")
public class UserDao extends SqlSessionDaoSupport {
	
	
	/**
	 * 회원 리스트
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> userList(Map search) {
		return (List<Map>)getSqlSession().selectList("userQuery.list", search);
	}

	@SuppressWarnings("rawtypes")
	public int totalCount(Map search) {
		return (Integer)getSqlSession().selectOne("userQuery.totalCount", search);
	}

	@SuppressWarnings("rawtypes")
	public Map adminMemberInfo(Map paramMap) {
		return (Map)getSqlSession().selectOne("userQuery.adminMemberInfo", paramMap);
	}

	@SuppressWarnings("rawtypes")
	public Map detail(Map paramMap) {
		return (Map)getSqlSession().selectOne("userQuery.detail", paramMap);
	}

	@SuppressWarnings("rawtypes")
	public List<Map> childInfo(Map paramMap) {
		return (List<Map>)getSqlSession().selectList("userQuery.childInfo", paramMap);
	}

	@SuppressWarnings("rawtypes")
	public List<Map> paymentsInfo(Map paramMap) {
		return (List<Map>)getSqlSession().selectList("userQuery.paymentsInfo", paramMap);
	}

	/**
	 * 회원의 1:1 문의 내역
	 * @param paramMap
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> queryInfo(Map paramMap) {
		return (List<Map>)getSqlSession().selectList("userQuery.queryInfo", paramMap);
	}

	public List<Map> top(int limitCount) {
		return (List<Map>)getSqlSession().selectList("userQuery.top", limitCount);
	}

	

//	/** 아이디와 비밀번호로 유저정보(id, pwd, role)가져오기
//	 * @param oneRoleMap
//	 * @return
//	 */
//	public Map<String, Object> getOneRole(Map<String, Object> oneRoleMap){
//		return (Map<String, Object>)getSqlSession().selectOne("userQuery.getOneRole", oneRoleMap);
//	}
//
//	/**
//	 * member_type 체크 (1:admin, 2:user)
//	 * @param userListMap
//	 * @return
//	 */
//	public Map<String, Object> typeCheck(Map<String, Object> userListMap){
//		return (Map<String, Object>)getSqlSession().selectOne("userQuery.typeCheck", userListMap);
//	}
//	
//	/**
//	 * 리스트 하나보기
//	 * @param userListMap
//	 * @return
//	 */
//	public Map<String, Object> detail(Map<String, Object> userListMap){
//		return (Map<String, Object>)getSqlSession().selectOne("userQuery.detail", userListMap);
//	}
//	
//	
//	
//	/**
//	 * 자녀리스트 보기
//	 * @param childListMap
//	 * @return
//	 */
//	public List<HashMap<String, Object>> childList(Map<String, Object> childListMap) {
//		return (List<HashMap<String, Object>>)getSqlSession().selectList("userQuery.childList", childListMap);
//	}
//	
//	/**
//	 * 자녀 상세정보
//	 * @param childListMap
//	 * @return
//	 */
//	public Map<String, Object> childDetail(Map<String, Object> childListMap){
//		return (Map<String, Object>)getSqlSession().selectOne("userQuery.childDetail", childListMap);
//	}
//	
//	
//	/**
//	 * 관리자 회원 생성
//	 * @param userListMap
//	 * @return
//	 */
//	public void addAdminUser(Map<String, Object> userListMap){
//		getSqlSession().insert("userQuery.addAdminUser",userListMap);
//	}
//	
//	/**
//	 * 관리자 회원 정보 수정
//	 * @param userListMap
//	 * @return
//	 */
//	public void modifyAdminUser(Map<String, Object> userListMap){
//		getSqlSession().update("userQuery.modifyAdminUser", userListMap);
//	}
//	
//	/**
//	 * 회원 삭제
//	 * @param userListMap
//	 * @return
//	 */
//	public void deleteUser(String userListMap){
//		getSqlSession().update("userQuery.deleteUser", userListMap);
//	}
//
//	public int totalCount(Map parameter) {
//		return (Integer)getSqlSession().selectOne("userQuery.totalCount", parameter);
//	}
//
//	public int adminUserCheckCount(Map parameter) {
//		return (Integer)getSqlSession().selectOne("userQuery.adminUserCheckCount", parameter);
//	}
//
//	public int userIdCheckCount(Map paramMap) {
//		return (Integer)getSqlSession().selectOne("userQuery.userIdCheckCount", paramMap);
//	}
//
//	public List top5() {
//		return (List)getSqlSession().selectList("userQuery.top5");
//	}
	
}