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


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CategoryServiceTest {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CategoryService cateService;
	

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testList() {

		// given 
		testCreate();

		// when
		List<Map> cateList = cateService.list();

		// then
		assertThat(cateList, is(notNullValue()));
		assertThat(cateList.size(), is(not(0)));
		logger.info("parameter=", cateList);
	}
	
	@Test
	public void testCreate() {

		// given 
		Map<String, String> cateInfo = new HashMap<String, String>();
		cateInfo.put("cate_level", "1");
		cateInfo.put("cate_nm", "한글");
		cateInfo.put("parent_cate_id", "0");
		
		// when
		String cateId = cateService.create(cateInfo);

		// then
		Map detailInfo =cateService.detail(cateId);
		assertThat(detailInfo, is(notNullValue()));
		logger.info("detail=", detailInfo);
		
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
		List<Map> cateList = cateService.list();
		if(cateList.size() == 0){
			testCreate();
			cateList = cateService.list();
		}
		Map<String, String> cateInfo = new HashMap<String, String>();
		cateInfo.put("cate_id", ""+cateList.get(0).get("CATE_ID"));
		cateInfo.put("cate_nm", "수학");
		
		// when
		cateService.modify(cateInfo);

		// then
		Map detailInfo =cateService.detail(""+cateList.get(0).get("CATE_ID"));
		assertThat(detailInfo, is(notNullValue()));
		assertThat((String)detailInfo.get("CATE_NM"), is("수학"));
		logger.info("detail=", detailInfo);
		
	}
	
	@Test
	public void testDeleteCate() {

		// given 
				List<Map> cateList = cateService.list();
				if(cateList.size() == 0){
					testCreate();
					cateList = cateService.list();
				}

		// when
		cateService.delete(""+cateList.get(0).get("CATE_ID"));

		// then
		Map detailInfo =cateService.detail(""+cateList.get(0).get("CATE_ID"));
		assertThat(detailInfo, is(nullValue()));
	}

	
	@Test
	public void testTopList() {
		
		// given 
		int limitCount = 7;

		// when
		List<Map> topList = cateService.top(limitCount);

		// then
		assertThat(topList, is(notNullValue()));
		assertTrue(topList.size() <= limitCount);

	}
}
