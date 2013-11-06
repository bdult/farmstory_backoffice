package com.bgg.farmstoryback.controller;

import java.util.HashMap;
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
import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.service.CodeService;
import com.bgg.farmstoryback.service.ContentsService;
import com.mysql.jdbc.StringUtils;


@Controller
public class CodeController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
	@Autowired
	private PageUtil pageUtil;
	
	@RequestMapping(value = "code/manage.do")
	public String manage(Model model,  @RequestParam Map parameter) {
		
		Map pageInfo = pageUtil.pageLink(codeService.totalCount(parameter), parameter);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		model.addAttribute("list", codeService.list(pageInfo));
		return "code/manage";
	}
	
	@RequestMapping(value = "code/detail.do")
	public String detail(Model model, @RequestParam Map<String,String> parameter) {
		Map codeDetail =  codeService.detail(parameter.get("code_idx"));
		model.addAttribute("data", codeDetail);
		return "code/info";
	}
	
	@RequestMapping(value = "code/delete.do")
	public String delete(Model model, @RequestParam Map<String,Object> parameter){
		codeService.delete(parameter);
		return "redirect:manage.do";
	}
	
	@RequestMapping(value = "code/modify.do")
	public String modify(Model model, @RequestParam Map<String,String> parameter) {
		logger.info("modify = {}", parameter);
		codeService.modify(parameter);
		Map codeDetail =  codeService.detail(parameter.get("code_idx"));
		model.addAttribute("data", codeDetail);
		return "code/info";
	}

}
