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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.common.JsonResponseMaker;
import com.bgg.farmstoryback.service.ContentsService;


@Controller
public class ContentsController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ContentsService contentsService;
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
	@RequestMapping(value = "contents/manage.do")
	public String manage(Model model) {
		List<Map> list = contentsService.list();
		model.addAttribute("list", list);
		return "contents/manage";
	}
	
	@RequestMapping(value = "contents/search.do")
	public String search(Model model, String search) {
		List<Map> list = contentsService.searchByName(search);
		model.addAttribute("list", list);
		return "contents/manage";
	}
	
	@RequestMapping(value = "contents/detail.do")
	public String detail(Model model, @RequestParam Map<String,String> parameter) {
		logger.info("detail = {}", parameter);
		Map contentsDetail =  contentsService.detail(parameter.get("contents_id"));
		
		model.addAttribute("data", contentsDetail);
		
		return "contents/info";
	}
	
	@RequestMapping(value = "contents/modify.do")
	public String modify(Model model, @RequestParam Map<String,String> parameter) {
		logger.info("modify = {}", parameter);
		contentsService.modify(parameter);
		Map contentsDetail =  contentsService.detail(parameter.get("contents_id"));
		model.addAttribute("data", contentsDetail);
		return "contents/info";
	}
	
	@RequestMapping(value = "contents/create.do", method = RequestMethod.POST)
	public String createdb(Model model, @RequestParam Map<String,String> parameter) {
		contentsService.create(parameter);
		return "redirect:manage.do";
	}
	
	@RequestMapping(value = "contents/delete.do")
	public String delete(Model model, @RequestParam Map<String,Object> parameter){
		contentsService.delete(parameter);
		return "redirect:manage.do";
	}
}
