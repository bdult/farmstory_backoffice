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
	
	@RequestMapping(value = "/google/code.do")
	public String code(Model model,  @RequestParam Map parameter) {
		
		return String.format("redirect:%s", googleApiUtil.getCodeUrl());
	}
	
}
