package com.bgg.farmstoryback.service;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class DispalyServiceTest {
	
	
	@Autowired
	DispalyService displayService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Test
	public void testCreate() {

		// given
		String displayNm = "1-2세 추천";
		Map displayInfo = new HashMap();
		displayInfo.put("display_type", "1-2");
		displayInfo.put("display_nm", "1-2세 추천");
		
		// when
		String displayId = displayService.create(displayInfo);

		// then
		Map detailInfo = displayService.detail(displayId);
		assertThat(detailInfo, is(notNullValue()));
		assertThat((String)detailInfo.get("DISPLAY_NM"), is(displayNm));
		
	}


}
