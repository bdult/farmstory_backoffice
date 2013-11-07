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

import com.bgg.farmstoryback.common.ConstantsForDb;
import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.common.ConstantsForResponse;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class DispalyServiceTest {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	private String testDisplayId = null;
	private Map requestParamMap = null;
	
	@Autowired
	DisplayService displayService;

	@Before
	public void setUp() throws Exception {
		testDisplayId = "1";
		requestParamMap = new HashMap();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testList() {
		
		// given 

		// when
		Map displayInfo = displayService.listInfo();
		List<Map> topDisplay = (List<Map>)displayInfo.get(ConstantsForResponse.TOP_DISPLAY);
		List<Map> bannerDisplay = (List<Map>)displayInfo.get(ConstantsForResponse.BANNER_DISPLAY);
		
		// then
		assertThat(displayInfo, is(notNullValue()));
		assertThat(topDisplay, is(notNullValue()));
		assertThat(bannerDisplay, is(notNullValue()));
		assertThat(topDisplay.size(), is(not(0)));
		assertThat(bannerDisplay.size(), is(not(0)));

	}
	
	@Test
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testDetail() {
		
		// given 
		requestParamMap.put(ConstantsForParam.DISPLAY_ID, testDisplayId);

		// when
		Map displayDetail = displayService.detail(requestParamMap);

		// then
		assertThat(displayDetail, is(notNullValue()));

	}
	
	@Test
	public void testContentsDisplay() {
		
		// given 
		requestParamMap.put(ConstantsForParam.CATEGORY_ID, "32");

		// when
		List<Map> contentsList = displayService.contentsList(requestParamMap);

		// then
		assertThat(contentsList, is(notNullValue()));
		assertThat(contentsList.size(), is(not(0)));

	}
	
	@Test
	public void testPopupList() {
		
		// given 
		

		// when
		List<Map> popupList = displayService.popupList();

		// then
		assertThat(popupList, is(notNullValue()));
		assertThat(popupList.size(), is(not(0)));

	}
	
	@Test
	public void testPopupDetail() {
		
		// given 
		String testPopupId = "3";
		requestParamMap.put(ConstantsForParam.POPUP_ID, testPopupId);

		// when
		Map popupDisplayDetail = displayService.popupDetail(requestParamMap);

		// then
		assertThat(popupDisplayDetail, is(notNullValue()));

	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testModifyContentsOrdering() {
		
		// given
		String testOrdering  = "1";
		requestParamMap.put(ConstantsForParam.CATEGORY_ID, "32");
		List<Map> contentsList = displayService.contentsList(requestParamMap);
		Map contentsInfo = contentsList.get(0);
		requestParamMap.put(ConstantsForParam.CONTENTS_ID, contentsInfo.get(ConstantsForDb.CONTENTS_ID));
		requestParamMap.put(ConstantsForParam.ORDERING_NO, testOrdering);
		
		// when
		displayService.modifyContentsOrderingNo(requestParamMap);
		

		// then
		List<Map> moddifyContentsList = displayService.contentsList(requestParamMap);
		Map modidfyContentsInfo = moddifyContentsList.get(0);
		assertThat(modidfyContentsInfo, is(notNullValue()));
		assertThat(String.valueOf(modidfyContentsInfo.get(ConstantsForDb.ORDERING_NO)), is(testOrdering));

	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testModifyTopDisplay() {
		
		// given 
		Map displayInfo = displayService.listInfo();
		List<Map> topDisplay = (List<Map>)displayInfo.get(ConstantsForResponse.TOP_DISPLAY);
		Map topInfo = topDisplay.get(0);
		
		String modifyTopDisTitle = "modifyTitle";
		String modifyTopDisImgPath = "temp/temp.gif";
		String modifyTopDisLinkUrl = "modifyUrl.com";
		String modifyTopDisYn = "N";
		requestParamMap.put(ConstantsForParam.DISPLAY_ID, topInfo.get(ConstantsForDb.DISPLAY_ID));
		requestParamMap.put(ConstantsForParam.TITLE, modifyTopDisTitle);
		requestParamMap.put(ConstantsForParam.IMG_PATH, modifyTopDisImgPath);
		requestParamMap.put(ConstantsForParam.DISPLAY_LINK_URL, modifyTopDisLinkUrl);
		requestParamMap.put(ConstantsForParam.DISPLAY_YN, modifyTopDisYn);
		
		// when
		displayService.modify(requestParamMap);

		// then
		Map modifyDisplayInfo = displayService.listInfo();
		List<Map> modifyTopDisplay = (List<Map>)modifyDisplayInfo.get(ConstantsForResponse.TOP_DISPLAY);
		Map modifyTopInfo = modifyTopDisplay.get(0);
		
		assertThat(modifyTopInfo, is(notNullValue()));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.TITLE), is(modifyTopDisTitle));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.IMG_PATH), is(modifyTopDisImgPath));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.LINK_URL), is(modifyTopDisLinkUrl));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.DISPLAY_YN), is(modifyTopDisYn));
	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void testInsertTopDisplay() {
		
		// given 
		String addTopDisTitle = "addTitle";
		String addTopDisImgPath = "addTemp/addTemp.gif";
		String addTopDisLinkUrl = "addUrl.com";
		String addTopDisYn = "N";
		String addDisType = "DIS001"; // 상단 비주얼 코드
		requestParamMap.put(ConstantsForParam.TITLE, 			addTopDisTitle);
		requestParamMap.put(ConstantsForParam.IMG_PATH, 		addTopDisImgPath);
		//requestParamMap.put(ConstantsForParam.DISPLAY_LINK_URL, addTopDisLinkUrl);
		//requestParamMap.put(ConstantsForParam.DISPLAY_YN, 		addTopDisYn);
		requestParamMap.put(ConstantsForParam.DISPLAY_CODE, 	addDisType);
		
		// when
		displayService.add(requestParamMap);
		
		// then
		Map modifyDisplayInfo = displayService.listInfo();
		List<Map> modifyTopDisplay = (List<Map>)modifyDisplayInfo.get(ConstantsForResponse.TOP_DISPLAY);
		Map modifyTopInfo = modifyTopDisplay.get(0);
		
		assertThat(modifyTopInfo, is(notNullValue()));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.TITLE), 		is(addTopDisTitle));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.IMG_PATH), 		is(addTopDisImgPath));
//		assertThat((String)modifyTopInfo.get(ConstantsForDb.LINK_URL), 		is(addTopDisLinkUrl));
//		assertThat((String)modifyTopInfo.get(ConstantsForDb.DISPLAY_YN), 	is(addTopDisYn));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.DISPLAY_CODE), 	is(addDisType));
		
	}
	
	@Test
	public void testDeleteDisplay() {
		// given 
		Map displayInfo = displayService.listInfo();
		List<Map> topDisplay = (List<Map>)displayInfo.get(ConstantsForResponse.TOP_DISPLAY);
		Map topInfo = topDisplay.get(0);
		requestParamMap.put(ConstantsForParam.DISPLAY_ID, topInfo.get(ConstantsForDb.DISPLAY_ID));
		// when
		displayService.delete(requestParamMap);

		// then
		Map detailInfo = displayService.detail(requestParamMap);
		assertThat(detailInfo, is(nullValue()));
	}
	
	
	@Test
	public void testInsertPopup() {
		
		// given 
		List<Map> popupDisplay = displayService.popupList();
		Map popupInfo = popupDisplay.get(0);
		requestParamMap.put(ConstantsForParam.DISPLAY_ID, popupInfo.get(ConstantsForDb.DISPLAY_ID));
		
		String addPopupDisTitle = "addPopupTitle";
		String addPopupDisImgPath = "addPopupTemp/addTemp.gif";
		String addPopupDisLinkUrl = "addPopupUrl.com";
		String addPopupDisYn = "N";
		String addDisType = "DIS003"; // 팝업 코드
		requestParamMap.put(ConstantsForParam.TITLE, 			addPopupDisTitle);
		requestParamMap.put(ConstantsForParam.IMG_PATH, 		addPopupDisImgPath);
		requestParamMap.put(ConstantsForParam.DISPLAY_LINK_URL, addPopupDisLinkUrl);
		requestParamMap.put(ConstantsForParam.DISPLAY_YN, 		addPopupDisYn);
		requestParamMap.put(ConstantsForParam.DISPLAY_CODE, 	addDisType);

		// when
		displayService.add(requestParamMap);

		// then
		List<Map> modifyTopDisplay = displayService.popupList();
		Map modifyTopInfo = modifyTopDisplay.get(0);
		assertThat((String)modifyTopInfo.get(ConstantsForDb.TITLE), 		is(addPopupDisTitle));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.IMG_PATH), 		is(addPopupDisImgPath));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.LINK_URL), 		is(addPopupDisLinkUrl));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.DISPLAY_YN), 	is(addPopupDisYn));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.DISPLAY_CODE), 	is(addDisType));

	}
	
	@Test
	public void testModifyPopup() {
		
		// given 
		List<Map> popupDisplay = displayService.popupList();
		Map popupInfo = popupDisplay.get(0);
		requestParamMap.put(ConstantsForParam.DISPLAY_ID, popupInfo.get(ConstantsForDb.DISPLAY_ID));
		
		String modifyPopupDisTitle = "modifyPopupTitle";
		String modifyPopupDisImgPath = "modifyPopupTemp/addTemp.gif";
		String modifyPopupDisLinkUrl = "modifyPopupUrl.com";
		String modifyPopupDisYn = "Y";
		requestParamMap.put(ConstantsForParam.TITLE, 			modifyPopupDisTitle);
		requestParamMap.put(ConstantsForParam.IMG_PATH, 		modifyPopupDisImgPath);
		requestParamMap.put(ConstantsForParam.DISPLAY_LINK_URL, modifyPopupDisLinkUrl);
		requestParamMap.put(ConstantsForParam.DISPLAY_YN, 		modifyPopupDisYn);
		
		// when
		displayService.modify(requestParamMap);
		
		// then
		List<Map> modifyTopDisplay = displayService.popupList();
		Map modifyTopInfo = modifyTopDisplay.get(0);
		assertThat((String)modifyTopInfo.get(ConstantsForDb.TITLE), 		is(modifyPopupDisTitle));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.IMG_PATH), 		is(modifyPopupDisImgPath));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.LINK_URL), 		is(modifyPopupDisLinkUrl));
		assertThat((String)modifyTopInfo.get(ConstantsForDb.DISPLAY_YN), 	is(modifyPopupDisYn));
		
	}
	
	@Test
	public void deletePopup() {
		// given 
		List<Map> popupDisplay = displayService.popupList();
		Map popupInfo = popupDisplay.get(0);
		requestParamMap.put(ConstantsForParam.DISPLAY_ID, popupInfo.get(ConstantsForDb.DISPLAY_ID));
		// when
		displayService.delete(requestParamMap);

		// then
		Map detailInfo = displayService.detail(requestParamMap);
		assertThat(detailInfo, is(nullValue()));

	}
	
	@Test
	public void testGetDisplayCode() {
		
		// given 

		// when
		List<Map> displayCodeList = displayService.codeList();

		// then
		assertThat(displayCodeList, is(notNullValue()));
		assertThat(displayCodeList.size(), is(not(0)));

	}
	
}
