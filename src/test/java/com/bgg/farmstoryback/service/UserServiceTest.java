package com.bgg.farmstoryback.service;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;



import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class UserServiceTest {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private UserService userService;
	
	@Before
	public void before() {
	}

	@After
	public void after(){
	}
	
	@Test
	public void testIsNotAdminUser() {

		// given 
		Map paramMap = new HashMap();
		paramMap.put("id", "test");

		// when
		boolean isNotAdminUser = userService.isNotAdminUser(paramMap);

		// then
		assertTrue(isNotAdminUser);

	}
	
	@Test
	public void testGetOneRole(){
		logger.info("아이디와 비밀번호로 유저정보 가져오는 테스트 입니다.");
		logger.info(userService.toString());
		
		//given
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", "test");
		paramMap.put("pw", "123");
		
		//when
		Map<String, Object> login = userService.getOneRole(paramMap);
		
		//than
		logger.info("login : {}", login.toString());
		logger.info("login set 갯수 : {}", login.size());
		
	}

	@Test
	public void testTypeCheck(){
		logger.info("타입 체크 테스트 입니다.");
		logger.info(userService.toString());
		
		//given
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", "test");
		
		//when
		Map<String, Object> type = userService.typeCheck(paramMap);
		
		//than
		logger.info("Result : {}", type.toString());
		logger.info("Result set 갯수 : {}", type.size());
		
	}
	
	@Test
	public void testGetUserOne(){
		logger.info("한개의 유저정보 가져오는 테스트 입니다.");
		logger.info(userService.toString());
		
		//given
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", "test");
		
		//when
		Map<String, Object> userList = userService.detail(paramMap);
		
		//than
		logger.info("userList : {}", userList.toString());
		logger.info("userList set 갯수 : {}", userList.size());
		
	}
	

	@Test
	public void testUserList(){
		logger.info("userList를 가져오는 테스트 입니다.");
		logger.info(userService.toString());
		
		//when
		List<HashMap<String,Object>> userList = userService.userList(null);
		
		//than
		logger.info("userList : {}", userList.toString());
		logger.info("userList set 갯수 : {}", userList.size());
	}
	
	@Test
	public void testAdminUserList(){
		logger.info("adminuserList를 가져오는 테스트 입니다.");
		logger.info(userService.toString());
		
		//when
		List<HashMap<String, Object>> adminUserList = userService.adminUserList(null);
		
		//than
		logger.info("adminUserList : {}", adminUserList.toString());
		logger.info("adminUserList set 갯수 : {}", adminUserList.size());
		
	}
	
	@Test
	public void testChildList(){
		logger.info("자녀리스트를 가져오는 테스트 입니다.");
		logger.info(userService.toString());
		
		//given
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("member_id", "test");
		
		//when
		List<HashMap<String, Object>> childList = userService.childList(paramMap);
		
		//than
		logger.info("childList : {}", childList.toString());
		logger.info("childList set 갯수 : {}", childList.size());
		
	}
	
	
	@Test
	public void testInsertUser(){
		logger.info("userList추가 테스트 입니다.");
		logger.info(userService.toString());

		//given
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", "testttt");
		paramMap.put("name", "굿");
		paramMap.put("pw", "123");
		
		//when
		userService.addAdminUser(paramMap);
		
		//than
	}
	


	
	@Test
	public void testDeleteUser(){
		logger.info("userList삭제 테스트 입니다.");
		logger.info(userService.toString());
		
		//given
		String id = "asf";
		
		Map<String, Object> userDTO = new HashMap<String, Object>();
		userDTO.put("id", id);
		
		//when
		userService.deleteUser(userDTO);
		
		//than
	}
}