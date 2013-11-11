package com.bgg.farmstoryback.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.analytics.Analytics;
import com.google.api.services.analytics.model.GaData;

@Component
public class GoogleApiUtil {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());

	//OAUTH2 관련
	private final String CODE_URL = "https://accounts.google.com/o/oauth2/auth";
	private final String TOKEN_URL = "https://accounts.google.com/o/oauth2/token";
	
	// https://cloud.google.com/console
	// ozworld installed 정보
	private final String CLIEND_ID = "724483965228-j599oijfnsl3r3m3a8npsu0hlsa4544d.apps.googleusercontent.com";
	private final String SCOPE = "https://www.googleapis.com/auth/analytics+https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email";
	private final String REDIRECT_URI = "urn:ietf:wg:oauth:2.0:oob";

	private final String PROFILE_ID = "78189260";
	private final String CLIENT_SECRET = "hu4HWRf2NxHFq5LNi58v1ILf";

	//파일 관련 
	private final String ROOT = "/";
	private final String parentPath = "google-analytics/";
	private final String accessTokenfileName = "google.accessToken";
	private final String refreshTokenfileName = "google.refreshToken";
	
	/**
	 * @return 코드받는 URL을 돌려준다
	 */
	public String getCodeUrl() {
		return String.format(CODE_URL + "?client_id=%s&scope=%s&redirect_uri=%s&response_type=code&access_type=offline", CLIEND_ID, SCOPE, REDIRECT_URI);
	}

	/**
	 * 파라미터로 받은 코드를 가지고 엑세스 토큰을 구글로부터 받아온다
	 * 
	 * @param code
	 * @return
	 */
	public int getAccessTokenByGoogle(String code) {
		
		int responseCode = 0;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httppost = new HttpPost(TOKEN_URL);
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("code", code));
		nvps.add(new BasicNameValuePair("client_id", CLIEND_ID));
		nvps.add(new BasicNameValuePair("client_secret", CLIENT_SECRET));
		nvps.add(new BasicNameValuePair("redirect_uri", REDIRECT_URI));
		nvps.add(new BasicNameValuePair("grant_type", "authorization_code"));
		
		UrlEncodedFormEntity urlEntity = new UrlEncodedFormEntity(nvps, Consts.UTF_8);
		httppost.setEntity(urlEntity);
		
		try {
			CloseableHttpResponse response = httpclient.execute(httppost);
			
			responseCode = response.getStatusLine().getStatusCode();
			logger.debug("responseCode {} ", responseCode);
			
			if (responseCode == 200) {
				
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					InputStream instream = entity.getContent();
					try {
						String responseBody = IOUtils.toString(instream);
						logger.debug(responseBody);
						JSONObject json = (JSONObject) JSONValue.parse(responseBody);

						// 엑세스 토큰 파일쓰기
						String _accessToken = json.get("access_token").toString();
						this.saveAccessToken(_accessToken);
						
						// 리프레쉬 토큰 파일쓰기
						String _refreshToken = json.get("refresh_token").toString();
						this.saveRefreshToken(_refreshToken);
						
						logger.debug("_accessToken {}", _accessToken);
						logger.debug("_refreshToken {}", _refreshToken);
						
					} finally {
						instream.close();
					}
				}
				
			}
			response.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return responseCode;
	}

	/**
	 * ROOT/google-analytics/google.accessToken 파일로부터 엑세스 토큰을 읽고 반환한다
	 * 
	 * @return
	 */
	public String getAccessTokenByFile() {
		
		String accessToken = "";
		try {
			FileInputStream inputStream = new FileInputStream(ROOT + parentPath + accessTokenfileName);
			accessToken = IOUtils.toString(inputStream);
			inputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("엑세스 토큰 읽기 에러");
		}

		return accessToken;

	}
	
	/**
	 * 엑세스 토큰이 유효한지를 체크한다
	 * 
	 * @return
	 */
	public boolean checkAccessToken() {
		
		boolean isValidAccessToken = false;
		
		CloseableHttpClient httpclient = HttpClients.createDefault();
		String url = String.format("https://www.googleapis.com/oauth2/v1/userinfo?access_token=%s", this.getAccessTokenByFile());
		HttpGet httpget = new HttpGet(url);
		try {
			CloseableHttpResponse response = httpclient.execute(httpget);
			int responseCode = response.getStatusLine().getStatusCode();
			if (responseCode == 200) {
				isValidAccessToken = true;
			}
			response.close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("엑세스 토큰 체크 에러");
		}
		
		return isValidAccessToken;
	}

	/**
	 * 파라미터로 받은 엑세스 토큰을 ROOT/google-analytics/google.accessToken 파일로 저장
	 * 
	 * @param accessToken
	 */
	private void saveAccessToken(String accessToken) {
	
		//디렉토리 생성 
		File destination = new File(ROOT+parentPath);
		//해당 디렉토리의 존재여부를 확인
		if(!destination.exists()){
			destination.mkdirs(); 
		}
		FileOutputStream fos = null;
		try {
	
			fos = new FileOutputStream(ROOT + parentPath + accessTokenfileName, false);
	
			byte[] contentInBytes = accessToken.getBytes();
	
			fos.write(contentInBytes);
			fos.flush();
			fos.close();
	
		} catch (IOException e) {
	
			e.printStackTrace();
			logger.error("엑세스 토큰 쓰기 에러");
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
				}
			}
		}
	
	}

	/**
	 * 만료된 엑세스 토큰을 리프레쉬 토큰을 이용하여 유효하게 변경
	 * 
	 * @param code
	 * @return
	 */
	public int refreshTokenByGoogle() {
	
		int responseCode = 0;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httppost = new HttpPost(TOKEN_URL);
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("refresh_token", this.getRefreshTokenByFile()));
		nvps.add(new BasicNameValuePair("client_id", CLIEND_ID));
		nvps.add(new BasicNameValuePair("client_secret", CLIENT_SECRET));
		nvps.add(new BasicNameValuePair("grant_type", "refresh_token"));
	
		UrlEncodedFormEntity urlEntity = new UrlEncodedFormEntity(nvps, Consts.UTF_8);
		httppost.setEntity(urlEntity);
	
		try {
			CloseableHttpResponse response = httpclient.execute(httppost);
	
			responseCode = response.getStatusLine().getStatusCode();
			logger.debug("responseCode {} ", responseCode);
	
			if (responseCode == 200) {
	
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					InputStream instream = entity.getContent();
					try {
						String responseBody = IOUtils.toString(instream);
						logger.debug(responseBody);
						JSONObject json = (JSONObject) JSONValue.parse(responseBody);
						String _accessToken = json.get("access_token").toString();
						// 엑세스 토큰 파일쓰기
						this.saveAccessToken(_accessToken);
						
						logger.debug(" re_accessToken {}", _accessToken);
					} finally {
						instream.close();
					}
				}
	
			} else if(responseCode == 401) {
				//TODO 엑세스 토큰 재생성 시나리오 필요
			}
			response.close();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return responseCode;
	}

	/**
	 * ROOT/google-analytics/google.refreshToken 파일로부터 리프레쉬 토큰을 읽고 반환한다
	 * 
	 * @return
	 */
	public String getRefreshTokenByFile() {
		
		String refreshToken = "";
		try {
			FileInputStream inputStream = new FileInputStream(ROOT + parentPath + refreshTokenfileName);
			refreshToken = IOUtils.toString(inputStream);
			inputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("리프레쉬 토큰 읽기 에러");
		}
		
		return refreshToken;
		
	}

	/**
	 * 파라미터로 받은 리프레쉬 토큰을 ROOT/google-analytics/google.refreshToken 파일로 저장
	 * 
	 * @param _refreshToken
	 */
	private void saveRefreshToken(String _refreshToken) {
		
		//디렉토리 생성 
		File destination = new File(ROOT+parentPath);
		//해당 디렉토리의 존재여부를 확인
		if(!destination.exists()){
			destination.mkdirs(); 
		}
		FileOutputStream fos = null;
		try {
			
			fos = new FileOutputStream(ROOT + parentPath + refreshTokenfileName, false);
			
			byte[] contentInBytes = _refreshToken.getBytes();
			
			fos.write(contentInBytes);
			fos.flush();
			fos.close();
			
		} catch (IOException e) {
			
			e.printStackTrace();
			logger.error("리프레쉬 토큰 쓰기 에러");
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
				}
			}
		}
		
	}

	/** ozworld 사이트 방문자 정보를 리턴한다
	 * @return null리턴시 엑세스 토큰 유효성 확인해보기
	 */
	public GaData getVisitor(String dimension, String startDate, String endDate) {
	
		GoogleCredential credential = new GoogleCredential().setAccessToken(this.getAccessTokenByFile());
	
		GaData result = null;
		try {
			Analytics analytics = new Analytics.Builder(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance(), credential).build();
	
			result = analytics.data().ga().get("ga:" + PROFILE_ID,
					startDate,// ex:2013-10-01"
					endDate,//"2013-10-30", // End date.
					"ga:visits") // Metrics.
					.setDimensions(dimension)
					// .setSort("-ga:visits,ga:source")
					// .setFilters("ga:medium==organic")
					.setMaxResults(30).execute();
		} catch (GoogleJsonResponseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return result;
		
	}

	public GaData getLatelyData(String metrics, String dimension, String startDate, String endDate) {
		
		GoogleCredential credential = new GoogleCredential().setAccessToken(this.getAccessTokenByFile());
		
		GaData result = null;
		try {
			Analytics analytics = new Analytics.Builder(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance(), credential).build();
			
			result = analytics.data().ga().get("ga:" + PROFILE_ID,
					startDate,// ex:2013-10-01"
					endDate,//"2013-10-30", // End date.
					metrics) // Metrics.
					.setDimensions(dimension)
					// .setSort("-ga:visits,ga:source")
					// .setFilters("ga:medium==organic")
					.setMaxResults(30).execute();
		} catch (GoogleJsonResponseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return result;
		
	}

	/** 평균정보를 리턴
	 * @return null리턴시 엑세스 토큰 유효성 확인해보기
	 */
	public GaData getAverage(String metrics, String startDate, String endDate) {
		
		GoogleCredential credential = new GoogleCredential().setAccessToken(this.getAccessTokenByFile());
		
		GaData result = null;
		try {
			Analytics analytics = new Analytics.Builder(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance(), credential).build();
			
			result = analytics.data().ga().get("ga:" + PROFILE_ID,
					startDate,// ex:2013-10-01"
					endDate,//"2013-10-30", // End date.
					metrics) // Metrics.
					//.setDimensions("ga:country,ga:city,ga:language")
					// .setSort("-ga:visits,ga:source")
					.setFilters("ga:country==South Korea")
					.setMaxResults(30).execute();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

}
