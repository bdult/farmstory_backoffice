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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class DispalyServiceTest {
	
	
	@Autowired
	DispalyService displayService;
	
	@Autowired
	ItemGroupService itemGroupService;

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
		displayInfo.put("display_nm", displayNm);
		
		// when
		String displayId = displayService.create(displayInfo);

		// then
		Map detailInfo = displayService.detail(displayId);
		assertThat(detailInfo, is(notNullValue()));
		assertThat((String)detailInfo.get("DISPLAY_NM"), is(displayNm));
		
	}
	
	@Test
	public void testList() {

		// given
		testCreate();

		// when
		List<Map> displayList = displayService.list();

		// then
		assertThat(displayList.size(), is(not(0)));
	}
	
	@Test
	public void testDetail() {

		// given 
		List<Map> displayList = displayService.list();
		if(displayList.size() == 0){
			testCreate();
			displayList = displayService.list();
		}

		// when
		Map detailInfo = displayService.detail(""+displayList.get(0).get("DISPLAY_ID"));

		// then
		assertThat(detailInfo, is(notNullValue()));
		
	}
	
	@Test
	public void testDelete() {

		// given 
		List<Map> displayList = displayService.list();
		if(displayList.size() == 0){
			testCreate();
			displayList = displayService.list();
		}

		// when
		displayService.delete(""+displayList.get(0).get("DISPLAY_ID"));
		
		// then
		Map detailInfo = displayService.detail(""+displayList.get(0).get("DISPLAY_ID"));
		assertThat(detailInfo, is(nullValue()));
	}
	
	@Test
	public void testModify() {

		// given 
		List<Map> displayList = displayService.list();
		if(displayList.size() == 0){
			testCreate();
			displayList = displayService.list();
		}
		String displayNm = "3-4세 추천";
		Map displayInfo = new HashMap();
		displayInfo.put("display_id", displayList.get(0).get("DISPLAY_ID"));
		displayInfo.put("display_type", "3-4");
		displayInfo.put("display_nm", displayNm);

		// when
		displayService.modify(displayInfo);

		// then
		Map detailInfo = displayService.detail(""+displayList.get(0).get("DISPLAY_ID"));
		assertThat(detailInfo, is(notNullValue()));
		assertThat((String)detailInfo.get("DISPLAY_NM"), is(displayNm));
		
	}
	
	@Test
	public void testCreateDisplayItemGroup() {

		// given
		List<Map> itemGroupList = itemGroupService.list();
		List<Map> displayList = displayService.list();
		Map groupDisplayInfo = new HashMap();
		groupDisplayInfo.put("object_id",  itemGroupList.get(0).get("GROUP_ID"));
		groupDisplayInfo.put("display_id",  displayList.get(0).get("DISPLAY_ID"));
		groupDisplayInfo.put("object_type", "group");

		// when
		displayService.createObjectDisplay(groupDisplayInfo);

		// then
		Map detailInfo = displayService.detailObjectDisplay(groupDisplayInfo);
		assertThat(detailInfo, is(notNullValue()));
		assertThat(detailInfo.get("OBJECT_ID"), is(itemGroupList.get(0).get("GROUP_ID")));
		assertThat(detailInfo.get("DISPLAY_ID"), is(displayList.get(0).get("DISPLAY_ID")));
	}
	
	@Test
	public void testListDisplayItemGroup() {

		// given 
		List<Map> displayList = displayService.list();

		// when
		List<Map> displayItemGroupList = displayService.listDisplayItemGroupByDisplayId(""+displayList.get(0).get("DISPLAY_ID"));

		// then
		assertThat(displayItemGroupList.size(), is(not(0)));
		
	}


}
