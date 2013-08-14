package com.bgg.farmstoryback.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.CoreMatchers.nullValue;
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
		MockHttpServletRequest request = new MockHttpServletRequest();
	    MockHttpSession session = new MockHttpSession();
	    request.setMethod("GET");
	    request.addParameter("id", "test");
	    request.addParameter("pw", "123");
	    request.addParameter("role", "1");


	    Map<String, Object> userList = new HashMap<String, Object>();
	    userList.put("id", "test");
	    userList.put("pw", "123");
	    userList.put("role", "1");
	    
		HashMap<String, String> sessionMap = (HashMap<String, String>)viewService.getOneRole(userList);
		String id = ( (String) sessionMap.get("MEMBER_ID") );
		String pw = ( (String) sessionMap.get("MEMBER_PW") );

		
		//when
	    if(request.getParameter("id").equals(id) && request.getParameter("pw").equals(pw)){
		    session.setAttribute("login_session", sessionMap);
			logger.info("login.do");
		}else{
			logger.info("dashboard.do");
		}
	    
	    //than
		assertThat((String)sessionMap.get("MEMBER_ID"), is("test"));
		assertThat((String)sessionMap.get("MEMBER_PW"), is("123"));
	    
	}
	
	@Test
	public void testlogOut(){
		logger.info("로그아웃 테스트 입니다.");


		//given
		MockHttpServletRequest request = new MockHttpServletRequest();
	    MockHttpSession session = new MockHttpSession();
	    
	    Map<String, Object> userList = new HashMap<String, Object>();
	    userList.put("id", "test");
	    userList.put("pw", "123");
	    userList.put("role", "1");
	    
		HashMap<String, String> sessionMap = (HashMap<String, String>)viewService.getOneRole(userList);
	    session.setAttribute("login_session", sessionMap);
	    
		//when
		if(session != null){
			session.setAttribute("login_session", null);
		}

	    //than
		assertThat(session.getAttribute("login_session"), is(nullValue()));
		
	}
	
}