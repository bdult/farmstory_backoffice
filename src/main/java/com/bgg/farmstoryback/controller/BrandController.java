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
import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.service.BrandService;
import com.mysql.jdbc.StringUtils;

@Controller
public class BrandController {
	
	private Logger logger = LoggerFactory.getLogger(BrandController.class);
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private PageUtil pageUtil;
	
	@RequestMapping(value = "brand/manage.do")
	public String manage(Model model, @RequestParam int pageNum) {

		if(pageNum == 0) pageNum =1;
		
		List<Map> brandList = brandService.listByPageNum(pageNum);
		int totalCount = brandService.totalCount();
		
		Map pageInfo = pageUtil.pageLink(totalCount, pageNum);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		model.addAttribute("brandList", brandList);
		
		return "brand/manage";
	}
	
	@RequestMapping(value = "brand/search.do")
	public String search(Model model, String search) {
		
		if(StringUtils.isNullOrEmpty(search)){
			return "redirect:manage.do?pageNum=1";
		}
		
		List<Map> brandList = brandService.search(search);
		model.addAttribute("brandList", brandList);
		model.addAttribute("search", search);
		return "brand/search";
	}
	
	@RequestMapping(value = "brand/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter) {
		brandService.create(parameter);
		return "redirect:manage.do?pageNum=1";
	}
	
	@RequestMapping(value = "brand/detail.do")
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		brandService.detail(parameter);
		return "brand/info";
	}
	
	@RequestMapping(value = "brand/delete.do")
	public String delete(Model model, @RequestParam Map<String,Object> parameter) {
		brandService.delete(parameter);
		return "redirect:manage.do?pageNum=1";
	}
	
	@RequestMapping(value = "brand/create.ajax", method = RequestMethod.POST)
	public @ResponseBody String createAjax(@RequestParam Map<String,Object> parameter) {
		brandService.create(parameter);
		return "{code:ok}";
	}
	
	@RequestMapping(value = "brand/list.ajax",  produces = "application/json;charset=UTF-8")
	public @ResponseBody String listAjax(Model model, @RequestParam Map<String,Object> parameter) {
		
		List<Map> brandList = brandService.list();
		String brandListJson = jsonMaker.generateMapList("data", brandList);
		logger.info("response={}", brandListJson);
		return brandListJson;
	}
}
