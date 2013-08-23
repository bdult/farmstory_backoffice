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

import com.bgg.farmstoryback.service.BrandService;

@Controller
public class BrandController {
	
	private Logger logger = LoggerFactory.getLogger(BrandController.class);
	
	@Autowired
	private BrandService brandService;
	
	@RequestMapping(value = "brand/manage.do", method = RequestMethod.GET)
	public String manage(Model model, @RequestParam Map<String,Object> parameter) {
		
		List<Map> brandList = brandService.list();
		model.addAttribute("brandList", brandList);
		
		return "brand/manage";
	}
	
	@RequestMapping(value = "brand/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter) {
		brandService.create(parameter);
		return "redirect:/cate/manage.do";
	}
	
	@RequestMapping(value = "brand/detail.do", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		brandService.delete(parameter);
		return "brand/detail";
	}
	
	@RequestMapping(value = "brand/create.ajax", method = RequestMethod.POST)
	public @ResponseBody String createAjax(@RequestParam Map<String,Object> parameter) {
		brandService.create(parameter);
		return "{code:ok}";
	}
}
