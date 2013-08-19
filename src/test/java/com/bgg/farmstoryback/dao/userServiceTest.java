package com.bgg.farmstoryback.dao;

import static org.hamcrest.CoreMatchers.*;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.*;
import static org.junit.Assert.assertThat;

import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bgg.farmstoryback.service.ViewService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class userServiceTest {

	Logger logger = LoggerFactory.getLogger(getClass());

	
	@Autowired
	private ViewDao viewDao;
	
	@Autowired
	private ViewService viewService;
	
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
	

	
	@Test
	public void testsessionstore(){
		logger.info("로그인 체크 테스트 입니다.");

		//given
	    Map<String, Object> userList = new HashMap<String, Object>();
	    userList.put("id", "test");
	    userList.put("pw", "123");
	    userList.put("role", "1");
	    
		//when
	    HashMap<String, String> sessionMap = (HashMap<String, String>)viewService.getOneRole(userList);
	    
	    //than
	    assertThat(sessionMap, is(notNullValue()));
		assertThat((String)sessionMap.get("MEMBER_ID"), is("test"));
		assertThat((String)sessionMap.get("MEMBER_PW"), is("123"));
	    
	}
	
	@Test
	public void testInvaliedLogin() {

		// given 
		Map<String, Object> userList = new HashMap<String, Object>();
		userList.put("id", "test");
		userList.put("pw", "1234");
		userList.put("role", "1");
		
		//when
		HashMap<String, String> sessionMap = (HashMap<String, String>)viewService.getOneRole(userList);
		
		//than
		assertThat(sessionMap, is(nullValue()));
	}
	
}