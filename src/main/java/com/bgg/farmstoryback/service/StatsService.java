package com.bgg.farmstoryback.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.GoogleApiUtil;
import com.google.api.services.analytics.model.GaData;


@Service
public class StatsService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private GoogleApiUtil googleApiUtil;

	/** 구글에서 토큰 받아오기
	 * @param code
	 * @return
	 */
	public String getAccessToken(String code) {
		//구글로 부터 엑세스 토큰 받아오기
		return googleApiUtil.getAccessToken(code);
	}
	
	/** 파일에서 토큰 가져오기
	 * @return
	 */
	public String getAccessToken() {
		return googleApiUtil.getAccessToken();
	}

	public String getCodeUrl() {
		
		return googleApiUtil.getCodeUrl();
	}
	
	public boolean checkAccessToken(){
		return googleApiUtil.checkAccessToken();
	}
	
	public GaData getVisitor(String dimension, String startDate, String endDate){
		
		return googleApiUtil.getVisitor(dimension, startDate, endDate);
	}
	
	public GaData getAverage(String metrics, String startDate, String endDate){
		
		return googleApiUtil.getAverage(metrics, startDate, endDate);
	}
	
	
}
