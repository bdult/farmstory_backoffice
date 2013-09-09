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
		
		logger.info("{}", parameter);
		
		int pageNum=0;
		if(parameter.get("pageNum") == null){
			pageNum=1;
		}else{
			pageNum = Integer.parseInt((String)parameter.get("pageNum"));
		}
		int totalCount = codeService.totalCount(parameter);
		
		Map pageInfo = pageUtil.pageLink(totalCount, pageNum);
		pageInfo.put("startNo", pageUtil.getStartRowNum(pageNum));
		pageInfo.put("perPage", pageUtil.PER_PAGE);
		pageInfo.put("search", parameter.get("search"));
		
		List<Map> list = codeService.list(pageInfo);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		model.addAttribute("search", parameter.get("search"));
		model.addAttribute("list", list);
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
//	
//	
//	
//	@RequestMapping(value = "contents/createView.do", method = RequestMethod.GET)
//	public String createView(Model model) {
//		return "contents/create";
//	}
//	
//	@RequestMapping(value = "contents/create.do", method = RequestMethod.POST)
//	public String createdb(Model model, @RequestParam Map<String,String> parameter) {
//		contentsService.create(parameter);
//		return "redirect:manage.do?pageNum=1";
//	}
//	

}
