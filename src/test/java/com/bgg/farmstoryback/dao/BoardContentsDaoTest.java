package com.bgg.farmstoryback.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class BoardContentsDaoTest {

	@Autowired
	BoardDao boardDao;
	
	@Autowired
	BoardContentsDao boardContentsDao;
	
	/**
	 * 게시판 목록 조회
	 */
	@Test
	public void testBoardList() {
		
		List<Map> boardList =  boardDao.list(new HashMap());
		
		assertThat(boardList.size(), is(not(0)));
	}
	
	/**
	 * 게시판 글 목록 조회 ( 게시판 아이디를 Map에 넣어줘야 함 )
	 */
	@Test
	public void testList() {
		
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("boardId", 1);
		
		List<Map> contentsList = boardContentsDao.list(pageInfo);
	}
	
	/**
	 * 게시판 글 생성( 게시판 아이디 필수)
	 */
	@Test
	public void testCreate() {
		
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("boardId", 1);
		pageInfo.put("memberId", "test");
		pageInfo.put("title", 1);
		pageInfo.put("contents", "내요요요요요용");
		
		int result = boardContentsDao.create(pageInfo);
		
		assertThat(result, is(not(0)) );
	}
	
	/**
	 * 글번호로 상세정보 조회
	 */
	@Test
	public void testDetail() {
		
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("contentsId", 119);
		
		Map data = boardContentsDao.detail(pageInfo);
		assertNotNull(data);
	}

	/**
	 * 글번호로 글 삭제
	 */
	@Test
	public void testDelete() {
		
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("contentsId", 1);
		
		int result =  boardContentsDao.delete(pageInfo);
		assertThat(result, is(1));
	}
	
	/**
	 * 글번호로 글 수정
	 */
	@Test
	public void testUpdate() {
		
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("contentsId", 119);
		pageInfo.put("title", "이베엔트@");
		pageInfo.put("contents", "내용내용 업데이트!!!!!!");
		
		int result =  boardContentsDao.modify(pageInfo);
		assertThat(result, is(1));
	}

}
