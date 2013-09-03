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

import com.bgg.farmstoryback.common.JsonResponseMaker;
import com.bgg.farmstoryback.service.BrandService;
import com.bgg.farmstoryback.service.SeriesService;

@Controller
public class SeriesController {
	
	private Logger logger = LoggerFactory.getLogger(SeriesController.class);
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
	@Autowired
	private SeriesService seriesService;
	
	@RequestMapping(value = "series/manage.do", method = RequestMethod.GET)
	public String manage(Model model) {
		
		List<Map> brandList = seriesService.list();
		model.addAttribute("seriesList", brandList);
		
		return "series/manage";
	}
	
	@RequestMapping(value = "series/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter) {
		seriesService.create(parameter);
		return manage(model);
	}
	
	@RequestMapping(value = "series/detail.do")
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		seriesService.detail(parameter);
		return "series/detail";
	}
	
	@RequestMapping(value = "series/delete.do")
	public String delete(Model model, @RequestParam Map<String,Object> parameter) {
		seriesService.delete(parameter);
		return manage(model);
	}
	
	@RequestMapping(value = "series/create.ajax", method = RequestMethod.POST)
	public @ResponseBody String createAjax(@RequestParam Map<String,Object> parameter) {
		seriesService.create(parameter);
		return "{code:ok}";
	}
	
	@RequestMapping(value = "series/list.ajax",  produces = "application/json;charset=UTF-8")
	public @ResponseBody String listAjax(Model model, @RequestParam Map<String,Object> parameter) {
		
		List<Map> brandList = seriesService.list();
		String brandListJson = jsonMaker.generateMapList("data", brandList);
		logger.info("response={}", brandListJson);
		return brandListJson;
	}
}
