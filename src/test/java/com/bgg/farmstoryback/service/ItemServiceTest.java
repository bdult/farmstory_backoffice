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
public class ItemServiceTest {
	
	@Autowired
	ItemService itemService;
	
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
		
//		GROUP_ID
//		ITEM_NM
//		SRC_PATH
		// given 
		Map groupInfo = new HashMap();
		List<Map> groupList = groupService.list();
		if(groupList.size() == 0){
			List<Map> brandList = brandService.list();
			if(brandList.size() == 0){
				Map groupCreateInfo = new HashMap();
				groupCreateInfo.put("brand_nm", "testForGroup");
				brandService.create(groupCreateInfo);
				brandList = brandService.list();
			}
			groupInfo.put("brand_id", ""+brandList.get(0).get("BRAND_ID"));
			groupInfo.put("group_nm", "insert_group");
			groupService.create(groupInfo);
		}
		
		Map itemCreateInfo = new HashMap();
		itemCreateInfo.put("item_nm", "create_contents");
		itemCreateInfo.put("group_id", ""+groupList.get(0).get("GROUP_ID"));

		// when
		itemService.createItem(itemCreateInfo);
		
		// then
		Map itemDetailInfo = itemService.detail(""+itemCreateInfo.get("item_id"));
		assertThat(itemDetailInfo, is(notNullValue()));
		assertThat((String)itemDetailInfo.get("ITEM_NM"), is("create_contents"));
		
	}
	
	@Test
	public void testModify() {

		// given 
		Map groupInfo = new HashMap();
		List<Map> itemList = itemService.list();
		if(itemList.size() == 0){
			testCreate();
			itemList = itemService.list();
		}
		
		Map itemModInfo = new HashMap();
		itemModInfo.put("item_id", ""+itemList.get(0).get("ITEM_ID"));
		itemModInfo.put("item_nm", "mod_item");
		itemModInfo.put("group_id", ""+itemList.get(0).get("GROUP_ID"));

		// when
		itemService.modify(itemModInfo);

		// then
		Map itemDetailInfo = itemService.detail(""+""+itemList.get(0).get("ITEM_ID"));
		assertThat(itemDetailInfo, is(notNullValue()));
		assertThat((String)itemDetailInfo.get("ITEM_NM"), is("mod_item"));
		assertThat((String)itemDetailInfo.get("SRC_PATH"), is(notNullValue()));

		
	}
	
	@Test
	public void testList() {

		// given 

		// when
		List<Map> contentsList = itemService.list();
		if(contentsList.size() == 0){
			testCreate();
		}
		contentsList = itemService.list();

		// then
		assertThat(contentsList, is(notNullValue()));
		assertThat(contentsList.size(), is(not(0)));
		printer.printMapList(contentsList);
	}
	
	@Test
	public void testListByGroupId() {

		// given 

		// when
		List<Map> contentsList = itemService.list();
		if(contentsList.size() == 0){
			testCreate();
		}
		contentsList = itemService.listByGroupId(""+contentsList.get(0).get("GROUP_ID"));

		// then
		assertThat(contentsList, is(notNullValue()));
		assertThat(contentsList.size(), is(not(0)));
		printer.printMapList(contentsList);

		
	}
	
	
	@Test
	public void testDetail() {

		// given 
		List<Map> contentsList = itemService.list();
		if(contentsList.size() == 0){
			testCreate();
		}
		contentsList = itemService.list();
		

		// when
		Map itemDetailInfo = itemService.detail(""+contentsList.get(0).get("ITEM_ID"));

		// then
		assertThat(itemDetailInfo, is(notNullValue()));
		assertThat((String)itemDetailInfo.get("ITEM_NM"), is((String)contentsList.get(0).get("ITEM_NM")));
	}
	
	@Test
	public void testDelete() {

		// given 
		List<Map> contentsList = itemService.list();
		if(contentsList.size() == 0){
			testCreate();
		}
		contentsList = itemService.list();

		// when
		itemService.delete(""+contentsList.get(0).get("ITEM_ID"));

		// then
		Map itemDetailInfo = itemService.detail(""+contentsList.get(0).get("ITEM_ID"));
		assertThat(itemDetailInfo, is(nullValue()));
	}
	
	@Test
	public void testDeleteByGroupId() {
		
		// given 
		List<Map> contentsList = itemService.list();
		if(contentsList.size() == 0){
			testCreate();
		}
		contentsList = itemService.list();
		
		// when
		itemService.deleteByGroupId(""+contentsList.get(0).get("GROUP_ID"));
		
		// then
		List<Map> itemGroupList = itemService.listByGroupId(""+contentsList.get(0).get("GROUP_ID"));
		assertThat(itemGroupList.size(), is(0));
	}
	
	
	
}
