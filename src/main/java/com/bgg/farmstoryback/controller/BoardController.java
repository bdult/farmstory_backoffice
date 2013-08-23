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
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@RequestMapping(value = "board/manage.do", method = RequestMethod.GET)
	public String manage(Model model, @RequestParam Map<String,Object> parameter) {
		return "board/manage";
	}
	
	@RequestMapping(value = "board/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "board/list.do", method = RequestMethod.POST)
	public @ResponseBody String list(@RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "board/detail.do", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	
	@RequestMapping(value = "board/modify.do", method = RequestMethod.POST)
	public @ResponseBody String modify(@RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "board/delete.do", method = RequestMethod.POST)
	public @ResponseBody String delete(@RequestParam Map<String,Object> parameter) {
		return null;
	}
}
