package com.bgg.farmstoryback.controller;

import java.util.List;
import java.util.Map;

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
import com.bgg.farmstoryback.service.PayService;
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
	private PayService payService;
	
	@RequestMapping(value = "dashboard.do", method = RequestMethod.GET)
	public String dashboard(Model model) {
		// csLastestData
		// 회원 가입 현황
		List<Map> memberLastData = userService.latestData();
		
		// 결제내역 현황
		List<Map> payLastData = payService.latestData(); 
		
		// 고객문의 현황
		List<Map> csLastData = boardService.csLatestData();
		
		// 컨텐츠 업로드 현황
		List<Map> contentsLastData = contentsService.latestData();
		
		model.addAttribute("memberCurrentData", memberLastData);
		model.addAttribute("payCurrentData", payLastData);
		model.addAttribute("csCurrentData", csLastData);
		model.addAttribute("contentsCurrentData", contentsLastData);
		return "main/dashboard";
	}
}
