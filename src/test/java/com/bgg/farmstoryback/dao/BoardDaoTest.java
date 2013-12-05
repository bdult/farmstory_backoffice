package com.bgg.farmstoryback.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class BoardDaoTest {

	@Autowired
	private BoardDao boardDao;
	
	@Test
	public void test() {
	for(int begin=1; begin <= 10; begin++){
			
		//String title = "자주하는";
		//String title = "회원/가입안내";
		String title = "이용장애안내";
			//given
			Map<String, Object> boardMap = new HashMap<String, Object>();
			boardMap.put("board_id", 5);
			boardMap.put("member_id", "master");
			boardMap.put("title", title +" 질문" + begin);
			boardMap.put("contents", title +" 답변 " + begin);
			boardMap.put("contents_code", "BOT005");
			
			//when
			boardDao.addContents(boardMap);
		}
	}

}
