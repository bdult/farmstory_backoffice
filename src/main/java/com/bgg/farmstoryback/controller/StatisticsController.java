package com.bgg.farmstoryback.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bgg.farmstoryback.common.GoogleApiUtil;

@Controller
public class StatisticsController {
	
	private Logger logger = LoggerFactory.getLogger(StatisticsController.class);
	
	@Autowired
	private GoogleApiUtil googleApiUtil;
	
	@RequestMapping(value = "/stats/getCode.do")
	public String getCode(Model model,  @RequestParam Map parameter) {
		
		return String.format("redirect:%s", googleApiUtil.getCodeUrl());
	}
	
	@RequestMapping(value = "/stats/getAccessToken.do")
	public String getAccessToken(Model model,  @RequestParam Map<String, String> parameter) {
		
		model.addAttribute("accessToken", googleApiUtil.getAccessToken(parameter.get("code")));
		return "stats/setting";
	}
	
	@RequestMapping(value = "/stats/revoke.do")
	public String revoke(Model model,  @RequestParam Map<String, String> parameter) {
		
		String accessToken = parameter.get("accessToken");
		return String.format("redirect:https://accounts.google.com/o/oauth2/revoke?token=%s", accessToken);
	}
	
	@RequestMapping(value = "/stats/manage.do")
	public String manage(Model model,  @RequestParam Map parameter) {
		
		return "stats/manage";
	}
	
	@RequestMapping(value = "/stats/setting.do")
	public String setting(Model model,  @RequestParam Map parameter) {
		
		return "stats/setting";
	}
	
}
