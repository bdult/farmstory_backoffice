package com.bgg.farmstoryback.controller;

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
import com.bgg.farmstoryback.service.BoardService;
import com.mysql.jdbc.StringUtils;

@Controller
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	private PageUtil pageUtil;
	
	@RequestMapping(value = "board/manage.do", method = RequestMethod.GET)
	public String manage(Model model,  @RequestParam int pageNum) {
		
		if(pageNum ==0) pageNum=1;

		List boardList = boardService.listByPageNum(pageNum);
		int totalCount = boardService.totalCount();
		Map pageInfo = pageUtil.pageLink(totalCount, pageNum);
		
		logger.info("{}", boardList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		logger.info("{}", pageInfo);
		
		return "board/manage";
	}
	
	@RequestMapping(value = "board/createView.do")
	public String createView(Model model, @RequestParam Map<String,Object> parameter, HttpSession session) {
		Map userInfo = (Map)session.getAttribute("login_session");
		logger.info("{}",userInfo);
		return "board/create";
	}
	
	@RequestMapping(value = "board/create.do")
	public String create(Model model, @RequestParam Map<String,Object> parameter, HttpSession session) {
		Map userInfo = (Map)session.getAttribute("login_session");
		parameter.put("reg_member_id", userInfo.get("MEMBER_ID"));
		boardService.create(parameter);
		return "redirect:manage.do?pageNum=1";
	}
	
	@RequestMapping(value = "board/search.do", method = RequestMethod.POST)
	public String search(Model model, @RequestParam String search) {
		if(StringUtils.isNullOrEmpty(search)){
			return "redirect:manage.do?pageNum=1";
		}
		List<Map> list = boardService.searchByName(search);
		model.addAttribute("boardList", list);
		model.addAttribute("search", search);
		return "board/search";
	}
	
	@RequestMapping(value = "board/detail.do", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		Map boardDetail = boardService.detail(parameter);
		model.addAttribute("data", boardDetail);
		return "board/info";
	}
	
	
	@RequestMapping(value = "board/modify.do", method = RequestMethod.POST)
	public @ResponseBody String modify(@RequestParam Map<String,Object> parameter) {
		return null;
	}
	
	@RequestMapping(value = "board/delete.do", method = RequestMethod.POST)
	public @ResponseBody String delete(@RequestParam Map<String,Object> parameter) {
		return null;
	}
}
