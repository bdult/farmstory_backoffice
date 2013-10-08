package com.bgg.farmstoryback.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.service.BoardContentsService;
import com.bgg.farmstoryback.service.BoardService;
import com.mysql.jdbc.StringUtils;

@Controller
public class BoardContentsController {
	
	private Logger logger = LoggerFactory.getLogger(BoardContentsController.class);
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	BoardContentsService boardContentsService;
	
	@Autowired
	private PageUtil pageUtil;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "board/contents/manage.do")
	public String manage(Model model,  @RequestParam Map parameter) {
		
		Map pageInfo = pageUtil.pageLink(boardService.totalCount(parameter), parameter);
		pageInfo.put("boardId", parameter.get("boardId"));
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("boardList", boardService.listAll());
		model.addAttribute("boardContents", boardContentsService.list(pageInfo));
		model.addAttribute("parameter", parameter);
		
		return "board/contentsManage";
	}
	
	@RequestMapping(value = "board/contents/detail.do")
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		Map contentDetail = boardContentsService.detail(parameter);
		model.addAttribute("data", contentDetail);
		return "board/contentsDetail";
	}
	
	@RequestMapping(value = "board/contents/createView.do")
	public String createView(Model model, @RequestParam Map<String,Object> parameter) {
		model.addAttribute("mode", "create");
		model.addAttribute("data", parameter);
		return "board/contentsDetail";
	}
	
	@RequestMapping(value = "board/contents/create.do")
	public String create(Model model, @RequestParam Map<String,Object> parameter, HttpSession session) {
		
		Map sessionInfo = (Map)session.getAttribute("login_session");
		parameter.put("memberId", sessionInfo.get("MEMBER_ID"));
			
		int result = boardContentsService.create(parameter);
		model.addAttribute("result", result);
		return "redirect:manage.do?boardId=" + parameter.get("boardId");
	}
	
	@RequestMapping(value = "board/contents/modify.do")
	public String modify(Model model, @RequestParam Map<String,Object> parameter) {
		int result = boardContentsService.modify(parameter);
		model.addAttribute("result", result);
		return "redirect:manage.do?boardId=" + parameter.get("boardId");
	}
	
	@RequestMapping(value = "board/contents/delete.do")
	public String delete(Model model, @RequestParam Map<String,Object> parameter) {
		int result = boardContentsService.delete(parameter);
		model.addAttribute("result", result);
		return "redirect:manage.do?boardId=" + parameter.get("boardId");
	}
	
}
