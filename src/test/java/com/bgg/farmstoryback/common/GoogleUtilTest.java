package com.bgg.farmstoryback.common;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Arrays;

import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;

public class GoogleUtilTest {

	Logger logger = LoggerFactory.getLogger(GoogleUtilTest.class);
	
	@Test
	public void test() {

		HelloAnalyticsApi helloAnalyticsApi = new HelloAnalyticsApi();
		logger.info(helloAnalyticsApi.toString());
	}
	
	public class HelloAnalyticsApi{
//		private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
//
//		private static final JsonFactory JSON_FACTORY = new JacksonFactory();
//
//		private static Analytics initializeAnalytics() throws Exception {
//		  Credential credential = OAuth2Native.authorize(
//		      HTTP_TRANSPORT, JSON_FACTORY, new LocalServerReceiver(),
//		      Arrays.asList(AnalyticsScopes.ANALYTICS_READONLY));
//
//		  // ...
//		}
	}

}
