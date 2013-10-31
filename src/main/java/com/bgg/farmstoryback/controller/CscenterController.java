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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CscenterController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "cscenter/questionManage.do")
	public String questionManage(Model model, @RequestParam Map<String,Object> paramMap) {
		
		return "cscenter/questionManage";
	}
	
	@RequestMapping(value = "cscenter/questionInfo.do")
	public String questionInfo(Model model, @RequestParam Map<String,Object> paramMap) {
		
		return "cscenter/questionInfo";
	}

	@RequestMapping(value = "cscenter/noticeManage.do")
	public String noticeManage(Model model, @RequestParam Map<String,Object> paramMap) {
		
		return "cscenter/noticeManage";
	}
	
	@RequestMapping(value = "cscenter/noticeInfo.do")
	public String noticeInfo(Model model, @RequestParam Map<String,Object> paramMap) {
		
		return "cscenter/noticeInfo";
	}

	@RequestMapping(value = "cscenter/faqManage.do")
	public String faqManage(Model model, @RequestParam Map<String,Object> paramMap) {
		
		return "cscenter/faqManage";
	}
	
	@RequestMapping(value = "cscenter/faqInfo.do")
	public String faqInfo(Model model, @RequestParam Map<String,Object> paramMap) {
		
		return "cscenter/faqInfo";
	}
}
