package com.bgg.farmstoryback.common;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class DateUtilTest {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private DateUtil dateUtil;
	
	@Test
	public void testToday() {
		logger.info(dateUtil.today());
	}
	
	@Test
	public void testAdd() {
		int days = -30;
		logger.info(dateUtil.add(days));
	}

}
