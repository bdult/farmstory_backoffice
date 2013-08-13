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
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
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
	public void testgetOneRole(){
		logger.info("아이디, 권한 세션 테스트 입니다.");
		logger.info(viewDao.toString());
		
		MockHttpServletRequest request = new MockHttpServletRequest();
	    MockHttpSession session = new MockHttpSession();
	    
	    Map<String, Object> userList = new HashMap<String, Object>();
	    userList.put("id", "test");
	    userList.put("pw", "123");
	    userList.put("role", "1");

		HashMap<String, String> sessionMap = (HashMap<String, String>)viewService.getOneRole(userList);
	    session.setAttribute("login_session", sessionMap);
	    
		if(session == null || session.getAttribute("login_session") == null){
			logger.info("login.do");
		}else{
			logger.info("dashboard.do");
		}
	}
	
	@Test
	public void testlogOut(){
		logger.info("로그아웃 테스트 입니다.");
		logger.info(viewDao.toString());

		MockHttpServletRequest request = new MockHttpServletRequest();
	    MockHttpSession session = new MockHttpSession();
	    
	    Map<String, Object> userList = new HashMap<String, Object>();
	    userList.put("id", "test");
	    userList.put("pw", "123");
	    userList.put("role", "1");
	    
		HashMap<String, String> sessionMap = (HashMap<String, String>)viewService.getOneRole(userList);
	    session.setAttribute("login_session", sessionMap);
	    
		logger.info("세션 인" + session.getAttribute("login_session"));
		
		if(session != null){
			session.invalidate();
		}

		logger.info("세션 아웃" + session.getAttribute("login_session"));
		
	}
	
	
	
	
	
	
	
}