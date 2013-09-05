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
import com.bgg.farmstoryback.service.CategoryService;

@Controller
public class CategoryController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
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
	
	@RequestMapping(value = "category/create.do", method = RequestMethod.POST)
	public String create( @RequestParam Map<String,String> categoryInfo) {
		logger.info("parameter=", categoryInfo);
		categoryService.create(categoryInfo);
		return "redirect:/category/manage.do";
	}

	@RequestMapping(value = "category/modify.do", method = RequestMethod.POST)
	public String modify(@RequestParam Map<String,Object> categoryInfo) {
		logger.info("parameter=", categoryInfo);
		categoryService.modify(categoryInfo);
		return "redirect:/category/manage.do";
	}
	
	@RequestMapping(value = "category/delete.do", method = RequestMethod.POST)
	public String delete(@RequestParam Map<String,Object> categoryInfo) {
		logger.info("parameter=", categoryInfo);
		categoryService.delete((String)categoryInfo.get("cate_id"));
		return "redirect:/category/manage.do";
	}

	
	@RequestMapping(value = "category/detail.do")
	public String detail(Model model, String cateId) {
		categoryService.detail(cateId);
		return null;
	}
	
	// AJAX
	@RequestMapping(value = "category/list.ajax",  produces = "application/json;charset=UTF-8")
	public @ResponseBody String listAjax(int id) {
		
		List<Map> cateList  = null;
		if(id == 0){
			cateList = categoryService.list();
		}else{
			cateList = categoryService.listOfChild(id);
		}
		String cateJsonList = jsonMaker.generateCateListForTree(cateList);
		logger.info("{}", cateJsonList);
		return cateJsonList;
	}
	@RequestMapping(value = "category/parentCateList.ajax",  produces = "application/json;charset=UTF-8")
	public @ResponseBody String parentCateList(@RequestParam Map<String,String> categoryInfo) {
		logger.info("parameter=", categoryInfo);
		List<Map> parentList = categoryService.parentCateList(categoryInfo);
		String cateJsonList = jsonMaker.generateMapList("data", parentList);
		return cateJsonList;
	}
	
}
