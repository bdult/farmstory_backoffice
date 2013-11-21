package com.bgg.farmstoryback.common;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class PostApiUtilTest {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PostApiUtil postApiUtil;
	
	@Test
	public void testGetAddr() throws UnsupportedEncodingException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchSe", "road");
		map.put("srchwrd", "개봉로 20");
		String xml = postApiUtil.getAddr(map);
		
		logger.info(xml);

		// then
		assertNotNull(xml);
	}

}
