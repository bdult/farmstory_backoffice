package com.bgg.farmstoryback.service;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bgg.farmstoryback.common.LogPrinter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class ItemGroupServiceTest {

	@Autowired
	ItemGroupService groupService;

	@Autowired
	BrandService brandService;
	
	@Autowired
	LogPrinter printer;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Test
	public void testCreate() {

		// given 
		List<Map> brandList = brandService.list();
		if(brandList.size() == 0){
			Map brandInfo = new HashMap();
			brandInfo.put("brand_nm", "testForGroup");
			brandService.create(brandInfo);
			 brandList = brandService.list();
		}
		Map groupInfo = new HashMap();
		groupInfo.put("group_nm", "insert_group");
		groupInfo.put("brand_id", ""+brandList.get(0).get("BRAND_ID"));

		// when
		groupService.create(groupInfo);

		// then
		List<Map> groupList = groupService.list();
		Map groupDetail = groupService.detail(""+groupList.get(0).get("GROUP_ID"));
		assertThat(groupDetail, is(notNullValue()));
		
	}

	@Test
	public void testList() {

		// given 
		testCreate();
		
		// when
		List<Map> groupList = groupService.list();

		// then
		assertThat(groupList, is(not(nullValue())));
		assertThat(groupList.size(), is(not(0)));
		printer.printMapList(groupList);
		
	}
	
	@Test
	public void testListByBrandId() {

		// given 
		List<Map> brandList = brandService.list();
		if(brandList.size() == 0){
			Map brandInfo = new HashMap();
			brandInfo.put("brand_nm", "testForGroup");
			brandService.create(brandInfo);
			brandList = brandService.list();
		}
		String brandId = ""+brandList.get(0).get("BRAND_ID");
		
		// when
		List<Map> seriesList = groupService.listByBrandId(brandId);
		
		// then
		assertThat(seriesList, is(not(nullValue())));
		assertThat(seriesList.size(), is(not(0)));
		printer.printMapList(seriesList);
		
	}
	
	@Test
	public void testModify() {

		// given
		List<Map> groupList = groupService.list();
		if(groupList.size() == 0){
			testCreate();
			groupList = groupService.list();
		}
		Map groupInfo = new HashMap();
		groupInfo.put("group_id", groupList.get(0).get("GROUP_ID"));
		groupInfo.put("group_nm", "modify2");

		// when
		groupService.modify(groupInfo);

		// then
		Map seriesDetail = groupService.detail(""+groupList.get(0).get("GROUP_ID"));
		assertThat(seriesDetail, is(not(nullValue())));
		assertThat((String)seriesDetail.get("GROUP_NM"), is("modify2"));
		printer.printMap(seriesDetail);
	}
	
	@Test
	public void testDelete() {

		// given
		List<Map> groupList = groupService.list();
		if(groupList.size() == 0){
			testCreate();
			groupList = groupService.list();
		}
		
		// when
		groupService.delete(""+groupList.get(0).get("GROUP_ID"));

		// then
		Map seriesDetail = groupService.detail(""+groupList.get(0).get("GROUP_ID"));
		assertThat(seriesDetail, is(nullValue()));

		
	}

}
