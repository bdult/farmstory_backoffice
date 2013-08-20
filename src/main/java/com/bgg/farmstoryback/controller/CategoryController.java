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
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.common.JsonResponseMaker;
import com.bgg.farmstoryback.common.LogPrinter;
import com.bgg.farmstoryback.service.BrandService;
import com.bgg.farmstoryback.service.CategoryService;
import com.mysql.jdbc.StringUtils;

@Controller
public class CategoryController {
	
	private Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
	@Autowired
	private LogPrinter logPrinter;
	
	/**
	 * 	Result
			Key : CATE_NM -> Value : test_modify2
			Key : REG_DT -> Value : 2013-08-07 13:45:17.0
			Key : MOD_DT -> Value : 2013-08-07 13:45:17.0
			Key : PARENT_CATE_ID -> Value : 
			Key : CATE_LEVEL -> Value : 1
			Key : CATE_ID -> Value : C_954682af87414cca86c18a70754b5b58
	 * @return
	 */
	@RequestMapping(value = "category/manage.do", method = RequestMethod.GET)
	public String manage() {
		
//		List<Map> cateList = categoryService.list();
//		model.addAttribute("cateList", cateList);
		
		return "category/manage";
	}
	
	@RequestMapping(value = "category/list.ajax",  produces = "application/json;charset=UTF-8")
	public @ResponseBody String listAjax(int id) {
		
		List<Map> cateList  = null;
		if(id == 0){
			cateList = categoryService.list();
		}else{
			cateList = categoryService.listOfChild(id);
		}
		String cateJsonList = jsonMaker.generateCateList("data", cateList);
		
		return cateJsonList;
	}
	
	@RequestMapping(value = "category/create.do", method = RequestMethod.POST)
	public String create( @RequestParam Map<String,String> categoryInfo) {
		logPrinter.printMap(categoryInfo);
		categoryService.create(categoryInfo);
		return "redirect:/category/manage.do";
	}

	@RequestMapping(value = "category/modify.do", method = RequestMethod.POST)
	public String modify(@RequestParam Map<String,Object> categoryInfo) {
		logPrinter.printMap(categoryInfo);
		categoryService.modify(categoryInfo);
		return "redirect:/category/manage.do";
	}
	
	@RequestMapping(value = "category/delete.do", method = RequestMethod.POST)
	public String delete(@RequestParam Map<String,Object> categoryInfo) {
		logPrinter.printMap(categoryInfo);
		categoryService.delete((String)categoryInfo.get("cate_id"));
		return "redirect:/category/manage.do";
	}

	
	@RequestMapping(value = "category/detail.do")
	public String detail(Model model, String cateId) {
		categoryService.detail(cateId);
		return null;
	}
	
}
