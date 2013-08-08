package com.bgg.farmstoryback.dao;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bgg.farmstoryback.common.LogPrinter;
import com.bgg.farmstoryback.controller.UserController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CategoryDaoTest {
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	LogPrinter logPrinter;

	@After
	public void tearDown() throws Exception {
	}

	
	@Test
	public void testList() {

		// given 
//		#{cate_id},
//		#{cate_level},
//		#{cate_nm},
		Map<String, String> cateInfo = new HashMap<String, String>();
		cateInfo.put("cate_id", "C_"+UUID.randomUUID().toString().replace("-", ""));
		cateInfo.put("cate_level", "1");
		cateInfo.put("cate_nm", "test");
		categoryDao.create(cateInfo);

		// when
		List<Map> cateList = categoryDao.list();

		// then
		assertThat(cateList, is(notNullValue()));
		assertThat(cateList.size(), is(not(0)));
		
	}
	
	@Test
	public void testListByLevel() {

		// given 

		// when
		List<Map> cateList = categoryDao.listByLevel(1);
		List<Map> cate2List = categoryDao.listByLevel(2);

		// then
		logPrinter.printMapList(cateList);
		logPrinter.printMapList(cate2List);
		assertThat(cateList, is(notNullValue()));
		assertThat(cateList.size(), is(not(0)));
		assertThat((Integer)cateList.get(0).get("CATE_LEVEL"), is(1));
		assertThat(cate2List, is(notNullValue()));
		assertThat(cate2List.size(), is(not(0)));
		assertThat((Integer)cate2List.get(0).get("CATE_LEVEL"), is(2));
		
	}
	
	@Test
	public void testModify() {

		// given 
		Map<String, String> cateInfo = new HashMap<String, String>();
		cateInfo.put("cate_id", "C_954682af87414cca86c18a70754b5b58");
		cateInfo.put("cate_level", "1");
		cateInfo.put("cate_nm", "test_modify2");

		// when
		categoryDao.modify(cateInfo);

		// then
		Map<String, Object> cateDetail = categoryDao.detail(cateInfo);
		logPrinter.printMap(cateDetail);
		assertThat(cateDetail, is(notNullValue())	);
		assertThat((String)cateDetail.get("CATE_NM"), is("test_modify2"));
	}
}
