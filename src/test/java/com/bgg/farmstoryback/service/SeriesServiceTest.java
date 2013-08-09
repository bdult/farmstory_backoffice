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
public class SeriesServiceTest {

	@Autowired
	SeriesService seriesService;
	
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
		Map seriesInfo = new HashMap();
		seriesInfo.put("brand_id", "c6c15a3a0d60481e940efa7b50dad739");
		seriesInfo.put("cate_id", "C_954682af87414cca86c18a70754b5b46");
		seriesInfo.put("series_nm", "insert_series2");
		seriesService.create(seriesInfo);

		// when
		List<Map> seriesList = seriesService.list();

		// then
		assertThat(seriesList, is(not(nullValue())));
		assertThat(seriesList.size(), is(not(0)));
		printer.printMapList(seriesList);
		
	}
	
	@Test
	public void testListByCateID() {

		// given 
		String cateId = "C_954682af87414cca86c18a70754b5b46";
		
		// when
		List<Map> seriesList = seriesService.listByCateId(cateId);

		// then
		assertThat(seriesList, is(not(nullValue())));
		assertThat(seriesList.size(), is(not(0)));
		printer.printMapList(seriesList);
		
	}
	
	@Test
	public void testListByBrandId() {

		// given 
		String brandId = "cb51ca4ab4da4ac5bf00cac3a91276cc";
		
		// when
		List<Map> seriesList = seriesService.listByBrandId(brandId);
		
		// then
		assertThat(seriesList, is(not(nullValue())));
		assertThat(seriesList.size(), is(not(0)));
		printer.printMapList(seriesList);
		
	}
	
	@Test
	public void testModify() {

		// given 
		Map seriesInfo = new HashMap();
		seriesInfo.put("series_idx", "1");
		seriesInfo.put("series_nm", "modify2");
		seriesInfo.put("brand_id", "c6c15a3a0d60481e940efa7b50dad739");

		// when
		seriesService.modify(seriesInfo);

		// then
		
		Map seriesDetail = seriesService.detail(1);
		assertThat(seriesDetail, is(not(nullValue())));
		assertThat((String)seriesDetail.get("SERIES_NM"), is("modify2"));
		assertThat((String)seriesDetail.get("BRAND_ID"), is("c6c15a3a0d60481e940efa7b50dad739"));
		printer.printMap(seriesDetail);
	}
	
	@Test
	public void testDelete() {

		// given 
		Map seriesInfo = new HashMap();
		seriesInfo.put("series_idx", "1");

		// when
		seriesService.delete(seriesInfo);

		// then
		Map seriesDetail = seriesService.detail(1);
		assertThat(seriesDetail, is(nullValue()));

		
	}

}
