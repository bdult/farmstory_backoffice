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


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class BoardServiceTest {
	
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	Map requestParamMap = null;
	
	
	@Autowired
	BoardService boardService;

	@Before
	public void setUp() throws Exception {
		requestParamMap = new HashMap();
	}

	@After
	public void tearDown() throws Exception {
		
	}
	
	
	@Test
	public void testBoardList() {
		
		// given 
		

		// when
		List<Map> boardList = boardService.boardList();

		// then
		assertThat(boardList, is(notNullValue()));
		assertThat(boardList.size(), is(not(0)));

	}
	
	@Test
	public void testCsBoardList() {
		
		// given 

		// when
		List<Map> boardList = boardService.CsBoardList();

		// then
		assertThat(boardList, is(notNullValue()));
		assertThat(boardList.size(), is(not(0)));
		for(Map boardInfo : boardList){
			assertThat((String)boardInfo.get(ConstantsForDb.BOARD_TYPE), is("CS"));
		}

	}
	
	@Test
	public void testBoardContentsList() {
		
		// given 
		int testBoardId = 3;
		requestParamMap.put(ConstantsForParam.BOARD_ID, testBoardId);

		// when
		List<Map> boardContentsList = boardService.contentsListByBoardId(requestParamMap);

		// then
		assertThat(boardContentsList.size(), is(not(0)));

	}
	
	@Test
	public void testBoardContentsDetail() {
		
		// given 
		long testBoardContentsId = 149;
		requestParamMap.put(ConstantsForParam.BOARD_CONTENTS_ID, testBoardContentsId);

		// when
		Map boardDetail = boardService.contentsDeail(requestParamMap);

		// then
		assertThat(boardDetail, is(notNullValue()));
		assertThat((Long)boardDetail.get(ConstantsForDb.BOARD_CONTENTS_ID), is(testBoardContentsId));

	}
	
	

//	@Test
//	public void testCreate() {
//
//		// given
//		
//		Map boardInfo = new HashMap();
//		boardInfo.put("board_nm", "test");
//		boardInfo.put("reg_member_id", "test");
//		boardInfo.put("mod_member_id", "test");
//		boardService.deleteByName((String)boardInfo.get("board_nm"));
//
//		// when
//		boardService.create(boardInfo);
//
//		// then
//		Map boardDetailInfo = boardService.detail(boardInfo);
//		assertNotNull(boardDetailInfo);
//	}
//	
//	@Test
//	public void testList() {
//
//		// given
//		 testCreate();
//
//		// when
//		List<Map> boardList = boardService.list(null);
//
//		// then
//		assertNotNull(boardList);
//		assertThat(boardList.size(), is(not(0)));
//	}
//	
//	@Test
//	public void testDelete() {
//
//		// given 
//		Map boardInfo = boardService.boardInfoByName("test");
//
//		// when
//		boardService.delete(boardInfo);
//
//		// then
//		Map boardDetailInfo = boardService.detail(boardInfo);
//		assertNull(boardDetailInfo);
//		
//	}
//	
//	@Test
//	public void testModify() {
//
//		// given 
//		String boardMasterId = null;
//		List<Map> boardList = boardService.list(null);
//		Map boardModifyInfo = new HashMap();
//		if(boardList.size() > 0){
//			boardMasterId = ""+boardList.get(0).get("BOARD_ID");
//		}else{
//			testCreate();
//			boardList = boardService.list(null);
//			boardMasterId = ""+boardList.get(0).get("BOARD_ID");
//		}
//		
//		boardModifyInfo.put("board_id", boardMasterId);
//		boardModifyInfo.put("board_nm", "test_modify");
//		
//		// when
//		boardService.modify(boardModifyInfo);
//
//		// then
//		Map boardDetailInfo = boardService.detail(boardModifyInfo);
//		assertNotNull(boardDetailInfo);
//		assertEquals(boardModifyInfo.get("board_nm"), boardDetailInfo.get("BOARD_NM"));
//		
//	}
//	
//	@Test
//	public void testTopList() {
//		
//		// given 
//		int limitCount = 5;
//
//		// when
//		List<Map> topList = boardService.top(limitCount);
//
//		// then
//		assertThat(topList, is(notNullValue()));
//		assertTrue(topList.size() <= limitCount);
//
//	}
	
	
	
}