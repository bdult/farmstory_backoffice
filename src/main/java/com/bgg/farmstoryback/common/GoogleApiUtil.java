package com.bgg.farmstoryback.common;

import org.springframework.stereotype.Component;

@Component
public class GoogleApiUtil {

	//https://cloud.google.com/console
	//ozworld installed 정보
	private final String cliendId = "724483965228-j599oijfnsl3r3m3a8npsu0hlsa4544d.apps.googleusercontent.com";
	private final String scope = "https://www.googleapis.com/auth/analytics.readonly";
	private final String redirectUri = "urn:ietf:wg:oauth:2.0:oob";
	
	private final String profileId = "78189260";
	private final String clientSecret = "hu4HWRf2NxHFq5LNi58v1ILf";
	private final String accessToken = "ya29.AHES6ZRgkQa3rXynsOmvQ-uGFps4qCgz4vtPK9JuFr8U-XE"; // 2013-10-28 오후 4시쯤 받음
	
	public String getCodeUrl(){
		return String.format("https://accounts.google.com/o/oauth2/auth?"
				+ "client_id=%s&"
				+ "scope=%s&"
				+ "redirect_uri=%s&"
				+ "response_type=code&access_type=offline", cliendId, scope, redirectUri);
	}
}
