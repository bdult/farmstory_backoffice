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

		Map pageInfo = pageUtil.pageLink(boardService.contentsTotalCount(paramMap), paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		pageInfo.putAll(paramMap);
		
		model.addAttribute("questionList", boardService.contentsListByBoardId(pageInfo));
		
		return "cscenter/questionManage";
	}
	
	@RequestMapping(value = "cscenter/questionInfo.do")
	public String questionInfo(Model model, @RequestParam Map<String,Object> paramMap) {
		
//		model.addAttribute("comment_yn", paramMap.get("comment_yn"));
		model.addAttribute("contentsList", boardService.contentsDeail(paramMap));
//		model.addAttribute("commentsList", boardService.commentList(paramMap));
		
		return "cscenter/questionInfo";
	}

	@RequestMapping(value = "cscenter/questionAddComments.do")
	public String questionAddComments(Model model, @RequestParam Map<String,Object> paramMap) {
		
		boardService.modifyContents(paramMap);
//		boardService.addComment(paramMap);
		
		return "redirect:/cscenter/questionManage.do";
	}
	
	@RequestMapping(value = "cscenter/noticeManage.do")
	public String noticeManage(Model model, @RequestParam Map<String,Object> paramMap) {

		paramMap.put("board_id", "1");

		Map pageInfo = pageUtil.pageLink(boardService.contentsTotalCount(paramMap), paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		pageInfo.putAll(paramMap);

		model.addAttribute("noticeList", boardService.contentsListByBoardId(pageInfo));
		
		return "cscenter/noticeManage";
	}
	
	@RequestMapping(value = "cscenter/noticeInfo.do")
	public String noticeInfo(Model model, @RequestParam Map<String,Object> paramMap) {

		model.addAttribute("contentsList", boardService.contentsDeail(paramMap));
		
		return "cscenter/noticeInfo";
	}
	
	@RequestMapping(value = "cscenter/noticeCreateContents.do")
	public String noticeCreateContents(Model model, @RequestParam Map<String,Object> paramMap) {

		paramMap.put("board_id", "1");
		boardService.addContents(paramMap);
		
		return "redirect:/cscenter/noticeManage.do";
	}
	
	@RequestMapping(value = "cscenter/noticeModifyContents.do")
	public String noticeModifyContents(Model model, @RequestParam Map<String,Object> paramMap) {

		boardService.modifyContents(paramMap);
		
		return "redirect:/cscenter/noticeManage.do";
	}
	
	@RequestMapping(value = "cscenter/noticeDeleteContents.do")
	public String noticeDeleteContents(Model model, @RequestParam Map<String,Object> paramMap) {

		boardService.deleteContents(paramMap);
		
		return "redirect:/cscenter/noticeManage.do";
	}


	@RequestMapping(value = "cscenter/faqManage.do")
	public String faqManage(Model model, @RequestParam Map<String,Object> paramMap) {

		paramMap.put("board_id", "5");

		Map pageInfo = pageUtil.pageLink(boardService.contentsTotalCount(paramMap), paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		pageInfo.putAll(paramMap);

		model.addAttribute("cateList",boardService.categoryList());
		model.addAttribute("faqList", boardService.contentsListByBoardId(pageInfo));
		
		return "cscenter/faqManage";
	}
	
	@RequestMapping(value = "cscenter/faqInfo.do")
	public String faqInfo(Model model, @RequestParam Map<String,Object> paramMap) {

		model.addAttribute("cateList",boardService.categoryList());
		model.addAttribute("contentsList", boardService.contentsDeail(paramMap));
		
		return "cscenter/faqInfo";
	}
	
	@RequestMapping(value = "cscenter/faqCreateContents.do")
	public String faqCreateContents(Model model, @RequestParam Map<String,Object> paramMap) {

		paramMap.put("board_id", "5");
		boardService.addContents(paramMap);
		
		return "redirect:/cscenter/faqManage.do";
	}
	
	@RequestMapping(value = "cscenter/faqModifyContents.do")
	public String faqModifyContents(Model model, @RequestParam Map<String,Object> paramMap) {

		boardService.modifyContents(paramMap);
		
		return "redirect:/cscenter/faqManage.do";
	}
	
	@RequestMapping(value = "cscenter/faqDeleteContents.do")
	public String faqDeleteContents(Model model, @RequestParam Map<String,Object> paramMap) {

		boardService.deleteContents(paramMap);
		
		return "redirect:/cscenter/faqManage.do";
	}
}
