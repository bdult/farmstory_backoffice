package com.bgg.farmstoryback.service;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bgg.farmstoryback.common.DateUtil;
import com.bgg.farmstoryback.common.GoogleApiUtil;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.analytics.Analytics;
import com.google.api.services.analytics.model.GaData;
import com.google.api.services.analytics.model.GaData.ColumnHeaders;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class StatsServiceTest {

	Logger logger = LoggerFactory.getLogger(getClass());
			
	@Autowired
	private GoogleApiUtil googleApiUtil;
	
	@Autowired
	private DateUtil dateUtil;
	
	@Test
	public void test() {
		
		String metrics = "ga:visitors,ga:visits,ga:avgTimeOnSite,ga:pageviews,ga:avgTimeOnPage";
		GaData results = googleApiUtil.getAverage(metrics, dateUtil.add(-30), dateUtil.today());
		
		if(results == null){
			logger.error("토큰 에러");
		} else {
			
			if (results.getRows() == null || results.getRows().isEmpty()) {
				System.out.println("결과없음.");
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
	
	 @Test
     public void testA() {

             GoogleCredential credential = new GoogleCredential().setAccessToken("ya29.AHES6ZSsuYPjtFGnaNttnxH1Hg_siRXhx6FH3qWvEhcrcdg");

             try {
                     Analytics analytics = new Analytics.Builder(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance(), credential).build();

                     GaData gaData = executeDataQuery(analytics, "78189260");
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
