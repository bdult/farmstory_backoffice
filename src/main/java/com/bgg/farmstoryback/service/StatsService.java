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

	/** 구글에서 받은 토큰 저장
	 * @param code
	 * @return
	 */
	public int saveAccessToken(String code) {
		return googleApiUtil.getAccessTokenByGoogle(code);
	}
	
	/** 파일에서 토큰 읽어오기
	 * @return
	 */
	public String getAccessToken() {
		return googleApiUtil.getAccessTokenByFile();
	}

	public String getCodeUrl() {
		
		return googleApiUtil.getCodeUrl();
	}
	
	public boolean checkAccessToken(){
		return googleApiUtil.checkAccessToken();
	}
	
	public GaData getVisitor(String dimension, String startDate, String endDate){
		
		GaData result = googleApiUtil.getVisitor(dimension, startDate, endDate);
		
		if(result == null){
			//token 재생성
			int refreshResult = googleApiUtil.refreshTokenByGoogle();
			
			if(refreshResult == 200){
				result = googleApiUtil.getVisitor(dimension, startDate, endDate);
			}
		}
		
		return result;
	}
	
	public GaData getAverage(String metrics, String startDate, String endDate){
		
		GaData result = googleApiUtil.getAverage(metrics, startDate, endDate);
		
		if(result == null){
			//token 재생성
			int refreshResult = googleApiUtil.refreshTokenByGoogle();
			
			if(refreshResult == 200){
				result = googleApiUtil.getAverage(metrics, startDate, endDate);
			}
		}
		
		return result;
	}
	
	
}