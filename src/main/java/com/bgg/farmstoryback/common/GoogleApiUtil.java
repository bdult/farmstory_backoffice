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
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.analytics.Analytics;
import com.google.api.services.analytics.model.GaData;

@Component
public class GoogleApiUtil {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());

	private final String ROOT = "/";
	private final String parentPath = "google-analytics/";
	private final String fileName = "google.accessToken";
	
	// https://cloud.google.com/console
	// ozworld installed 정보
	private final String cliendId = "724483965228-j599oijfnsl3r3m3a8npsu0hlsa4544d.apps.googleusercontent.com";
	private final String scope = "https://www.googleapis.com/auth/analytics+https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email";
	private final String redirectUri = "urn:ietf:wg:oauth:2.0:oob";

	private final String profileId = "78189260";
	private final String clientSecret = "hu4HWRf2NxHFq5LNi58v1ILf";

	/**
	 * @return 코드받는 URL을 돌려준다
	 */
	public String getCodeUrl() {
		return String.format("https://accounts.google.com/o/oauth2/auth?" + "client_id=%s&" + "scope=%s&" + "redirect_uri=%s&" + "response_type=code&access_type=offline", cliendId, scope, redirectUri);
	}

	/**
	 * 파라미터로 받은 코드를 가지고 엑세스 토큰을 구글로부터 받아온다
	 * 
	 * @param code
	 * @return
	 */
	public String getAccessTokenByGoogle(String code) {

		String _accessToken = "";
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httppost = new HttpPost("https://accounts.google.com/o/oauth2/token");
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("code", code));
		nvps.add(new BasicNameValuePair("client_id", cliendId));
		nvps.add(new BasicNameValuePair("client_secret", clientSecret));
		nvps.add(new BasicNameValuePair("redirect_uri", redirectUri));
		nvps.add(new BasicNameValuePair("grant_type", "authorization_code"));

		UrlEncodedFormEntity urlEntity = new UrlEncodedFormEntity(nvps, Consts.UTF_8);
		httppost.setEntity(urlEntity);

		try {
			CloseableHttpResponse response = httpclient.execute(httppost);

			int responseCode = response.getStatusLine().getStatusCode();
			logger.debug("responseCode {} ", responseCode);

			if (responseCode == 200) {

				HttpEntity entity = response.getEntity();
				if (entity != null) {
					InputStream instream = entity.getContent();
					try {
						String responseBody = IOUtils.toString(instream);
						logger.debug(responseBody);
						JSONObject json = (JSONObject) JSONValue.parse(responseBody);
						_accessToken = json.get("access_token").toString();
						// 엑세스 토큰 파일쓰기
						this.saveAccessToken(_accessToken);
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

		logger.debug("_accessToken {}", _accessToken);
		return _accessToken;
	}

	/**
	 * cfg\google.accessToken 파일로부터 엑세스 토큰을 읽고 반환한다
	 * 
	 * @return
	 */
	public String getAccessTokenByFile() {
		
		String accessToken = "";
		try {
			FileInputStream inputStream = new FileInputStream(ROOT + parentPath + fileName);
			accessToken = IOUtils.toString(inputStream);
			inputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("엑세스 토큰 읽기 에러");
		}

		return accessToken;

	}

	/**
	 * 파라미터로 받은 엑세스 토큰을 /google-analytics/google.accessToken 파일로 저장
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

			fos = new FileOutputStream(ROOT + parentPath + fileName, false);

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

	/** ozworld 사이트 방문자 정보를 리턴한다
	 * @return null리턴시 엑세스 토큰 유효성 확인해보기
	 */
	public GaData getVisitor(String dimension, String startDate, String endDate) {

		GoogleCredential credential = new GoogleCredential().setAccessToken(this.getAccessTokenByFile());

		GaData result = null;
		try {
			Analytics analytics = new Analytics.Builder(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance(), credential).build();

			result = analytics.data().ga().get("ga:" + profileId,
					startDate,// ex:2013-10-01"
					endDate,//"2013-10-30", // End date.
					"ga:visits") // Metrics.
					.setDimensions(dimension)
					// .setSort("-ga:visits,ga:source")
					// .setFilters("ga:medium==organic")
					.setMaxResults(30).execute();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
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
			
			result = analytics.data().ga().get("ga:" + profileId,
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
