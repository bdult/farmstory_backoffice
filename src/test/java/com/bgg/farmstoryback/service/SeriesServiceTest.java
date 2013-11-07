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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bgg.farmstoryback.common.ConstantsForParam;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class SeriesServiceTest {

	
	@Autowired
	SeriesService seriesService;
	
	Map requestParam = null;
	
	@Before
	public void setUp() throws Exception {
		
		requestParam = new HashMap();
		
	}

	@After
	public void tearDown() throws Exception {
		
	}
	
	
	@Test
	public void testSeriesListByBrandId() {
		
		// given 
		int brandId = 137;
		requestParam.put(ConstantsForParam.BRAND_ID, brandId);

		// when
		List<Map> seriesList = seriesService.listByBrandId(requestParam);

		// then
		assertThat(seriesList, is(notNullValue()));
		assertThat(seriesList.size(), is(not(0)));

	}

//	@Test
//	public void testListll() {
//
//		// given 
//		
//		// when
//		List seriesList = seriesService.listAll(); 
//
//		// then
//		assertThat(seriesList, is(notNullValue()));
//		assertThat(seriesList.size(), is(not(0)));
//		
//	}
//	@Test
//	public void testCreate() {
//		
//		// given 
//		String seriesNm = "series_insert_test3";
//		seriesInfo.put(SERIES_NAME_TAG, seriesNm);
//		
//		// when
//		seriesService.create(seriesInfo);
//		
//		// then
//		Map seriesDetail = seriesService.detail(seriesInfo);
//		assertThat(seriesDetail, is(notNullValue()));
//		assertThat((String)seriesDetail.get(DB_SERIES_NAME_TAG), is(seriesNm));
//	}
//	
//	
//	@Test
//	public void testDelete() {
//
//		// given 
//		testCreate();
//
//		// when
//		seriesService.delete(seriesInfo);
//
//		// then
//		Map seriesDetail = seriesService.detail(seriesInfo);
//		assertThat(seriesDetail, is(nullValue()));
//		
//	}
//	
//	@Test
//	public void testModify() {
//
//		// given
//		testCreate();
//		String seriesName = "modify";
//		seriesInfo.put(SERIES_NAME_TAG, seriesName);
//
//		// when
//		seriesService.modify(seriesInfo);
//		
//		// then
//		Map seriesDetail = seriesService.detail(seriesInfo);
//		assertThat(seriesDetail, is(notNullValue()));
//		assertThat((String)seriesDetail.get(DB_SERIES_NAME_TAG), is(seriesName));
//
//		
//	}
//	
//	@Test
//	public void testTopList() {
//		
//		// given 
//		int limitCount = 9;
//
//		// when
//		List<Map> topList = seriesService.top(limitCount);
//
//		// then
//		assertThat(topList, is(notNullValue()));
//		assertTrue(topList.size() <= limitCount);
//	}
	
	
	
}
