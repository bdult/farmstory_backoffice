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


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class BoardServiceTest {
	
	
	@SuppressWarnings("rawtypes")
	Map requestParamMap = null;
	
	@Autowired
	BoardService boardService;

	@Before
	@SuppressWarnings("rawtypes")
	public void setUp() throws Exception {
		requestParamMap = new HashMap();
	}

	@After
	public void tearDown() throws Exception {
		
	}
	
	
	@Test
	@SuppressWarnings("rawtypes")
	public void testBoardList() {
		
		// given 

		// when
		List<Map> boardList = boardService.boardList();

		// then
		assertThat(boardList, is(notNullValue()));
		assertThat(boardList.size(), is(not(0)));

	}
	
	@Test
	@SuppressWarnings("rawtypes")
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
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testBoardContentsList() {
		
		// given 
		setBoardInfo();
		requestParamMap.put(ConstantsForParam.BOARD_ID, 3);
		requestParamMap.put(ConstantsForParam.PAGE_START_NO, 0);
		requestParamMap.put(ConstantsForParam.PAGE_PER_PAGE, 10);
		requestParamMap.put(ConstantsForParam.COMPLETE_YN, 'Y');
//		requestParamMap.put(ConstantsForParam.SEARCH_TYPE, "title");
//		requestParamMap.put(ConstantsForParam.SEARCH, "add");

		// when
		List<Map> boardContentsList = boardService.contentsListByBoardId(requestParamMap);

		// then
		assertThat(boardContentsList.size(), is(not(0)));
		assertTrue(boardContentsList.size() <= 10);
		Map boardContentsInfo = boardContentsList.get(0);
		assertThat(boardContentsInfo, is(notNullValue()));
		assertThat(boardContentsInfo.get(ConstantsForDb.STATUS), is(notNullValue()));
		assertThat(boardContentsInfo.get(ConstantsForDb.TITLE), is(notNullValue()));
		assertThat(boardContentsInfo.get(ConstantsForDb.STATUS_DESC), is(notNullValue()));
		assertThat(boardContentsInfo.get(ConstantsForDb.REG_DT), is(notNullValue()));

	}

	@Test
	@SuppressWarnings({ "rawtypes" })
	public void testBoardContentsDetail() {
		
		// given 
		setBoardContentsInfo();

		// when
		Map boardDetail = boardService.contentsDeail(requestParamMap);

		// then
		assertThat(boardDetail, is(notNullValue()));

	}
	
	@Test
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testModifyBoardContents() {
		
		// given 
		setBoardContentsInfo();
		
		String testModifyTitle = "modifyTitle";
		String testModifyContents = "modifyContents";
		String boardContentsType = "BOT002";
		String testEvent_start_dt = "2013-10-31";
		String testEvent_end_dt = "2013-11-31";
		String testSubContents = "당첨자 발표 목록 입니다."; 
		long testStatus = 1; 
		requestParamMap.put(ConstantsForParam.CONTENTS, testModifyContents);
		requestParamMap.put(ConstantsForParam.TITLE, testModifyTitle);
		requestParamMap.put(ConstantsForParam.CONTENTS_CODE, boardContentsType);
		requestParamMap.put(ConstantsForParam.EVENT_START_DT, testEvent_start_dt);
		requestParamMap.put(ConstantsForParam.EVENT_END_DT, testEvent_end_dt);
		requestParamMap.put(ConstantsForParam.SUB_CONTENTS, testSubContents);
		requestParamMap.put(ConstantsForParam.STATUS, testStatus);
		
		// when
		boardService.modifyContents(requestParamMap);

		// then
		Map boardDetail = boardService.contentsDeail(requestParamMap);
		assertThat(boardDetail, is(notNullValue()));
		String boardContents = (String)boardDetail.get(ConstantsForDb.CONTENTS);
		String boardContentsTitle = (String)boardDetail.get(ConstantsForDb.TITLE);
		
		assertThat(boardContentsTitle, is(testModifyTitle));
		assertThat(boardContents, is(testModifyContents));
		assertTrue(boardDetail.get(ConstantsForDb.CONTENTS_CODE).equals(boardContentsType));
		assertTrue(boardDetail.get(ConstantsForDb.EVENT_START_DT).equals(testEvent_start_dt));
		assertTrue(boardDetail.get(ConstantsForDb.EVENT_END_DT).equals(testEvent_end_dt));
		assertTrue((Long)boardDetail.get(ConstantsForDb.STATUS) == testStatus);
		assertTrue(boardDetail.get(ConstantsForDb.SUB_CONTENTS).equals(testSubContents));
	}
	
	@Test
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testAddBoardContents() {
		
		// given 
		setBoardInfo();
		
		String testAddTitle = "AddTitle";
		String testAddContents = "AddContents";
		String testAddMemberId = "master";
		String boardContentsType = "BOT001";
		String testEvent_start_dt = "2013-10-31";
		String testEvent_end_dt = "2013-11-31";
		String testSubContents = "당첨자 발표 목록 입니다."; 
		long testStatus = 1; 
		requestParamMap.put(ConstantsForParam.CONTENTS, testAddContents);
		requestParamMap.put(ConstantsForParam.TITLE, testAddTitle);
		requestParamMap.put(ConstantsForParam.MEMBER_ID, testAddMemberId);
		requestParamMap.put(ConstantsForParam.CONTENTS_CODE, boardContentsType);
		requestParamMap.put(ConstantsForParam.EVENT_START_DT, testEvent_start_dt);
		requestParamMap.put(ConstantsForParam.EVENT_END_DT, testEvent_end_dt);
		requestParamMap.put(ConstantsForParam.SUB_CONTENTS, testSubContents);
		requestParamMap.put(ConstantsForParam.SUB_CONTENTS, testSubContents);
		requestParamMap.put(ConstantsForParam.STATUS, testStatus);

		// when
		boardService.addContents(requestParamMap);

		// then
		List<Map> boardContentsList = boardService.contentsListByBoardId(requestParamMap);
		long contentsId = (Long)boardContentsList.get(0).get(ConstantsForDb.CONTENTS_ID);
		requestParamMap.put(ConstantsForParam.BOARD_CONTENTS_ID, contentsId);
		
		
		Map contentsDetail = boardService.contentsDeail(requestParamMap);
		assertThat(contentsDetail, is(notNullValue()));
		assertTrue(contentsDetail.get(ConstantsForDb.TITLE).equals(testAddTitle));
		assertTrue(contentsDetail.get(ConstantsForDb.CONTENTS).equals(testAddContents));
		assertTrue(contentsDetail.get(ConstantsForDb.CONTENTS_CODE).equals(boardContentsType));
		assertTrue(contentsDetail.get(ConstantsForDb.EVENT_START_DT).equals(testEvent_start_dt));
		assertTrue(contentsDetail.get(ConstantsForDb.EVENT_END_DT).equals(testEvent_end_dt));
		assertTrue(contentsDetail.get(ConstantsForDb.SUB_CONTENTS).equals(testSubContents));
		assertTrue((Long)contentsDetail.get(ConstantsForDb.STATUS) == testStatus);

	}
	
	@SuppressWarnings("rawtypes")
	@Test
	public void testDeleteBoardContents() {
		
		// given
		setBoardContentsInfo();

		// when
		boardService.deleteContents(requestParamMap);

		// then
		Map contentsDetail = boardService.contentsDeail(requestParamMap);
		assertThat(contentsDetail, is(nullValue()));
		

	}
	
	
	@Test
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testBoardContentsCommentList() {
		
		// given
		String testComment ="Comment";
		String testMemberId = "master";
		
		setBoardContentsInfo();
		requestParamMap.put(ConstantsForParam.COMMENT, testComment);
		requestParamMap.put(ConstantsForParam.MEMBER_ID, testMemberId);
		
		boardService.addComment(requestParamMap);

		// when
		List<Map> commentList = boardService.commentList(requestParamMap);

		// then
		assertThat(commentList, is(notNullValue()));
		assertThat(commentList.size(), is(not(0)));

	}
	
	@Test
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testBoardCommentDetail() {
		
		// given 
		String testComment ="Comment";
		String testMemberId = "master";
		
		setCommentInfo();
		requestParamMap.put(ConstantsForParam.COMMENT, testComment);
		requestParamMap.put(ConstantsForParam.MEMBER_ID, testMemberId);
		

		// when
		Map commentDetail = boardService.commentDetail(requestParamMap);

		// then
		assertThat(commentDetail, is(notNullValue()));

	}
	
	
	@Test
	@SuppressWarnings({ "unchecked" })
	public void testAddCommnet() {
		
		// given
		setBoardContentsInfo();
		
		String testComment ="Comment";
		String testMemberId = "master";
		
		requestParamMap.put(ConstantsForParam.COMMENT, testComment);
		requestParamMap.put(ConstantsForParam.MEMBER_ID, testMemberId);

		// when
		boardService.addComment(requestParamMap);

		assertComment(testComment);

	}
	
	@Test
	@SuppressWarnings({ "unchecked" })
	public void modifyComment() {
		
		// given 
		setCommentInfo();
		
		String testComment ="ModifyComment";
		String testMemberId = "master";
		requestParamMap.put(ConstantsForParam.COMMENT, testComment);
		requestParamMap.put(ConstantsForParam.MEMBER_ID, testMemberId);

		// when
		boardService.modifyComment(requestParamMap);

		// then
		assertComment(testComment);

	}
	
	@Test
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void deleteComment() {
		
		// given 
		setCommentInfo();
		
		String testMemberId = "master";
		requestParamMap.put(ConstantsForParam.MEMBER_ID, testMemberId);
		

		// when
		boardService.deleteComment(requestParamMap);
		
		
		// then
		Map commentDetail = boardService.commentDetail(requestParamMap);
		assertThat(commentDetail, is(nullValue()));

	}
	
	@Test
	public void testBoardContentsCategory() {
		
		// given 

		// when
		List<Map> boardContentsCategoryList = boardService.categoryList();

		// then
		assertThat(boardContentsCategoryList, is(notNullValue()));
		assertThat(boardContentsCategoryList.size(), is(not(0)));

	}
	
	public void testContentsTtotalCount() {
		
		// given 
		setBoardInfo();
		requestParamMap.put(ConstantsForParam.COMPLETE_YN, "N");
		
		// when
		int totalCount = boardService.contentsTotalCount(requestParamMap);

		// then
		assertThat(totalCount, is(not(0)));

	}

	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void setCommentInfo() {
		setBoardContentsInfo();
		List<Map> commentList = boardService.commentList(requestParamMap);
		long commentId = (Long)commentList.get(0).get(ConstantsForDb.COMMENT_ID);
		requestParamMap.put(ConstantsForParam.COMMENT_ID, commentId);
	}

	

	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void setBoardContentsInfo() {
		setBoardInfo();
		List<Map> boardContentsList = boardService.contentsListByBoardId(requestParamMap);
		long testBoardContentsId = (Long)boardContentsList.get(0).get(ConstantsForDb.BOARD_CONTENTS_ID);
		requestParamMap.put(ConstantsForParam.BOARD_CONTENTS_ID, testBoardContentsId);
		requestParamMap.put(ConstantsForParam.MEMBER_ID, (String)boardContentsList.get(0).get(ConstantsForDb.MEMBER_ID));
		
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void setBoardInfo() {
		List<Map> boardList = boardService.boardList();
		long testBoardId = (Long)boardList.get(0).get(ConstantsForDb.BOARD_ID);
		requestParamMap.put(ConstantsForParam.BOARD_ID, testBoardId);
	}
	
	@SuppressWarnings({ "rawtypes" })
	private void assertComment(String testComment) {
		setCommentInfo();
		
		Map commentDetail = boardService.commentDetail(requestParamMap);
		assertTrue(commentDetail.get(ConstantsForDb.COMMENT).equals(testComment));
	}
	
	
	
}