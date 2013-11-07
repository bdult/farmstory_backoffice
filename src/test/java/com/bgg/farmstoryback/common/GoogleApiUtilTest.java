package com.bgg.farmstoryback.common;

import static org.junit.Assert.assertTrue;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class GoogleApiUtilTest {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	GoogleApiUtil googleApiUtil;
	
	@Test
	public void testCheckAccessToken() {
		assertTrue(googleApiUtil.checkAccessToken());
	}
	
	@Test
	public void testGetDailyVisitor(){
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		logger.info(dateFormat.format(cal.getTime()));
		
		//googleApiUtil.getDailyVisitor(startDate, endDate)
	}

}
