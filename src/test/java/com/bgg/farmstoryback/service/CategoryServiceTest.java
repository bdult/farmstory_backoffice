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
public class CategoryServiceTest {
	
	@Autowired
	CategoryService cateService;
	
	@Autowired
	LogPrinter logPrinter;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testList() {

		// given 
		Map<String, String> cateInfo = new HashMap<String, String>();
		cateInfo.put("cate_level", "1");
		cateInfo.put("cate_nm", "한글");
		cateInfo.put("parent_cate_id", "0");
		cateService.create(cateInfo);

		// when
		List<Map> cateList = cateService.list();

		// then
		assertThat(cateList, is(notNullValue()));
		assertThat(cateList.size(), is(not(0)));
		logPrinter.printMapList(cateList);
	}
	
	@Test
	public void testCreate() {

		// given 
		Map<String, String> cateInfo = new HashMap<String, String>();
		cateInfo.put("cate_level", "1");
		cateInfo.put("cate_nm", "한글");
		cateInfo.put("parent_cate_id", "0");
		
		// when
		cateService.create(cateInfo);

		// then
		Map detailInfo =cateService.detail(cateInfo);
		assertThat(detailInfo, is(notNullValue()));
		logPrinter.printMap(detailInfo);
		
	}
	
	@Test
	public void testListByLevel() {

		// given 
		Map<String, String> cateInfo = new HashMap<String, String>();
		cateInfo.put("cate_level", "1");
		cateInfo.put("cate_nm", "영어");
		cateInfo.put("parent_cate_id", "0");
		cateService.create(cateInfo);

		// when
		List<Map> cateList = cateService.listByLevel(1);
		
		// then
		assertThat(cateList, is(notNullValue()));
		assertThat(cateList.size(), is(not(0)));
	}
	
	@Test
	public void testModCate() {

		// given 
		Map<String, String> cateInfo = new HashMap<String, String>();
		cateInfo.put("cate_id", "1");
		cateInfo.put("cate_nm", "수학");
		
		// when
		cateService.modify(cateInfo);

		// then
		Map detailInfo =cateService.detail(cateInfo);
		assertThat(detailInfo, is(notNullValue()));
		assertThat((String)detailInfo.get("CATE_NM"), is("수학"));
		logPrinter.printMap(detailInfo);
		
	}
	
	@Test
	public void testDeleteCate() {

		// given 
		Map<String, String> cateInfo = new HashMap<String, String>();
		cateInfo.put("cate_id", "1");

		// when
		cateService.delete(1);

		// then
		Map detailInfo =cateService.detail(cateInfo);
		assertThat(detailInfo, is(nullValue()));
		List<Map> cateList = cateService.list();
		for(Map checkInfo : cateList){
			assertThat((Long)checkInfo.get("CATE_ID"), is(not(1L)));
		}
	}

}
