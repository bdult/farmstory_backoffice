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
public class PayController {
	
	private Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@RequestMapping(value = "pay/manage.do", method = RequestMethod.POST)
	public String manage(Model model, @RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "pay/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter){
			return null;
	}
	
	@RequestMapping(value = "pay/list.do", method = RequestMethod.POST)
	public String list(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "pay/detail.do", method = RequestMethod.POST)
	public String detail(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "pay/modify.do", method = RequestMethod.POST)
	public String modify(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "pay/delete.do", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}

	

	
	
}
