package com.bgg.farmstoryback.service;

import static org.hamcrest.CoreMatchers.*;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.*;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

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
public class BoardServiceTest {
	
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@Autowired
	BoardService boardService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testCreate() {

		// given
		
		Map boardInfo = new HashMap();
		boardInfo.put("board_nm", "test");
		boardInfo.put("reg_member_id", "test");
		boardInfo.put("mod_member_id", "test");
		boardService.deleteByName((String)boardInfo.get("board_nm"));

		// when
		boardService.create(boardInfo);

		// then
		Map boardDetailInfo = boardService.detail(boardInfo);
		assertNotNull(boardDetailInfo);
	}
	
	@Test
	public void testList() {

		// given
		 testCreate();

		// when
		List<Map> boardList = boardService.list(null);

		// then
		assertNotNull(boardList);
		assertThat(boardList.size(), is(not(0)));
	}
	
	@Test
	public void testDelete() {

		// given 
		Map boardInfo = boardService.boardInfoByName("test");

		// when
		boardService.delete(boardInfo);

		// then
		Map boardDetailInfo = boardService.detail(boardInfo);
		assertNull(boardDetailInfo);
		
	}
	
	@Test
	public void testModify() {

		// given 
		String boardMasterId = null;
		List<Map> boardList = boardService.list(null);
		Map boardModifyInfo = new HashMap();
		if(boardList.size() > 0){
			boardMasterId = ""+boardList.get(0).get("BOARD_ID");
		}else{
			testCreate();
			boardList = boardService.list(null);
			boardMasterId = ""+boardList.get(0).get("BOARD_ID");
		}
		
		boardModifyInfo.put("board_id", boardMasterId);
		boardModifyInfo.put("board_nm", "test_modify");
		
		// when
		boardService.modify(boardModifyInfo);

		// then
		Map boardDetailInfo = boardService.detail(boardModifyInfo);
		assertNotNull(boardDetailInfo);
		assertEquals(boardModifyInfo.get("board_nm"), boardDetailInfo.get("BOARD_NM"));
		
	}
	
	
	
}
