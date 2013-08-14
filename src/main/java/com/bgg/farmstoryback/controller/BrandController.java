package com.bgg.farmstoryback.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.service.BrandService;
import com.bgg.farmstoryback.service.CategoryService;

@Controller
public class BrandController {
	
	private Logger logger = LoggerFactory.getLogger(BrandController.class);
	
	@Autowired
	private BrandService brandService;
	
	@RequestMapping(value = "brand/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter) {
		System.out.println((String)parameter.get("brand_nm"));
		brandService.create(parameter);
		return "redirect:/cate/manage.do";
	}
	
	@RequestMapping(value = "brand/create.ajax", method = RequestMethod.POST)
	public @ResponseBody String createAjax(Model model, Map<String, String> cateInfo) {
			
		return "{code:ok}";
	}
}
