package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.ConstantsForDb;
import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.common.ConstantsForResponse;
import com.bgg.farmstoryback.dao.UserDao;
import com.mysql.jdbc.StringUtils;

@Service
public class UserService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private UserDao userDao;
	
	
	@SuppressWarnings({ "rawtypes"}) 
	public Map list() {
		return list(null);
	}
	
	/**
	 * 검색 조건에 맞는 회원 리스트 조회
	 * 
	 * @param search
	 * @return Map (member_list, member_list_count)
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" }) 
	public Map list(Map search) {
		Map resultInfo = new HashMap();
		List<Map> userList = userDao.userList(search);
		resultInfo.put(ConstantsForResponse.MEMBER_LIST, userList);
		return resultInfo;
	}
	
	public int totalCount(Map search){
		return userDao.userListCount(search);
	}


	/**
	 * 관리자 회원 정보
	 * @param requestParamMap (member_id 필수, member_pwd 필수)
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Map adminMemberInfo(Map requestParamMap) {
		return userDao.adminMemberInfo(requestParamMap);
	}

	/**
	 * 해당 회원의 상세 정보 조회
	 * 결제, 문의, 아이 정보는 미포함
	 * @param requestParamMap (member_id 필수)
	 * @return 회원 상세 정보
	 */
	@SuppressWarnings("rawtypes")
	public Map detail(Map requestParamMap) {
		if(hasMemberId(requestParamMap)){
			return userDao.detail(requestParamMap);
		}else{
			return null;
		}
	}

	/**
	 * 해당 회원의 아이 정보 조회
	 * @param requestParamMap (member_id 필수)
	 * @return 아이 정보 리스트
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> childInfo(Map requestParamMap) {
		if(hasMemberId(requestParamMap)){
			return userDao.childInfo(requestParamMap);
		}else{
			return null;
		}
	}

	/**
	 * 해당 회원 결제 내역 조회
	 * @param requestParamMap (member_id 필수)
	 * @return 결제 내역 리스트
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> paymentsInfo(Map requestParamMap) {
		if(hasMemberId(requestParamMap)){
			return userDao.paymentsInfo(requestParamMap);
		}else{
			return null;
		}
	}

	/**
	 * 해당 회원의 1:1 문의 내역 (member_id 필수)
	 * @param requestParamMap
	 * @return 1:1 문의 리스트
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> queryInfo(Map requestParamMap) {
		if(hasMemberId(requestParamMap)){
			return userDao.queryInfo(requestParamMap);
		}else{
			return null;
		}
	}

	@SuppressWarnings("rawtypes")
	private boolean hasMemberId(Map requestParamMap) {
		String member_id = (String)requestParamMap.get(ConstantsForParam.MEMBER_ID);
		if(StringUtils.isNullOrEmpty(member_id)){
			return false;
		}else{
			return true;
		}
	}

	public List<Map> top(int limitCount) {
		return userDao.top(limitCount);
	}

	public void modifyUserInfo(Map requestParamMap) {
		userDao.modifyUserInfo(requestParamMap);
	}

	public void modifyChildInfo(Map requestParamMap) {
		userDao.modifyChildInfo(requestParamMap);
		
	}

	
//	public Map<String, Object> getOneRole(Map<String, Object> requestParamMap) {
//		return userDao.getOneRole(requestParamMap);
//	}
//	
//	/**
//	 * member_type 체크 ( 1:admin, 2:user )
//	 * @param requestParamMap
//	 * @return
//	 */
//	public Map<String, Object> typeCheck(Map<String, Object> requestParamMap) {
//		
//		
//		return userDao.typeCheck(requestParamMap);
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
//	 * @param requestParamMap
//	 * @return
//	 */
//	public List<HashMap<String, Object>> childList (Map<String, Object> requestParamMap) {
//		
//		return userDao.childList(requestParamMap);
//	}
//	
//	/**
//	 * 한개의 유저 리스트
//	 * @param requestParamMap
//	 * @return
//	 */
//	public Map<String, Object> detail(Map<String, Object> requestParamMap) {
//		
//		Map detailInfo = new HashMap();
//		
//		Map userDetail = userDao.detail(requestParamMap);
//		detailInfo.put("userDetail", userDetail );
//		if((Integer)userDetail.get("MEMBER_TYPE") == 1){
//			detailInfo.put("userChildList", userDao.childList(requestParamMap));
//			detailInfo.put("type", "userView");
//		}else{
//			detailInfo.put("type", "adminView");
//		}
//		return detailInfo;
//	}
//	
//	/**
//	 * 한개의 자녀 리스트
//	 * @param requestParamMap
//	 * @return
//	 */
//	public Map<String, Object> childDetail(Map<String, Object> requestParamMap) {
//		return userDao.childDetail(requestParamMap);
//	}
//	
//	
//	/**
//	 * 관리자 회원 생성
//	 * @param requestParamMap
//	 * @return
//	 */
//	public void addAdminUser(Map<String, Object> requestParamMap){
//		
//		userDao.addAdminUser(requestParamMap);
//	}
//	
//	public void modifyAdminUser(Map<String, Object> requestParamMap){
//		
//		userDao.modifyAdminUser(requestParamMap);
//	}
//	
//	/**
//	 * 유저리스트 삭제
//	 * <pre>
//	 * Param sample
//	 * Map<String, String> map = new HashMap<String, String>();
//	 * map.put("MEMBER_ID", "test");
//	 * </pre>
//	 * @param requestParamMap
//	 * @return
//	 */
//	public void deleteUser(Map<String, Object> requestParamMap){
//		
//		userDao.deleteUser((String)requestParamMap.get("member_id"));
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
//	public boolean isNotFoundUser(Map requestParamMap) {
//		int checkCount = userDao.userIdCheckCount(requestParamMap);
//		return false;
//	}
//
//	public List top5() {
//		return userDao.top5();
//	}

}
