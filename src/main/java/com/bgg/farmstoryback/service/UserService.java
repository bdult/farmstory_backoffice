package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.UserDao;

@Service
public class UserService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private UserDao userDao;

	
	public List<HashMap<String, String>> memberList() {
		return userDao.memberList();
	}
	

	public Map<String, Object> getOneRole(Map<String, Object> paramMap) {
		return userDao.getOneRole(paramMap);
	}
	
	/**
	 * member_type 체크 ( 0:admin, 1:user )
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> typeCheck(Map<String, Object> paramMap) {
		
		return userDao.typeCheck(paramMap);
	}
	
	/**
	 * 모든 유저 리스트
	 * @return
	 */
	public List<HashMap<String,Object>> userList() {
		return userDao.userList();
	}
	
	/**
	 * admin 유저 리스트
	 * @return
	 */
	public List<HashMap<String, Object>> adminUserList() {
		return userDao.adminUserList();
	}
	
	/**
	 * 상세 자녀 정보
	 * @param paramMap
	 * @return
	 */
	public List<HashMap<String, Object>> childList (Map<String, Object> paramMap) {
		
		return userDao.childList((String)paramMap.get("id"));
	}
	
	/**
	 * 한개의 유저 리스트
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> getUserOne(Map<String, Object> paramMap) {
		return userDao.getUserOne(paramMap);
	}
	
	/**
	 * 한개의 자녀 리스트
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> getChildOne(Map<String, Object> paramMap) {
		return userDao.getChildOne(paramMap);
	}
	
	
	
	/**
	 * 유저 검색기능 (아이디, 이름, 권한, 자녀수)
	 * @param paramMap
	 * @return
	 */
	public List<HashMap<String, Object>> userSearch(Map<String, Object> paramMap) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", paramMap.get("id"));
		map.put("name", paramMap.get("name"));
		map.put("role", paramMap.get("role"));
		
		return userDao.userSearch(map);
	}
	
	/**
	 * 유저 생성
	 * @param paramMap
	 */
	public void insertUser(Map<String, Object> paramMap){
		
		userDao.insertUser(paramMap);
	}
	
	/**
	 * 자녀 생성
	 * @param paramMap
	 */
	public void insertChild(Map<String, Object> paramMap){
		
		userDao.insertChild(paramMap);
	}
	
	/**
	 * 유저리스트 수정
	 * @param paramMap
	 */
	public void updateUser(Map<String, Object> paramMap){
		
		userDao.updateUser(paramMap);
	}
	
	/**
	 * 자녀리스트 수정
	 * @param paramMap
	 */
	public void updateChild(Map<String, Object> paramMap){
		
		userDao.updateChild(paramMap);
	}
	
	/**
	 * 유저리스트 삭제
	 * @param paramMap
	 */
	public void deleteUser(Map<String, Object> paramMap){
		
		userDao.deleteUser((String)paramMap.get("id"));
	}
	
	
	/**
	 * 자녀리스트 삭제
	 * @param paramMap
	 */
	public void deleteChild(Map<String, Object> paramMap){
		
		userDao.deleteChild((String)paramMap.get("idx"));
	}
}
