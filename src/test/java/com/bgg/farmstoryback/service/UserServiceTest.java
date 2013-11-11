package com.bgg.farmstoryback.service;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bgg.farmstoryback.common.ConstantsForDb;
import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.common.ConstantsForResponse;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class UserServiceTest {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@SuppressWarnings("rawtypes")
	Map requestParamMap = null;
	
	@SuppressWarnings("rawtypes")
	Map result = null;
	
	private String testId = null;
	private String testName = null;
	private String testJoinStartDate = null;
	private String testJoinEndDate = null;
	private String searchRole = null; 
	private String testCelNo = null;
	

	@Autowired
	private UserService userService;
	
	@Before
	public void before() {
		requestParamMap = new HashMap<String, Object>();
		
		testId = "te";
		testName = "test";
		testCelNo = "01011111111";
		testJoinStartDate = "2013-09-03";
		testJoinEndDate = "2013-09-05";
		searchRole = "1"; // 무료회원
	}

	@After
	public void after(){
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Test
	public void testAdminMemberInfo() {
		
		// given 
		requestParamMap.put(ConstantsForParam.MEMBER_ID, "master");
		requestParamMap.put(ConstantsForParam.MEMBER_PWD, "123");

		// when
		Map memberInfo = userService.adminMemberInfo(requestParamMap);

		// then
		assertThat(memberInfo, is(notNullValue()));

	}
	
	
	@Test
	public void testUserListTotal(){
		
		//when
		requestParamMap.put(ConstantsForParam.PAGE_START_NO, "1");
		requestParamMap.put(ConstantsForParam.PAGE_PER_PAGE, "10");
		result = userService.list();
		
		assertThat((Integer)result.get(ConstantsForResponse.MEMBER_LIST_COUNT), is(not(0)));
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchByMemberId() {
		
		// given 
		requestParamMap.put(ConstantsForParam.SEARCH_TYPE, "id");
		requestParamMap.put(ConstantsForParam.SEARCH, testId);

		// when
		result = userService.list(requestParamMap);

		// then
		assertThat((Integer)result.get(ConstantsForResponse.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForResponse.MEMBER_LIST)){
			String memberId =(String)memberInfo.get(ConstantsForDb.MEMBER_ID);
			assertTrue(memberId.toLowerCase().contains(testId));
		}

	}

	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchByMemberName() {
		
		// given 
		requestParamMap.put(ConstantsForParam.SEARCH_TYPE, "name");
		requestParamMap.put(ConstantsForParam.SEARCH, testName);

		// when
		result = userService.list(requestParamMap);

		// then
		assertThat((Integer)result.get(ConstantsForResponse.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForResponse.MEMBER_LIST)){
			String memberName = (String)memberInfo.get(ConstantsForDb.MEMBER_NAME);
			assertTrue(memberName.contains(testName));
		}

	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchByMemberCelNo() {
		
		// given 
		
		requestParamMap.put(ConstantsForParam.SEARCH_TYPE, "cel");
		requestParamMap.put(ConstantsForParam.SEARCH, testCelNo);
		
		// when
		result = userService.list(requestParamMap);
		
		// then
		assertThat((Integer)result.get(ConstantsForResponse.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForResponse.MEMBER_LIST)){
			String memberCel =(String)memberInfo.get(ConstantsForDb.MEMBER_CEL);
			assertTrue(memberCel.replaceAll("-", "") .equals(testCelNo));
		}
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchByJoinDate() {
		
		// given 
		requestParamMap.put(ConstantsForParam.SEARCH_START_DT, testJoinStartDate);
		requestParamMap.put(ConstantsForParam.SEARCH_END_DT, testJoinEndDate);
		
		// when
		result = userService.list(requestParamMap);
		
		// then
		
		// 가입일 검증
		assertThat((Integer)result.get(ConstantsForResponse.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForResponse.MEMBER_LIST)){
			String memberRegDt =(String)memberInfo.get(ConstantsForDb.REG_DT);
			if(memberRegDt.contains(testJoinStartDate)
					|| memberRegDt.contains(testJoinEndDate)){
				assertTrue(true);
			}else{
				assertTrue(false);
			}
		}
		
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchFreeMember() {
		
		// given 
		requestParamMap.put(ConstantsForParam.MEMBER_ROLE, searchRole);

		// when
		result = userService.list(requestParamMap);
		
		// then
		assertThat((Integer)result.get(ConstantsForResponse.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForResponse.MEMBER_LIST)){
			int memberRole =(Integer)memberInfo.get(ConstantsForDb.MEMBER_ROLE);
			assertTrue(memberRole == Integer.parseInt(searchRole));
		}
		
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchFullDataByMemberId() {
		
		// given 
		requestParamMap.put(ConstantsForParam.SEARCH_TYPE, "id");
		requestParamMap.put(ConstantsForParam.SEARCH, testId);
		setDefaultSearchData();

		// when
		result = userService.list(requestParamMap);
		
		// then
		assertThat((Integer)result.get(ConstantsForResponse.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForResponse.MEMBER_LIST)){
			assertDefaultSearchInfo(memberInfo);
			String memberId =(String)memberInfo.get("MEMBER_ID");
			assertTrue(memberId.contains(testId));
		}

	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchFullDataByMemberName() {
		
		// given 
		requestParamMap.put(ConstantsForParam.SEARCH_TYPE, "name");
		requestParamMap.put(ConstantsForParam.SEARCH, testName);
		setDefaultSearchData();
		
		// when
		result = userService.list(requestParamMap);
		
		// then
		assertThat((Integer)result.get(ConstantsForResponse.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForResponse.MEMBER_LIST)){
			
			assertDefaultSearchInfo(memberInfo);
			
			String memberName =(String)memberInfo.get("MEMBER_NM");
			assertTrue(memberName.contains(testName));
		}
		
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchFullDataByMemberCel() {
		
		// given 
		requestParamMap.put(ConstantsForParam.SEARCH_TYPE, "cel");
		requestParamMap.put(ConstantsForParam.SEARCH, testCelNo);
		setDefaultSearchData();
		
		// when
		result = userService.list(requestParamMap);
		
		// then
		assertThat((Integer)result.get(ConstantsForResponse.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForResponse.MEMBER_LIST)){
			
			assertDefaultSearchInfo(memberInfo);
			
			String celNo =(String)memberInfo.get("MEMBER_CEL");
			assertTrue(celNo.replaceAll("-", "").contains(testCelNo));
		}
		
	}
	
	
	@Test
	public void testMemberIndoDetail() {
		
		// given 
		setTestMemberId();

		// when
		Map memberDetail = userService.detail(requestParamMap);

		// then
		assertThat(memberDetail, is(notNullValue()));

	}
	
	@Test
	@SuppressWarnings({ "rawtypes"})
	public void testMemberChildInfo() {
		
		// given 
		setTestMemberId();

		// when
		List<Map> childInfo = userService.childInfo(requestParamMap);

		// then
		assertThat(childInfo, is(notNullValue()));
		assertThat(childInfo.size(), is(not(0)));
	}
	
	@Test
	@SuppressWarnings({ "rawtypes"})
	public void testMemberPaymentInfo() {
		
		// given 
		setTestMemberId();
		
		// when
		List<Map> paymentsInfo = userService.paymentsInfo(requestParamMap);
		
		// then
		assertThat(paymentsInfo, is(notNullValue()));
		assertThat(paymentsInfo.size(), is(not(0)));
	}
	
	@Test
	public void testMemeberQueryInfo() {
		
		// given 
		setTestMemberId();

		// when
		List<Map> queryInfo = userService.queryInfo(requestParamMap);

		// then
		assertThat(queryInfo, is(notNullValue()));
		assertThat(queryInfo.size(), is(not(0)));

	}
	
	@Test
	public void testTopList() {
		
		// given 
		int limitCount = 8;

		// when
		List<Map> topList = userService.top(limitCount);

		// then
		assertThat(topList, is(notNullValue()));
		assertTrue(topList.size() <= limitCount);

	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testDeleteUser(){

		// given 
		setTestMemberId();
		
		// when
		userService.deleteUserInfo(requestParamMap);

		// then
		assertThat(requestParamMap.get(ConstantsForParam.MEMBER_ID), is(notNullValue()));
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testModifyUserName() {
		
		// given
		String testMemberId = "0";
		List<Map> memberList = (List<Map>)userService.list().get(ConstantsForResponse.MEMBER_LIST);
		if(memberList.size() > 0){
			testMemberId = (String)memberList.get(0).get(ConstantsForDb.MEMBER_ID);
		}
		
		String testModifyUserName = "modify_user";
		String testModifyUserGender = "남";
		String testModifyMemberCel = "010-1111-2222";
		String testModifyMemberEmail = "test@test.com";
		String testModifyMemberAddr1 = "modify_addr_1";
		String testModifyMemberAddr2 = "modify_addr_2";
		String testModifyMemberYear = "2013";
		String testModifyMemberMonth = "10";
		String testModifyMemberDay = "31";
		
		requestParamMap.put(ConstantsForParam.MEMBER_ID, testMemberId);
		requestParamMap.put(ConstantsForParam.MEMBER_NAME, testModifyUserName);
		requestParamMap.put(ConstantsForParam.MEMBER_GENDER, testModifyUserGender);
		requestParamMap.put(ConstantsForParam.MEMBER_CEL, testModifyMemberCel);
		requestParamMap.put(ConstantsForParam.MEMBER_EMAIL, testModifyMemberEmail);
		requestParamMap.put(ConstantsForParam.MEMBER_ADDR_1, testModifyMemberAddr1);
		requestParamMap.put(ConstantsForParam.MEMBER_ADDR_2, testModifyMemberAddr2);
		requestParamMap.put(ConstantsForParam.MEMBER_YEAR, testModifyMemberYear);
		requestParamMap.put(ConstantsForParam.MEMBER_MONTH, testModifyMemberMonth);
		requestParamMap.put(ConstantsForParam.MEMBER_DAY, testModifyMemberDay);

		// when
		userService.modifyUserInfo(requestParamMap);

		// then
		Map memberDetail = userService.detail(requestParamMap);
		assertThat(memberDetail, is(notNullValue()));
		assertThat((String)memberDetail.get(ConstantsForDb.MEMBER_NAME), is(testModifyUserName));
		assertThat((String)memberDetail.get(ConstantsForDb.MEMBER_CEL), is(testModifyMemberCel));
		assertThat((String)memberDetail.get(ConstantsForDb.MEMBER_GENDER), is(testModifyUserGender));
		assertThat((String)memberDetail.get(ConstantsForDb.MEMBER_EMAIL), is(testModifyMemberEmail));
		assertThat((String)memberDetail.get(ConstantsForDb.MEMBER_ADDR_1), is(testModifyMemberAddr1));
		assertThat((String)memberDetail.get(ConstantsForDb.MEMBER_ADDR_2), is(testModifyMemberAddr2));
		assertThat((String)memberDetail.get(ConstantsForDb.MEMBER_YEAR), is(testModifyMemberYear));
		assertThat((String)memberDetail.get(ConstantsForDb.MEMBER_MONTH), is(testModifyMemberMonth));
		assertThat((String)memberDetail.get(ConstantsForDb.MEMBER_DAY), is(testModifyMemberDay));

	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Test
	public void testChildInfoModify() {
		
		// given
		// DB 에서 자녀가 있는 사용자 정보로 테슽 데이터 세팅
		String testMemberId = "0";
		List<Map> memberList = (List<Map>)userService.list().get(ConstantsForResponse.MEMBER_LIST);
		if(memberList.size() > 0){
			for(Map memberInfo : memberList){
				testMemberId = (String)memberInfo.get(ConstantsForDb.MEMBER_ID);
				requestParamMap.put(ConstantsForParam.MEMBER_ID, testMemberId);
				if(userService.childInfo(requestParamMap).size() > 0){
					Map childDetailInfo = userService.childInfo(requestParamMap).get(0);
					requestParamMap.put(ConstantsForParam.CHILD_IDX, childDetailInfo.get(ConstantsForDb.IDX));
					break;
				}
			}
		}
		
		
		String testModifyChildName = "modify_child2";
		String testModifyChildImg = "temp/temp2.gif";
		String testModifyChildGender = "남";
		String testModifyChildYear = "2002";
		String testModifyChildMonth = "02";
		String testModifyChildDay = "31";
		
		requestParamMap.put(ConstantsForParam.CHILD_NAME, testModifyChildName);
		requestParamMap.put(ConstantsForParam.IMG_PATH, testModifyChildImg);
		requestParamMap.put(ConstantsForParam.CHILD_GENDER, testModifyChildGender);
		requestParamMap.put(ConstantsForParam.CHILD_BIR_YEAR, testModifyChildYear);
		requestParamMap.put(ConstantsForParam.CHILD_BIR_MONTH, testModifyChildMonth);
		requestParamMap.put(ConstantsForParam.CHILD_BIR_DAY, testModifyChildDay);
		

		// when
		userService.modifyChildInfo(requestParamMap);

		// then
		requestParamMap.put(ConstantsForParam.MEMBER_ID, testMemberId);
		Map modifyDetailInfo = userService.childInfo(requestParamMap).get(0);
		assertThat((String)modifyDetailInfo.get(ConstantsForDb.CHILD_NM), is(testModifyChildName));
		assertThat((String)modifyDetailInfo.get(ConstantsForDb.CHILD_BIRTH_DAY), is(testModifyChildDay));
		assertThat((String)modifyDetailInfo.get(ConstantsForDb.CHILD_BIRTH_YEAR), is(testModifyChildYear));
		assertThat((String)modifyDetailInfo.get(ConstantsForDb.CHILD_BIRTH_MONTH), is(testModifyChildMonth));
		assertThat((String)modifyDetailInfo.get(ConstantsForDb.CHILD_GENDER), is(testModifyChildGender));
		assertThat((String)modifyDetailInfo.get(ConstantsForDb.CHILD_PHOTO), is(testModifyChildImg));

	}
	
	@Test
	public void testUserLatestInfo() {
		
		// given 

		// when
		List<Map> latestDataList = userService.latestData();

		// then
		assertThat(latestDataList, is(notNullValue()));
		assertThat(latestDataList.size(), is(not(0)));
		assertThat(latestDataList.get(0).get(ConstantsForDb.REG_DT), is(notNullValue()));
		assertThat(latestDataList.get(0).get(ConstantsForDb.NEW_MEMBER_COUNT), is(notNullValue()));
		assertThat(latestDataList.get(0).get(ConstantsForDb.PAY_MEMBER_COUNT), is(notNullValue()));

	}
	
	
	

	@SuppressWarnings("unchecked")
	private void setTestMemberId() {
		testId = "test";
		requestParamMap.put(ConstantsForParam.MEMBER_ID, testId);
	}

	@SuppressWarnings("rawtypes")
	private void assertDefaultSearchInfo(Map result) {
		int memberRole =(Integer)result.get(ConstantsForDb.MEMBER_ROLE);
		assertTrue(memberRole == Integer.parseInt(searchRole));
		
		// 가입일 검증
		String memberRegDt =(String)result.get(ConstantsForDb.REG_DT);
		if(memberRegDt.contains(testJoinStartDate)
				|| memberRegDt.contains(testJoinEndDate)){
			assertTrue(true);
		}else{
			assertTrue(false);
		}
	}

	@SuppressWarnings("unchecked")
	private void setDefaultSearchData() {
		requestParamMap.put(ConstantsForParam.MEMBER_ROLE, searchRole);
		requestParamMap.put(ConstantsForParam.SEARCH_START_DT, testJoinStartDate);
		requestParamMap.put(ConstantsForParam.SEARCH_END_DT, testJoinEndDate);
	}
	
	
	
	
	
//	@Test
//	public void testIsNotAdminUser() {
//
//		// given 
//		Map paramMap = new HashMap();
//		paramMap.put("id", "test");
//
//		// when
//		boolean isNotAdminUser = userService.isNotAdminUser(paramMap);
//
//		// then
//		assertTrue(isNotAdminUser);
//
//	}
//	
//	@Test
//	public void testGetOneRole(){
//		logger.info("아이디와 비밀번호로 유저정보 가져오는 테스트 입니다.");
//		logger.info(userService.toString());
//		
//		//given
//		paramMap.put("id", "test");
//		paramMap.put("pw", "123");
//		
//		//when
//		Map<String, Object> login = userService.getOneRole(paramMap);
//		
//		//than
//		logger.info("login : {}", login.toString());
//		logger.info("login set 갯수 : {}", login.size());
//		
//	}
//
//	@Test
//	public void testTypeCheck(){
//		logger.info("타입 체크 테스트 입니다.");
//		logger.info(userService.toString());
//		
//		//given
//		paramMap.put("id", "test");
//		
//		//when
//		Map<String, Object> type = userService.typeCheck(paramMap);
//		
//		//than
//		logger.info("Result : {}", type.toString());
//		logger.info("Result set 갯수 : {}", type.size());
//		
//	}
//	
//	@Test
//	public void testDetail(){
//		
//		//given
//		paramMap.put("id", "test");
//		
//		//when
//		Map<String, Object> userList = userService.detail(paramMap);
//		
//		//than
//		logger.info("userList : {}", userList.toString());
//		logger.info("userList set 갯수 : {}", userList.size());
//		
//	}
//	
//
//	
//	
//	@Test
//	public void testAdminUserList(){
//		logger.info("adminuserList를 가져오는 테스트 입니다.");
//		logger.info(userService.toString());
//		
//		//when
//		List<HashMap<String, Object>> adminUserList = userService.adminUserList(null);
//		
//		//than
//		logger.info("adminUserList : {}", adminUserList.toString());
//		logger.info("adminUserList set 갯수 : {}", adminUserList.size());
//		
//	}
//	
//	@Test
//	public void testChildList(){
//		logger.info("자녀리스트를 가져오는 테스트 입니다.");
//		logger.info(userService.toString());
//		
//		//given
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("member_id", "test");
//		
//		//when
//		List<HashMap<String, Object>> childList = userService.childList(paramMap);
//		
//		//than
//		logger.info("childList : {}", childList.toString());
//		logger.info("childList set 갯수 : {}", childList.size());
//		
//	}
//	
//	
//	@Test
//	public void testInsertUser(){
//		logger.info("userList추가 테스트 입니다.");
//		logger.info(userService.toString());
//
//		//given
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("id", "testttt");
//		paramMap.put("name", "굿");
//		paramMap.put("pw", "123");
//		
//		//when
//		userService.addAdminUser(paramMap);
//		
//		//than
//	}
//	
//
//
//	
//	@Test
//	public void testDeleteUser(){
//		logger.info("userList삭제 테스트 입니다.");
//		logger.info(userService.toString());
//		
//		//given
//		String id = "asf";
//		
//		Map<String, Object> userDTO = new HashMap<String, Object>();
//		userDTO.put("id", id);
//		
//		//when
//		userService.deleteUser(userDTO);
//		
//		//than
//	}
}