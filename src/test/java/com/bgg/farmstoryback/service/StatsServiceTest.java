package com.bgg.farmstoryback.service;

import java.io.IOException;

import org.hamcrest.core.IsNot;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bgg.farmstoryback.common.DateUtil;
import com.bgg.farmstoryback.common.GoogleApiUtil;
import com.google.api.services.analytics.model.GaData;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class StatsServiceTest {

	Logger logger = LoggerFactory.getLogger(getClass());
			
	@Autowired
	private GoogleApiUtil googleApiUtil;
	
	@Autowired
	private DateUtil dateUtil;
	
	@Test
	public void testSaveAccessToken(){
		
		//필수! 구글 로긴하고 받은 코드 입력
		String _code = "";
		String _token = googleApiUtil.getAccessTokenByGoogle(_code);
		Assert.assertThat(_token, IsNot.not(""));
	}
	
	@Test
	public void testGetAccessTokenByFile(){
		
		String token = googleApiUtil.getAccessTokenByFile();
		logger.info(token);
		Assert.assertThat(token, IsNot.not(""));
	}
	
	@Test
	public void testGetCodeUrl(){
		
		String url = googleApiUtil.getCodeUrl();
		logger.info(url);
		Assert.assertThat(url, IsNot.not(""));
	}
	
	@Test
	public void testGetVisitor() throws IOException{
			
		String dimension = "ga:date"; //year,month,week
		GaData gaData = googleApiUtil.getVisitor(dimension, dateUtil.add(-30), dateUtil.today());
		Assert.assertNotNull(gaData);
		logger.info(gaData.getProfileInfo().toPrettyString());
	}
	
	@Test
	public void testGetAverage() throws IOException{
		
		String metrics = "ga:visitors,ga:visits,ga:avgTimeOnSite,ga:pageviews,ga:avgTimeOnPage";
		GaData gaData = googleApiUtil.getAverage(metrics, dateUtil.add(-30), dateUtil.today());
		Assert.assertNotNull(gaData);
		logger.info(gaData.getProfileInfo().toPrettyString());
	}
	
	

}