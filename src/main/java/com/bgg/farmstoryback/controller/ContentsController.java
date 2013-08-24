package com.bgg.farmstoryback.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.service.ContentsService;


@Controller
public class ContentsController {
	
	private Logger logger = LoggerFactory.getLogger(ContentsController.class);
	
	@Autowired
	private ContentsService contentsService;
	
	@RequestMapping(value = "contents/manage.do")
	public ModelAndView manage(Model model, @RequestParam Map<String,Object> parameter) {
		ModelAndView mav = new ModelAndView();
		List<Map> list = contentsService.list();
		mav.addObject("list", list);
		mav.setViewName("contents/manage");
		
		return mav;
	}
	
	@RequestMapping(value = "contents/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter){
			return null;
	}
	
	@RequestMapping(value = "contents/list.do")
	public String list(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "contents/detail.do", method = RequestMethod.POST)
	public String detail(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "contents/modify.do", method = RequestMethod.POST)
	public String modify(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "contents/delete.do", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
}
