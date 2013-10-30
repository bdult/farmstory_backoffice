package com.bgg.farmstoryback.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bgg.farmstoryback.common.DateUtil;
import com.bgg.farmstoryback.service.StatsService;
import com.google.api.services.analytics.model.GaData;
import com.google.api.services.analytics.model.GaData.ColumnHeaders;

@Controller
public class StatsController {
	
	private Logger logger = LoggerFactory.getLogger(StatsController.class);
	
	@Autowired
	private StatsService statsService;
	
	@Autowired
	private DateUtil dateUtil;
	
	@RequestMapping(value = "/stats/getCode.do")
	public String getCode(Model model,  @RequestParam Map parameter) {
		
		return String.format("redirect:%s", statsService.getCodeUrl());
	}
	
	@RequestMapping(value = "/stats/getAccessToken.do")
	public String getAccessToken(Model model,  @RequestParam Map<String, String> parameter) {
		
		model.addAttribute("accessToken", statsService.getAccessToken(parameter.get("code")));
		return "stats/setting";
	}
	
	@RequestMapping(value = "/stats/checkAccessToken.do")
	public String checkAccessToken(Model model,  @RequestParam Map<String, String> parameter) {
		
		model.addAttribute("isValidAccessToken", statsService.checkAccessToken());
		return "stats/setting";
	}
	
	@RequestMapping(value = "/stats/revoke.do")
	public String revoke(Model model,  @RequestParam Map<String, String> parameter) {
		
		return String.format("redirect:https://accounts.google.com/o/oauth2/revoke?token=%s", statsService.getAccessToken());
	}
	
	@RequestMapping(value = "/stats/manage.do")
	public String manage(Model model,  @RequestParam Map parameter) {
		
		{//선차트용 데이터 가져오기
			String dimension = "ga:date"; //year,month,week
			model.addAttribute("lineChartData", statsService.getVisitor(dimension, dateUtil.add(-30), dateUtil.today()));
		}
		
		{//평균정보 데이터 가져오기
			
			String metrics = "ga:visitors,ga:visits,ga:avgTimeOnSite,ga:pageviews,ga:avgTimeOnPage";
			model.addAttribute("averageData", statsService.getAverage(metrics, dateUtil.add(-30), dateUtil.today()));
		}
		
		return "stats/manage";
	}
	
	@RequestMapping(value = "/stats/setting.do")
	public String setting(Model model,  @RequestParam Map parameter) {
		
		return "stats/setting";
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
