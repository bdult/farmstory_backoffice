package com.bgg.farmstoryback.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

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
public class UserDaoTest {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private UserDao userDao;
	
	@Before
	public void before() {
		logger.info("==========================");
		logger.info("모든 JUNIT 테스트 시작 전 실행 됩니다.");
		logger.info("==========================");
	}

	@After
	public void after(){
		logger.info("==========================");
		logger.info("모든 JUNIT 테스트 종료 후 실행 됩니다.");
		logger.info("==========================");
	}
	
	//@Ignore
	@Test
	public void testUserList(){
		logger.info("userList를 가져오는 테스트 입니다.");
		logger.info(userDao.toString());
		
		List<HashMap<String,String>> userList = userDao.userList();
		logger.info("Result : {}", userList.toString());
		logger.info("Result set 갯수 : {}", userList.size());
	}
	
	@Test
	public void testGetUserList(){
		logger.info("asf");
		logger.info(userDao.toString());
		
		String id = "test";
		Map<String, Object> userDTO = new TreeMap();
		userDTO.put("id", id);

		
		Map<String, String> userList = userDao.getUserOne(userDTO);
		logger.info("Result : {}", userList.toString());
		logger.info("Result set 갯수 : {}", userList.size());
	}
	
	@Test
	public void testInsertUser(){

		logger.info("userList추가 테스트 입니다.");
		logger.info(userDao.toString());

		Map<String, String> userDTO = new TreeMap();
		userDTO.put("id", "testttt");
		userDTO.put("name", "굿");
		userDTO.put("pw", "123");
		
		int result = userDao.insertUser(userDTO);
		assertNotNull(userDTO);
		assertThat(result, is(not(0)));
		logger.info("{}", userDTO);
	}

	@Test
	public void testUpdateUser() {

		String id = "test";

		Map<String, String> userDTO = new TreeMap();
		userDTO.put("id", id);
		userDTO.put("name", "굿굿");
		userDTO.put("pw", "1234");
		
		int result = userDao.updateUser(userDTO);
		assertNotNull(userDTO);
		assertThat(result, is(not(0)));
		logger.info("{}", userDTO);
	}

	@Test
	public void testDeleteUser(){
		String id = "asf";
		
		Map<String, String> userDTO = new TreeMap();
		userDTO.put("id", id);
		
		int result = userDao.deleteUser(userDTO);
		assertNotNull(userDTO);
		assertThat(result, is(not(0)));
		logger.info("{}", userDTO);
	}
}