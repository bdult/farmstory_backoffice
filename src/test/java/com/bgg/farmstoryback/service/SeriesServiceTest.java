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


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class SeriesServiceTest {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final String SERIES_NAME_TAG="series_nm";
	private static final String DB_SERIES_NAME_TAG="CONTENTS_SERIES_NM";
	
	@Autowired
	SeriesService seriesService;
	
	Map seriesInfo = null;
	
	@Before
	public void setUp() throws Exception {
		
		seriesInfo = new HashMap();
		
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testList() {

		// given 
		testCreate();
		
		// when
		List seriesList = seriesService.list(null); 

		// then
		assertThat(seriesList, is(notNullValue()));
		assertThat(seriesList.size(), is(not(0)));
		
	}
	
	@Test
	public void testCreate() {
		
		// given 
		String seriesNm = "series_insert_test3";
		seriesInfo.put(SERIES_NAME_TAG, seriesNm);
		
		// when
		seriesService.create(seriesInfo);
		
		// then
		Map seriesDetail = seriesService.detail(seriesInfo);
		assertThat(seriesDetail, is(notNullValue()));
		assertThat((String)seriesDetail.get(DB_SERIES_NAME_TAG), is(seriesNm));
	}
	
	
	@Test
	public void testDelete() {

		// given 
		testCreate();

		// when
		seriesService.delete(seriesInfo);

		// then
		Map seriesDetail = seriesService.detail(seriesInfo);
		assertThat(seriesDetail, is(nullValue()));
		
	}
	
	@Test
	public void testModify() {

		// given
		testCreate();
		String seriesName = "modify";
		seriesInfo.put(SERIES_NAME_TAG, seriesName);

		// when
		seriesService.modify(seriesInfo);
		
		// then
		Map seriesDetail = seriesService.detail(seriesInfo);
		assertThat(seriesDetail, is(notNullValue()));
		assertThat((String)seriesDetail.get(DB_SERIES_NAME_TAG), is(seriesName));

		
	}
	
	
	
}
