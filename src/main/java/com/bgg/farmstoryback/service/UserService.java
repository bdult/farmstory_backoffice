package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.UserDao;
import com.bgg.farmstoryback.dto.UserDto;



@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	
	/**
	 * 모든 유저 리스트
	 * @return
	 */
	public List<HashMap<String,String>> userList() {
		return userDao.userList();
	}
	
	/**
	 * 한개의 유저 리스트
	 * @param paramMap
	 * @return
	 */
	public Map<String, String> getUserOne(Map<String, Object> paramMap) {
		return userDao.getUserOne(paramMap);
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
		
		return userDao.insertUser(map);
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
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", (String)paramMap.get("id"));
		map.put("name", (String)paramMap.get("name"));
		map.put("pwd", (String)paramMap.get("pwd"));
		map.put("role", (String)paramMap.get("role"));
		
		return userDao.updateUser(map);
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
}