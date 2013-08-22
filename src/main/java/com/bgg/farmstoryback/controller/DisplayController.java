package com.bgg.farmstoryback.controller;

import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DisplayController {
	
	private Logger logger = LoggerFactory.getLogger(DisplayController.class);
	
	@RequestMapping(value = "display/manage.do", method = RequestMethod.POST)
	public String manage(Model model, @RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "display/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter){
			return null;
	}
	
	@RequestMapping(value = "display/list.do", method = RequestMethod.POST)
	public String list(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "display/detail.do", method = RequestMethod.POST)
	public String detail(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "display/modify.do", method = RequestMethod.POST)
	public String modify(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "display/delete.do", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
}