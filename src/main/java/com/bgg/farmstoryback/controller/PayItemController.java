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
public class PayItemController {
	
	private Logger logger = LoggerFactory.getLogger(PayItemController.class);
	
	@RequestMapping(value = "payitem/manage.do", method = RequestMethod.POST)
	public String manage(Model model, @RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "payitem/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter){
			return null;
	}
	
	@RequestMapping(value = "payitem/list.do", method = RequestMethod.POST)
	public String list(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "payitem/detail.do", method = RequestMethod.POST)
	public String detail(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "payitem/modify.do", method = RequestMethod.POST)
	public String modify(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "payitem/delete.do", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	
	

	
	
}
