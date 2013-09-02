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
	public ModelAndView manage(Model model, @RequestParam Map<String,Object> parameter) {
		ModelAndView mav = new ModelAndView();
		List<Map> list = contentsService.list();
		mav.addObject("list", list);
		mav.setViewName("contents/manage");
		
		return mav;
	}
	
	@RequestMapping(value = "contents/create.do")
	public ModelAndView create(Model model){
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	@RequestMapping(value = "contents/update.do")
	public ModelAndView create(Model model, String contents_id){
		
		ModelAndView mav = new ModelAndView();	
//		mav.addObject("mode", "update");
//		ContentsDTO data = contentsService.detail(contents_id);
//		mav.addObject("data", data );
//		mav.setViewName("contents/create");
		return mav;
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
	
	@RequestMapping(value = "contents/createdb.do", method = RequestMethod.POST)
	public ModelAndView createdb(Model model, @RequestParam Map<String,String> parameter) {

		ModelAndView mav = new ModelAndView();	
		
		return mav;
	}
	
	@RequestMapping(value = "contents/delete.do", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
	
	@RequestMapping(value = "contents/seriesList.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody String seriesListAjax(Model model, @RequestParam Map<String,Object> parameter){
		List<Map> seriesList = contentsService.seriesList();
		String seriesListJson = jsonMaker.generateMapList("data", seriesList);
		logger.info("response={}", seriesListJson);
		return seriesListJson;
	}
}
