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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bgg.farmstoryback.common.LogPrinter;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class ContentsServiceTest {
	
	@Autowired
	ContentsService contentsService;
	
	@Autowired
	LogPrinter printer;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
		
	}
	
	@Test
	public void testList() {

		// given 
		Map contentsInfo = new HashMap();
		contentsInfo.put("item_nm", "create_contents");
		contentsInfo.put("brand_id", "cb51ca4ab4da4ac5bf00cac3a91276cc");
		contentsService.createItem(contentsInfo);

		// when
		List<Map> contentsList = contentsService.list();

		// then
		assertThat(contentsList, is(notNullValue()));
		assertThat(contentsList.size(), is(not(0)));
		
		printer.printMapList(contentsList);
		
	}
	
}
