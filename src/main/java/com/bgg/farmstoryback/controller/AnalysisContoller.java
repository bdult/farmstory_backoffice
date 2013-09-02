package com.bgg.farmstoryback.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AnalysisContoller {
	
	private Logger logger = LoggerFactory.getLogger(AnalysisContoller.class);
	
	@RequestMapping(value = "analy/manage.do", method = RequestMethod.GET)
	public String manage(Model model, @RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "analy/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "analy/list.do", method = RequestMethod.POST)
	public @ResponseBody String list(@RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "analy/detail.do", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	
	@RequestMapping(value = "analy/modify.do", method = RequestMethod.POST)
	public @ResponseBody String modify(@RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "analy/delete.do", method = RequestMethod.POST)
	public @ResponseBody String delete(@RequestParam Map<String,Object> parameter) {
		return null;
	}
}
