package com.bgg.farmstoryback.common;

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
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.analytics.Analytics;
import com.google.api.services.analytics.model.GaData;
import com.google.api.services.analytics.model.GaData.ColumnHeaders;

public class GoogleUtilTest {

	Logger logger = LoggerFactory.getLogger(GoogleUtilTest.class);
	GoogleApiUtil googleApiUtil = new GoogleApiUtil();
	
	//https://cloud.google.com/console
	//ozworld installed 정보
	private final String cliendId = "724483965228-j599oijfnsl3r3m3a8npsu0hlsa4544d.apps.googleusercontent.com";
	private final String scope = "https://www.googleapis.com/auth/analytics.readonly";
	private final String redirectUri = "urn:ietf:wg:oauth:2.0:oob";
	
	private final String profileId = "78189260";
	private final String clientSecret = "hu4HWRf2NxHFq5LNi58v1ILf";
	private final String accessToken = "ya29.AHES6ZRgkQa3rXynsOmvQ-uGFps4qCgz4vtPK9JuFr8U-XE"; // 2013-10-28 오후 4시쯤 받음

	
	@Test
	public void testGetCodeUrl(){
		logger.info(googleApiUtil.getCodeUrl());
	}
	
	@Test
	public void test() {

		GoogleCredential credential = new GoogleCredential().setAccessToken(accessToken);

		try {
			Analytics analytics = new Analytics.Builder(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance(), credential).build();

			GaData gaData = executeDataQuery(analytics, profileId);
			printGaData(gaData);
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	@Test
	public void testHttpPost(){
	
		String _accessToken;
		CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httppost = new HttpPost("https://accounts.google.com/o/oauth2/token");
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("code", "4/nC62QkyTUikDLJxukDmxHDhwuX1Z.khZp4x-GOQ4fgrKXntQAax0e_a78gwI"));
		nvps.add(new BasicNameValuePair("client_id", cliendId));
		nvps.add(new BasicNameValuePair("client_secret", clientSecret));
		nvps.add(new BasicNameValuePair("redirect_uri", redirectUri));
		nvps.add(new BasicNameValuePair("grant_type", "authorization_code"));
		
		UrlEncodedFormEntity urlEntity = new UrlEncodedFormEntity(nvps, Consts.UTF_8);
		httppost.setEntity(urlEntity);
		
		try {
			CloseableHttpResponse response = httpclient.execute(httppost);
		
			int responseCode = response.getStatusLine().getStatusCode();
			logger.info("responseCode {} ", responseCode);
			
			if(responseCode == 200){
				
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					InputStream instream = entity.getContent();
					try {
						String responseBody = IOUtils.toString(instream);
						logger.info(responseBody);
						JSONObject json = (JSONObject)JSONValue.parse(responseBody);
						try {
							_accessToken = json.get("access_token").toString();
						} catch (Exception e) {
							//실패
						}
					} finally {
						instream.close();
					}
				}
				
			} else {
				//실패
			}
			response.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static GaData executeDataQuery(Analytics analytics, String profileId) throws IOException {
		return analytics.data().ga().get("ga:" + profileId, // Table Id. ga: +
															// profile id.
				"2013-10-01", // Start date.
				"2013-10-26", // End date.
				"ga:visits,ga:bounces") // Metrics.
				.setDimensions("ga:date")
				// .setSort("-ga:visits,ga:source")
				// .setFilters("ga:medium==organic")
				.setMaxResults(100).execute();
	}

	private static void printGaData(GaData results) {
		System.out.println("printing results for profile: " + results.getProfileInfo().getProfileName());

		if (results.getRows() == null || results.getRows().isEmpty()) {
			System.out.println("No results Found.");
		} else {

			// Print column headers.
			for (ColumnHeaders header : results.getColumnHeaders()) {
				System.out.printf("%30s", header.getName());
			}
			System.out.println();

			// Print actual data.
			for (List<String> row : results.getRows()) {
				for (String column : row) {
					System.out.printf("%30s", column);
				}
				System.out.println();
			}

			System.out.println();
		}
	}

}