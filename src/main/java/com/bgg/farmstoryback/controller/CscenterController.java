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

import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.service.BoardService;

@Controller
public class CscenterController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private BoardService boardService;

	@Autowired
	private PageUtil pageUtil;
	
	@RequestMapping(value = "cscenter/questionManage.do")
	public String questionManage(Model model, @RequestParam Map<String,Object> paramMap) {
		
		paramMap.put("board_id", "3");

		Map pageInfo = pageUtil.pageLink(boardService.totalCount(paramMap), paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		pageInfo.putAll(paramMap);
		
		model.addAttribute("questionList", boardService.contentsListByBoardId(pageInfo));
		
		return "cscenter/questionManage";
	}
	
	@RequestMapping(value = "cscenter/questionInfo.do")
	public String questionInfo(Model model, @RequestParam Map<String,Object> paramMap) {
		
		if(paramMap.get("member_id") == null){
			model.addAttribute("viewType", "detailView");
		}else {
			model.addAttribute("viewType", "modifyView");
		}
		
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
