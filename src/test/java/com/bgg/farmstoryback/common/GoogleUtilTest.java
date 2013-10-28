package com.bgg.farmstoryback.common;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.analytics.Analytics;
import com.google.api.services.analytics.model.GaData;
import com.google.api.services.analytics.model.GaData.ColumnHeaders;

public class GoogleUtilTest {

	Logger logger = LoggerFactory.getLogger(GoogleUtilTest.class);
	String cliendId = "724483965228-j599oijfnsl3r3m3a8npsu0hlsa4544d.apps.googleusercontent.com";
	String clientSecret = "hu4HWRf2NxHFq5LNi58v1ILf";
	String profileId = "78189260";
	String accessToken = "ya29.AHES6ZRgkQa3rXynsOmvQ-uGFps4qCgz4vtPK9JuFr8U-XE"; // 15:10분에 받음
	/** OAuth 2.0 scopes. */
	private static final List<String> SCOPES = Arrays.asList("https://www.googleapis.com/auth/userinfo.profile", "https://www.googleapis.com/auth/userinfo.email");

	GoogleApiUtil googleApiUtil = new GoogleApiUtil();
	
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