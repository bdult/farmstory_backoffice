package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.ConstantsForDb;
import com.bgg.farmstoryback.dao.UserDao;

@Service
public class UserService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private UserDao userDao;
	
	/**
	 * 전체(이용, 탈퇴, 이용정지) 회원 카운트
	 * @param search
	 * @return
	 */
	@SuppressWarnings("rawtypes") 
	public int totalCount(Map search) {
		return userDao.totalCount(search);
	}
	
	@SuppressWarnings({ "rawtypes"}) 
	public Map list() {
		return list(null);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" }) 
	public Map list(Map search) {
		Map resultInfo = new HashMap();
		List<Map> userList = userDao.userList(search);
		resultInfo.put(ConstantsForDb.MEMBER_LIST, userList);
		resultInfo.put(ConstantsForDb.MEMBER_LIST_COUNT, userList.size());
		return resultInfo;
	}


	@SuppressWarnings("rawtypes")
	public Map adminMemberInfo(Map<String, Object> paramMap) {
		return userDao.adminMemberInfo(paramMap);
	}

	
//	public Map<String, Object> getOneRole(Map<String, Object> paramMap) {
//		return userDao.getOneRole(paramMap);
//	}
//	
//	/**
//	 * member_type 체크 ( 1:admin, 2:user )
//	 * @param paramMap
//	 * @return
//	 */
//	public Map<String, Object> typeCheck(Map<String, Object> paramMap) {
//		
//		
//		return userDao.typeCheck(paramMap);
//	}
//	
//	
//	
//	/**
//	 * admin 유저 리스트
//	 * @return
//	 */
//	public List<HashMap<String, Object>> adminUserList(Map parameter) {
//		parameter.put("whereType", "0");
//		return userDao.userList(parameter);
//	}
//	
//	public int adminUserTotalCount(Map parameter) {
//		if(parameter == null){
//			parameter = new HashMap();
//		}
//		parameter.put("whereType", "0");
//		return userDao.totalCount(parameter);
//	}
//	
//	public int normalUserTotalCount(Map parameter) {
//		if(parameter == null){
//			parameter = new HashMap();
//		}
//		parameter.put("whereType", "1");
//		logger.info("{}", parameter);
//		return userDao.totalCount(parameter);
//	}
//	
//	/**
//	 * 상세 자녀 정보
//	 * @param paramMap
//	 * @return
//	 */
//	public List<HashMap<String, Object>> childList (Map<String, Object> paramMap) {
//		
//		return userDao.childList(paramMap);
//	}
//	
//	/**
//	 * 한개의 유저 리스트
//	 * @param paramMap
//	 * @return
//	 */
//	public Map<String, Object> detail(Map<String, Object> paramMap) {
//		
//		Map detailInfo = new HashMap();
//		
//		Map userDetail = userDao.detail(paramMap);
//		detailInfo.put("userDetail", userDetail );
//		if((Integer)userDetail.get("MEMBER_TYPE") == 1){
//			detailInfo.put("userChildList", userDao.childList(paramMap));
//			detailInfo.put("type", "userView");
//		}else{
//			detailInfo.put("type", "adminView");
//		}
//		return detailInfo;
//	}
//	
//	/**
//	 * 한개의 자녀 리스트
//	 * @param paramMap
//	 * @return
//	 */
//	public Map<String, Object> childDetail(Map<String, Object> paramMap) {
//		return userDao.childDetail(paramMap);
//	}
//	
//	
//	/**
//	 * 관리자 회원 생성
//	 * @param paramMap
//	 * @return
//	 */
//	public void addAdminUser(Map<String, Object> paramMap){
//		
//		userDao.addAdminUser(paramMap);
//	}
//	
//	public void modifyAdminUser(Map<String, Object> paramMap){
//		
//		userDao.modifyAdminUser(paramMap);
//	}
//	
//	/**
//	 * 유저리스트 삭제
//	 * <pre>
//	 * Param sample
//	 * Map<String, String> map = new HashMap<String, String>();
//	 * map.put("MEMBER_ID", "test");
//	 * </pre>
//	 * @param paramMap
//	 * @return
//	 */
//	public void deleteUser(Map<String, Object> paramMap){
//		
//		userDao.deleteUser((String)paramMap.get("member_id"));
//	}
//
//	public boolean isNotAdminUser(Map parameter) {
//		int checkCount = userDao.adminUserCheckCount(parameter);
//		if(checkCount == 0){
//			return true;
//		}else{
//			return false;
//		}
//	}
//
//	public boolean isNotFoundUser(Map paramMap) {
//		int checkCount = userDao.userIdCheckCount(paramMap);
//		return false;
//	}
//
//	public List top5() {
//		return userDao.top5();
//	}

}
