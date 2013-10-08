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
		
		
		Map pageInfo = pageUtil.pageLink(boardService.totalCount(parameter), parameter);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		
		model.addAttribute("boardList", boardService.list(pageInfo));
		
		return "board/manage";
	}
	
	@RequestMapping(value = "board/detail.do")
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		Map boardDetail = boardService.detail(parameter);
		model.addAttribute("data", boardDetail);
		return "board/info";
	}
	
	@RequestMapping(value = "board/createView.do")
	public String createView(Model model, HttpSession session) {
		logger.info("{}", session.getAttribute("login_session"));
		return "board/info";
	}
	
	
	/**
	 * 게시판 정보 추가 및 수정 
	 * 게시판 추가 / 수정은 같은 페이지를 사용 하기 때문에
	 * 파라미터의 board_id 의 유무를 통해 생성인지 수정인지로 분기 처리
	 * @param parameter
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "board/modify.do", method = RequestMethod.POST)
	public String modify(@RequestParam Map<String,Object> parameter, HttpSession session) {
		
		// 파라미터중 board_id 값이 있다면 수정, 없으면 추가
		if(noHasBoardId(parameter)){
			boardService.create(parameter);
			return "redirect:manage.do";
		}else{
			boardService.modify(parameter);
			return "redirect:detail.do?board_id="+parameter.get("board_id");
		}
	}

	
	@RequestMapping(value = "board/delete.do", method = RequestMethod.POST)
	public String delete(@RequestParam Map<String,Object> parameter) {
		boardService.delete(parameter);
		return "redirect:manage.do?pageNum=1";
	}
	
	private boolean noHasBoardId(Map<String, Object> parameter) {
		return parameter.get("board_id") == null || parameter.get("board_id").equals("");
	}
}
