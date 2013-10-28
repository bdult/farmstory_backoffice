package com.bgg.farmstoryback.common;

import java.io.InputStream;
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
import org.slf4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class GoogleApiUtil {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
			
	//https://cloud.google.com/console
	//ozworld installed 정보
	private final String cliendId = "724483965228-j599oijfnsl3r3m3a8npsu0hlsa4544d.apps.googleusercontent.com";
	private final String scope = "https://www.googleapis.com/auth/analytics.readonly";
	private final String redirectUri = "urn:ietf:wg:oauth:2.0:oob";
	
	private final String profileId = "78189260";
	private final String clientSecret = "hu4HWRf2NxHFq5LNi58v1ILf";
	//private final String accessToken = "ya29.AHES6ZRgkQa3rXynsOmvQ-uGFps4qCgz4vtPK9JuFr8U-XE"; // 2013-10-28 오후 4시쯤 받음
	
	public String getCodeUrl(){
		return String.format("https://accounts.google.com/o/oauth2/auth?"
				+ "client_id=%s&"
				+ "scope=%s&"
				+ "redirect_uri=%s&"
				+ "response_type=code&access_type=offline", cliendId, scope, redirectUri);
	}
	
	public String getAccessToken(String code){
		
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
			
			if(responseCode == 200){
				
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					InputStream instream = entity.getContent();
					try {
						String responseBody = IOUtils.toString(instream);
						logger.debug(responseBody);
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
		
		logger.info("_accessToken {}", _accessToken);
		return _accessToken;
	}
}
