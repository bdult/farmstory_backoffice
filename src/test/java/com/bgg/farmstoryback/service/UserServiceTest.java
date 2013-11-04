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


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class UserServiceTest {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@SuppressWarnings("rawtypes")
	Map requeryParamMap = null;
	
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
		requeryParamMap = new HashMap<String, Object>();
		
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
		requeryParamMap.put(ConstantsForParam.MEMBER_ID, "master");
		requeryParamMap.put(ConstantsForParam.MEMBER_PWD, "123");

		// when
		Map memberInfo = userService.adminMemberInfo(requeryParamMap);

		// then
		assertThat(memberInfo, is(notNullValue()));

	}
	
	
	@Test
	public void testUserListTotal(){
		
		//when
		requeryParamMap.put(ConstantsForParam.PAGE_START_NO, "1");
		requeryParamMap.put(ConstantsForParam.PAGE_PER_PAGE, "10");
		result = userService.list();
		
		assertThat((Integer)result.get(ConstantsForDb.MEMBER_LIST_COUNT), is(not(0)));
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchByMemberId() {
		
		// given 
		requeryParamMap.put(ConstantsForParam.SEARCH_TYPE, "id");
		requeryParamMap.put(ConstantsForParam.SEARCH, testId);

		// when
		result = userService.list(requeryParamMap);

		// then
		assertThat((Integer)result.get(ConstantsForDb.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForDb.MEMBER_LIST)){
			String memberId =(String)memberInfo.get(ConstantsForDb.MEMBER_ID);
			assertTrue(memberId.toLowerCase().contains(testId));
		}

	}

	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchByMemberName() {
		
		// given 
		requeryParamMap.put(ConstantsForParam.SEARCH_TYPE, "name");
		requeryParamMap.put(ConstantsForParam.SEARCH, testName);

		// when
		result = userService.list(requeryParamMap);

		// then
		assertThat((Integer)result.get(ConstantsForDb.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForDb.MEMBER_LIST)){
			String memberName = (String)memberInfo.get(ConstantsForDb.MEMBER_NAME);
			assertTrue(memberName.contains(testName));
		}

	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchByMemberCelNo() {
		
		// given 
		
		requeryParamMap.put(ConstantsForParam.SEARCH_TYPE, "cel");
		requeryParamMap.put(ConstantsForParam.SEARCH, testCelNo);
		
		// when
		result = userService.list(requeryParamMap);
		
		// then
		assertThat((Integer)result.get(ConstantsForDb.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForDb.MEMBER_LIST)){
			String memberCel =(String)memberInfo.get(ConstantsForDb.MEMBER_CEL);
			assertTrue(memberCel.replaceAll("-", "") .equals(testCelNo));
		}
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchByJoinDate() {
		
		// given 
		requeryParamMap.put(ConstantsForParam.SEARCH_START_DT, testJoinStartDate);
		requeryParamMap.put(ConstantsForParam.SEARCH_END_DT, testJoinEndDate);
		
		// when
		result = userService.list(requeryParamMap);
		
		// then
		
		// 가입일 검증
		assertThat((Integer)result.get(ConstantsForDb.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForDb.MEMBER_LIST)){
			String memberRegDt =(String)memberInfo.get(ConstantsForDb.REG_DT);
			if(memberRegDt.replaceAll("-", "").contains(testJoinStartDate)
					|| memberRegDt.replaceAll("-", "").contains(testJoinEndDate)){
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
		requeryParamMap.put(ConstantsForParam.MEMBER_ROLE, searchRole);

		// when
		result = userService.list(requeryParamMap);
		
		// then
		assertThat((Integer)result.get(ConstantsForDb.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForDb.MEMBER_LIST)){
			int memberRole =(Integer)memberInfo.get(ConstantsForDb.MEMBER_ROLE);
			assertTrue(memberRole == Integer.parseInt(searchRole));
		}
		
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchFullDataByMemberId() {
		
		// given 
		requeryParamMap.put(ConstantsForParam.SEARCH_TYPE, "id");
		requeryParamMap.put(ConstantsForParam.SEARCH, testId);
		setDefaultSearchData();

		// when
		result = userService.list(requeryParamMap);
		
		// then
		assertThat((Integer)result.get(ConstantsForDb.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForDb.MEMBER_LIST)){
			assertDefaultSearchInfo(memberInfo);
			String memberId =(String)memberInfo.get("MEMBER_ID");
			assertTrue(memberId.contains(testId));
		}

	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchFullDataByMemberName() {
		
		// given 
		requeryParamMap.put(ConstantsForParam.SEARCH_TYPE, "name");
		requeryParamMap.put(ConstantsForParam.SEARCH, testName);
		setDefaultSearchData();
		
		// when
		result = userService.list(requeryParamMap);
		
		// then
		assertThat((Integer)result.get(ConstantsForDb.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForDb.MEMBER_LIST)){
			
			assertDefaultSearchInfo(memberInfo);
			
			String memberName =(String)memberInfo.get("MEMBER_NM");
			assertTrue(memberName.contains(testName));
		}
		
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testSearchFullDataByMemberCel() {
		
		// given 
		requeryParamMap.put(ConstantsForParam.SEARCH_TYPE, "cel");
		requeryParamMap.put(ConstantsForParam.SEARCH, testCelNo);
		setDefaultSearchData();
		
		// when
		result = userService.list(requeryParamMap);
		
		// then
		assertThat((Integer)result.get(ConstantsForDb.MEMBER_LIST_COUNT), is(not(0)));
		for(Map memberInfo : (List<Map>)result.get(ConstantsForDb.MEMBER_LIST)){
			
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
		Map memberDetail = userService.detail(requeryParamMap);

		// then
		assertThat(memberDetail, is(notNullValue()));

	}
	
	@Test
	@SuppressWarnings({ "rawtypes"})
	public void testMemberChildInfo() {
		
		// given 
		setTestMemberId();

		// when
		List<Map> childInfo = userService.childInfo(requeryParamMap);

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
		List<Map> paymentsInfo = userService.paymentsInfo(requeryParamMap);
		
		// then
		assertThat(paymentsInfo, is(notNullValue()));
		assertThat(paymentsInfo.size(), is(not(0)));
	}
	
	@Test
	public void testMemeberQueryInfo() {
		
		// given 
		setTestMemberId();

		// when
		List<Map> queryInfo = userService.queryInfo(requeryParamMap);

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
	
	
	

	@SuppressWarnings("unchecked")
	private void setTestMemberId() {
		testId = "test";
		requeryParamMap.put(ConstantsForParam.MEMBER_ID, testId);
	}

	@SuppressWarnings("rawtypes")
	private void assertDefaultSearchInfo(Map result) {
		int memberRole =(Integer)result.get(ConstantsForDb.MEMBER_ROLE);
		assertTrue(memberRole == Integer.parseInt(searchRole));
		
		// 가입일 검증
		String memberRegDt =(String)result.get(ConstantsForDb.REG_DT);
		if(memberRegDt.replaceAll("-", "").contains(testJoinStartDate)
				|| memberRegDt.replaceAll("-", "").contains(testJoinEndDate)){
			assertTrue(true);
		}else{
			assertTrue(false);
		}
	}

	@SuppressWarnings("unchecked")
	private void setDefaultSearchData() {
		requeryParamMap.put(ConstantsForParam.MEMBER_ROLE, searchRole);
		requeryParamMap.put(ConstantsForParam.SEARCH_START_DT, testJoinStartDate);
		requeryParamMap.put(ConstantsForParam.SEARCH_END_DT, testJoinEndDate);
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