package com.bgg.farmstoryback.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.service.BoardService;
import com.bgg.farmstoryback.service.BrandService;
import com.bgg.farmstoryback.service.CategoryService;
import com.bgg.farmstoryback.service.ContentsService;
import com.bgg.farmstoryback.service.SeriesService;
import com.bgg.farmstoryback.service.UserService;

@Controller
public class MainController {
	
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	@Autowired
	private ContentsService contentsService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private SeriesService seriesService;
	
	@RequestMapping(value = "dashboard.do", method = RequestMethod.GET)
	public String dashboard(Model model) {
		
		// 회원 가입 현황
		
		// 결제내역 현황
		
		// 고객문의 현황
		
		// 컨텐츠 업로드 현황
		
		List contentsTop5 = contentsService.top(5); 
		List userTop5 = userService.top(5); 
		List boardTop5 = boardService.top(5); 
		List brandTop5 = brandService.top(5); 
		List categoryTop5 = categoryService.top(5); 
		List seriesTop5 = seriesService.top(5); 
		model.addAttribute("contentsTop5", contentsTop5);
		//
		model.addAttribute("userTop5", null);
		model.addAttribute("boardTop5", boardTop5);
		model.addAttribute("brandTop5", brandTop5);
		model.addAttribute("categoryTop5", categoryTop5);
		model.addAttribute("seriesTop5", seriesTop5);
		model.addAttribute("userTop5", userTop5);
		return "main/dashboard";
	}
}
