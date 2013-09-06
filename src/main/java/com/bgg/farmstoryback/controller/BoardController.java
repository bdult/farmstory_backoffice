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
	
	@RequestMapping(value = "board/manage.do")
	public String manage(Model model,  @RequestParam Map parameter) {
		
		int pageNum=0;
		if(parameter.get("pageNum") == null){
			pageNum=1;
		}else{
			pageNum = Integer.parseInt((String)parameter.get("pageNum"));
		}
		int totalCount = boardService.totalCount(parameter);
		
		Map pageInfo = pageUtil.pageLink(totalCount, pageNum);
		pageInfo.put("startNo", pageUtil.getStartRowNum(pageNum));
		pageInfo.put("perPage", pageUtil.PER_PAGE);
		pageInfo.put("search", parameter.get("search"));
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		model.addAttribute("search", parameter.get("search"));
		
		model.addAttribute("boardList", boardService.list(pageInfo));
		
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
	
	@RequestMapping(value = "board/detail.do")
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		Map boardDetail = boardService.detail(parameter);
		model.addAttribute("data", boardDetail);
		return "board/info";
	}
	
	
	@RequestMapping(value = "board/modify.do", method = RequestMethod.POST)
	public String modify(@RequestParam Map<String,Object> parameter) {
		boardService.modify(parameter);
		return "redirect:detail.do?board_id="+parameter.get("board_id");
	}
	
	@RequestMapping(value = "board/delete.do", method = RequestMethod.POST)
	public String delete(@RequestParam Map<String,Object> parameter) {
		boardService.delete(parameter);
		return "redirect:manage.do?pageNum=1";
	}
}
