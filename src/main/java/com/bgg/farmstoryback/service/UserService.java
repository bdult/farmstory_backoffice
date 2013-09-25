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

	
	public Map<String, Object> getOneRole(Map<String, Object> paramMap) {
		return userDao.getOneRole(paramMap);
	}
	
	/**
	 * member_type 체크 ( 1:admin, 2:user )
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
	public List<HashMap<String,Object>> userList(Map parameter) {
		parameter.put("whereType", "1");
		return userDao.userList(parameter);
	}
	
	/**
	 * admin 유저 리스트
	 * @return
	 */
	public List<HashMap<String, Object>> adminUserList(Map parameter) {
		parameter.put("whereType", "0");
		return userDao.userList(parameter);
	}
	
	public int adminUserTotalCount(Map parameter) {
		if(parameter == null){
			parameter = new HashMap();
		}
		parameter.put("whereType", "0");
		return userDao.totalCount(parameter);
	}
	
	public int normalUserTotalCount(Map parameter) {
		if(parameter == null){
			parameter = new HashMap();
		}
		parameter.put("whereType", "1");
		logger.info("{}", parameter);
		return userDao.totalCount(parameter);
	}
	
	/**
	 * 상세 자녀 정보
	 * @param paramMap
	 * @return
	 */
	public List<HashMap<String, Object>> childList (Map<String, Object> paramMap) {
		
		return userDao.childList(paramMap);
	}
	
	/**
	 * 한개의 유저 리스트
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> detail(Map<String, Object> paramMap) {
		
		Map detailInfo = new HashMap();
		
		Map userDetail = userDao.detail(paramMap);
		detailInfo.put("userDetail", userDetail );
		if((Integer)userDetail.get("MEMBER_TYPE") == 1){
			detailInfo.put("userChildList", userDao.childList(paramMap));
			detailInfo.put("type", "userView");
		}else{
			detailInfo.put("type", "adminView");
		}
		return detailInfo;
	}
	
	/**
	 * 한개의 자녀 리스트
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> childDetail(Map<String, Object> paramMap) {
		return userDao.childDetail(paramMap);
	}
	
	
	/**
	 * 관리자 회원 생성
	 * @param paramMap
	 * @return
	 */
	public void addAdminUser(Map<String, Object> paramMap){
		
		userDao.addAdminUser(paramMap);
	}
	
	public void modifyAdminUser(Map<String, Object> paramMap){
		
		userDao.modifyAdminUser(paramMap);
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
	public void deleteUser(Map<String, Object> paramMap){
		
		userDao.deleteUser((String)paramMap.get("member_id"));
	}

	public boolean isNotAdminUser(Map parameter) {
		int checkCount = userDao.adminUserCheckCount(parameter);
		if(checkCount == 0){
			return true;
		}else{
			return false;
		}
	}

	public boolean isNotFoundUser(Map paramMap) {
		int checkCount = userDao.userIdCheckCount(paramMap);
		return false;
	}

	public List top5() {
		return userDao.top5();
	}


	
	/**
	 * 자녀 생성
	 * @param paramMap
	 * @return
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
	 */
	
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
	public int updateUser(Map<String, Object> paramMap){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", paramMap.get("id"));
		map.put("name", paramMap.get("name"));
		map.put("pwd", paramMap.get("pwd"));
		map.put("role", paramMap.get("role"));
		map.put("member_type", paramMap.get("member_type"));
		
		return userDao.updateUser(map);
	}
	 */
	
	/**
	 * 자녀리스트 수정
	 * @param paramMap
	 * @return
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
	 */
	

	
	/**
	 * 자녀리스트 삭제
	 * @param paramMap
	 * @return
	public int deleteChild(Map<String, Object> paramMap){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", paramMap.get("idx"));
		
		return userDao.deleteChild(map);
	}
	 */
}
