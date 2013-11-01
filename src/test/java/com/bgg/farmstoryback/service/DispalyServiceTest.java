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

import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.common.ConstantsForResponse;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class DispalyServiceTest {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	private String testDisplayId = null;
	private Map requestParamMap = null;
	
	@Autowired
	DisplayService displayService;

	@Before
	public void setUp() throws Exception {
		testDisplayId = "1";
		requestParamMap = new HashMap();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testList() {
		
		// given 

		// when
		Map displayInfo = displayService.listInfo();
		List<Map> topDisplay = (List<Map>)displayInfo.get(ConstantsForResponse.TOP_DISPLAY);
		List<Map> bannerDisplay = (List<Map>)displayInfo.get(ConstantsForResponse.BANNER_DISPLAY);
		
		// then
		assertThat(displayInfo, is(notNullValue()));
		assertThat(topDisplay, is(notNullValue()));
		assertThat(bannerDisplay, is(notNullValue()));
		assertThat(topDisplay.size(), is(not(0)));
		assertThat(bannerDisplay.size(), is(not(0)));

	}
	
	@Test
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testDetail() {
		
		// given 
		requestParamMap.put(ConstantsForParam.DISPLAY_ID, testDisplayId);

		// when
		Map displayDetail = displayService.detail(requestParamMap);

		// then
		assertThat(displayDetail, is(notNullValue()));

	}
	
	@Test
	public void testContentsDisplay() {
		
		// given 
		requestParamMap.put(ConstantsForParam.CATEGORY_ID, "32");

		// when
		List<Map> contentsList = displayService.contentsList(requestParamMap);

		// then
		assertThat(contentsList, is(notNullValue()));
		assertThat(contentsList.size(), is(not(0)));

	}
}
