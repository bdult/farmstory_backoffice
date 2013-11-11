package com.bgg.farmstoryback.common;

import static org.junit.Assert.assertTrue;

import java.io.IOException;
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

import com.google.api.services.analytics.model.GaData;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class GoogleApiUtilTest {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	GoogleApiUtil googleApiUtil;
	
	@Autowired
	DateUtil dateUtil;
	
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
	
	@Test
	public void testGetLately() throws IOException{
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String dimension = "ga:date"; //year,month,week
		logger.info(dateFormat.format(cal.getTime()));
		
		String metrics = "ga:visits,ga:newVisits,ga:avgTimeOnSite,ga:pageviewsPerVisit";
		
		GaData ggdata = googleApiUtil.getLatelyData(metrics, dimension, dateUtil.add(-30), dateUtil.today());
		
		logger.info( ggdata.toPrettyString() );
		
	}
	
	@Test
	public void testGetCountry() throws IOException{
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		GaData ggdata = googleApiUtil.getLatelyData("ga:visits", "ga:country", dateUtil.add(-30), dateUtil.today());
		
		logger.info( ggdata.toPrettyString() );
		
	}
	
	@Test
	public void testGetBrowser() throws IOException{
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		GaData ggdata = googleApiUtil.getLatelyData("ga:visits", "ga:browser", dateUtil.add(-30), dateUtil.today());
		
		logger.info( ggdata.toPrettyString() );
		
	}

	@Test
	public void testStr(){
		String str = "LOC001";
		logger.info( str.substring(str.length()-1) );
	}
}
