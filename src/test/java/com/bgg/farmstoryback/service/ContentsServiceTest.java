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

import com.bgg.farmstoryback.common.ConstantsForDb;
import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.common.ConstantsForResponse;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class ContentsServiceTest {
	
	@Autowired
	ContentsService contentsService;
	String testJoinStartDate = "20130926";
	String testJoinEndDate = "20130926";
	
	private Map requestParamMap=null;
	

	@Before
	public void setUp() throws Exception {
		requestParamMap = new HashMap();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testTopList() {
		
		// given 
		int limitCount = 6;

		// when
		List<Map> topList = contentsService.top(limitCount); 

		// then
		assertThat(topList, is(notNullValue()));
		assertTrue(topList.size() <= limitCount);

	}
	
	@Test
	public void testList() {
		
		// given 
		setDefaultPageParam();

		// when
		List<Map> contentsList = contentsService.list(requestParamMap);

		assertContentList(contentsList);

	}
	
	@Test
	public void testUnDisplayList() {
		
		setDefaultPageParam();
		requestParamMap.put(ConstantsForParam.DISPLAY_YN, "N");

		// when
		List<Map> contentsList = contentsService.list(requestParamMap);

		// then
		for(Map contentsInfo : contentsList){
			assertThat((String)contentsInfo.get(ConstantsForDb.DISPLAY_YN), is("N"));
		}

	}
	
	@Test
	public void testSearchListByContentsName() {
		
		// given 
		String testContentsName = "What";
		setDefaultPageParam();
		requestParamMap.put(ConstantsForParam.SEARCH, testContentsName);
		requestParamMap.put(ConstantsForParam.SEARCH_TYPE, "name");
		

		// when
		List<Map> contentsList = contentsService.list(requestParamMap);
		
		assertContentList(contentsList);
		for(Map contentsInfo : contentsList){
			String contentsName = (String)contentsInfo.get(ConstantsForDb.CONTENTS_NM);
			assertTrue(contentsName.contains(testContentsName));
			
		}
	}
	
//	@Test
//	public void testSearchListByContentsId() {
//		
//		// given 
//		int testContentsId = 699;
//		setDefaultPageParam();
//		requestParamMap.put(ConstantsForParam.SEARCH, testContentsId);
//		requestParamMap.put(ConstantsForParam.SEARCH_TYPE, "id");
//		
//		
//		// when
//		List<Map> contentsList = contentsService.list(requestParamMap);
//		
//		assertContentList(contentsList);
//		for(Map contentsInfo : contentsList){
//			int contentsId= (Integer)contentsInfo.get(ConstantsForDb.CONTENTS_ID);
//			assertTrue(contentsId == testContentsId);
//			
//		}
//	}
	
	@Test
	public void testSearchListByCategory() {
		// given 
		long testCategoryId = 32;
		setDefaultPageParam();
		requestParamMap.put(ConstantsForParam.CATEGORY_ID, testCategoryId);
		
		
		// when
		List<Map> contentsList = contentsService.list(requestParamMap);
		
		assertContentList(contentsList);
		for(Map contentsInfo : contentsList){
			long contentsId= (Long)contentsInfo.get(ConstantsForDb.CATEGORY_ID);
			assertTrue(contentsId == testCategoryId);
		}

	}
	
	@Test
	public void testSearchListByBrand() {
		// given 
		long testBrandID = 143;
		setDefaultPageParam();
		requestParamMap.put(ConstantsForParam.BRAND_ID, testBrandID);
		
		
		// when
		List<Map> contentsList = contentsService.list(requestParamMap);
		
		assertContentList(contentsList);
		for(Map contentsInfo : contentsList){
			long brandId= (Long)contentsInfo.get(ConstantsForDb.BRAND_ID);
			assertTrue(brandId == testBrandID);
		}
		
	}
	
	@Test
	public void testSearchListBySeries() {
		// given 
		long testSeries = 33;
		setDefaultPageParam();
		requestParamMap.put(ConstantsForParam.SERIES_ID, testSeries);
		
		// when
		List<Map> contentsList = contentsService.list(requestParamMap);
		
		// then
		assertContentList(contentsList);
		for(Map contentsInfo : contentsList){
			long seriesId= (Long)contentsInfo.get(ConstantsForDb.SERIES_ID);
			assertTrue(seriesId == testSeries);
		}
		
	}
	
	@Test
	public void testSearchListByRegDt() {
		// given 
		setDefaultPageParam();
		requestParamMap.put(ConstantsForParam.SEARCH_START_DT, testJoinStartDate);
		requestParamMap.put(ConstantsForParam.SEARCH_END_DT, testJoinEndDate);
		
		// when
		List<Map> contentsList = contentsService.list(requestParamMap);
		
		// then
		assertContentList(contentsList);
		for(Map contentsInfo : contentsList){
			String memberRegDt =(String)contentsInfo.get(ConstantsForDb.REG_DT);
			if(memberRegDt.replaceAll("-", "").contains(testJoinStartDate)
					|| memberRegDt.replaceAll("-", "").contains(testJoinEndDate)){
				assertTrue(true);
			}else{
				assertTrue(false);
			}
		}
		
	}
	
	@Test
	public void testSearchListByDisplayYn() {
		
		// given 
		setDefaultPageParam();
		String testDisplayYn = "Y";
		requestParamMap.put(ConstantsForParam.DISPLAY_YN, testDisplayYn);
		

		// when
		List<Map> contentsList = contentsService.list(requestParamMap);

		// then
		assertContentList(contentsList);
		for(Map contentsInfo : contentsList){
				assertTrue(contentsInfo.get(ConstantsForDb.DISPLAY_YN).equals(testDisplayYn));
		}

	}

	private void assertContentList(List<Map> contentsList) {
		assertThat(contentsList, is(notNullValue()));
		assertThat(contentsList.size(), is(not(0)));
	}
	
	
	

	private void setDefaultPageParam() {
		requestParamMap.put(ConstantsForParam.PAGE_PER_PAGE, 10);
		requestParamMap.put(ConstantsForParam.PAGE_START_NO, 1);
	}
	
	
}
