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
	@SuppressWarnings({ "rawtypes" })
	public void testBoardContentsList() {
		
		// given 
		setBoardInfo();

		// when
		List<Map> boardContentsList = boardService.contentsListByBoardId(requestParamMap);

		// then
		assertThat(boardContentsList.size(), is(not(0)));

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
		requestParamMap.put(ConstantsForParam.CONTENTS, testModifyContents);
		requestParamMap.put(ConstantsForParam.TITLE, testModifyTitle);
		
		// when
		boardService.modifyContents(requestParamMap);

		// then
		Map boardDetail = boardService.contentsDeail(requestParamMap);
		assertThat(boardDetail, is(notNullValue()));
		String boardContents = (String)boardDetail.get(ConstantsForDb.CONTENTS);
		String boardContentsTitle = (String)boardDetail.get(ConstantsForDb.TITLE);
		
		assertThat(boardContentsTitle, is(testModifyTitle));
		assertThat(boardContents, is(testModifyContents));
	}
	
	@Test
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void testAddBoardContents() {
		
		// given 
		setBoardInfo();
		
		String testAddTitle = "AddTitle";
		String testAddContents = "AddContents";
		String testAddMemberId = "master";
		requestParamMap.put(ConstantsForParam.CONTENTS, testAddContents);
		requestParamMap.put(ConstantsForParam.TITLE, testAddTitle);
		requestParamMap.put(ConstantsForParam.MEMBER_ID, testAddMemberId);

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

	}
	
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
	@SuppressWarnings({ "unchecked" })
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
	public void testContentsTtotalCount() {
		
		// given 
		setBoardInfo();
		
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