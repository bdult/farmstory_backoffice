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

import com.bgg.farmstoryback.service.CategoryService;

@Controller
public class CategoryController {
	
	private Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "category.do", method = RequestMethod.GET)
	public String category(Model model) {
		
		return "category/list";
	}
	
	
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
	@RequestMapping(value = "cate/list.do", method = RequestMethod.GET)
	public String listAll(Model model, int level) {
		List<Map> cateList  = null;
		if(level == 0){
			cateList = categoryService.list();
		}else{
			cateList = categoryService.listByLevel(level);
		}
		return "category/list";
	}
	
	@RequestMapping(value = "cate/create.do", method = RequestMethod.POST)
	public String create(Map<String, String> cateInfo) {
		categoryService.create(cateInfo);
		return null;
	}


	@RequestMapping(value = "cate/modify.do", method = RequestMethod.POST)
	public String modify(Model model, Map<String, String> cateInfo) {
		categoryService.modify(cateInfo);
		return null;
	}

	@RequestMapping(value = "cate/detail.do")
	public String detail(Model model, Map<String, String> cateInfo) {
		categoryService.detail(cateInfo);
		return null;
	}
	
}
