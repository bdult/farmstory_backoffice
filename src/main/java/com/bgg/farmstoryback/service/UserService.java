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
	

	public Map<String, String> getOneRole(Map<String, Object> paramMap) {
		return userDao.getOneRole(paramMap);
	}
	
	public Map<String, Object> typeCheck(Map<String, Object> paramMap) {
		
		
		return userDao.typeCheck(paramMap);
	}
	
	/**
	 * 모든 유저 리스트
	 * @return
	 */
	public List<HashMap<String,String>> userList() {
		return userDao.userList();
	}
	
	public List<HashMap<String, Object>> adminUserList() {
		return userDao.adminUserList();
	}
	
	public List<HashMap<String, Object>> childList (Map<String, Object> paramMap) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", paramMap.get("id"));
		
		return userDao.childList(map);
	}
	
	/**
	 * 한개의 유저 리스트
	 * @param paramMap
	 * @return
	 */
	public Map<String, String> getUserOne(Map<String, Object> paramMap) {
		return userDao.getUserOne(paramMap);
	}
	
	public Map<String, Object> getChildOne(Map<String, Object> paramMap) {
		return userDao.getChildOne(paramMap);
	}
	
	
	
	public List<HashMap<String, Object>> userSearch(Map<String, Object> paramMap) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", paramMap.get("id"));
		map.put("name", paramMap.get("name"));
		map.put("role", paramMap.get("role"));
		
		return userDao.userSearch(map);
	}
	
	/**
	 * 유저리스트 생성
	 * <pre>
	 * Param sample
	 * Map<String, String> map = new HashMap<String, String>();
	 * map.put("MEMBER_ID", "test");
	 * map.put("MEMBER_NM", "Unho");
	 * map.put("MEMBER_PW", "1234");
	 * </pre>
	 * @param paramMap
	 * @return
	 */
	public int insertUser(Map<String, Object> paramMap){
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", (String)paramMap.get("id"));
		map.put("name", (String)paramMap.get("name"));
		map.put("pwd", (String)paramMap.get("pwd"));
		map.put("role", (String)paramMap.get("role"));
		map.put("member_type", (String)paramMap.get("member_type"));
		
		return userDao.insertUser(map);
	}
	
	public int insertChild(Map<String, Object> paramMap){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("parent_member_id", paramMap.get("parent_member_id"));
		map.put("child_nm", paramMap.get("child_nm"));
		map.put("photo", paramMap.get("photo"));
		map.put("gender", paramMap.get("gender"));
		map.put("birth_year", paramMap.get("birth_year"));
		map.put("birth_month", paramMap.get("birth_month"));
		map.put("birth_day", paramMap.get("birth_day"));
		
		return userDao.insertChild(map);
	}
	
	/**
	 * 유저리스트 수정
	 * <pre>
	 * Param sample
	 * Map<String, String> map = new HashMap<String, String>();
	 * map.put("MEMBER_ID", "test");
	 * map.put("MEMBER_NM", "Unho");
	 * map.put("MEMBER_PW", "1234");
	 * </pre>
	 * @param paramMap
	 * @return
	 */
	public int updateUser(Map<String, Object> paramMap){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", paramMap.get("id"));
		map.put("name", paramMap.get("name"));
		map.put("pwd", paramMap.get("pwd"));
		map.put("role", paramMap.get("role"));
		map.put("member_type", paramMap.get("member_type"));
		
		return userDao.updateUser(map);
	}
	
	public int updateChild(Map<String, Object> paramMap){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", paramMap.get("idx"));
		map.put("parent_member_id", paramMap.get("parent_member_id"));
		map.put("child_nm", paramMap.get("child_nm"));
		map.put("photo", paramMap.get("photo"));
		map.put("gender", paramMap.get("gender"));
		map.put("birth_year", paramMap.get("birth_year"));
		map.put("birth_month", paramMap.get("birth_month"));
		map.put("birth_day", paramMap.get("birth_day"));
		
		return userDao.updateChild(map);
	}
	
	/**
	 * 유저리스트 삭제
	 * <pre>
	 * Param sample
	 * Map<String, String> map = new HashMap<String, String>();
	 * map.put("MEMBER_ID", "test");
	 * </pre>
	 * @param paramMap
	 * @return
	 */
	public int deleteUser(Map<String, Object> paramMap){
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", (String)paramMap.get("id"));
		
		return userDao.deleteUser(map);
	}
	
	public int deleteChild(Map<String, Object> paramMap){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", paramMap.get("idx"));
		
		return userDao.deleteChild(map);
	}
}
