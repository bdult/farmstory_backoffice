package com.bgg.farmstoryback.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.service.ViewService;

@Controller
public class ViewController {
	
	private Logger logger = LoggerFactory.getLogger(ViewController.class);
	
	@Autowired
	private ViewService viewService;

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String loginView(Model model) {
		return "pure-view/login";
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request, HttpSession session) {
		logger.info("logout.do");

		if(session != null){
			session.invalidate();
		}
        
        return "pure-view/login";
	}
	
	@RequestMapping(value = "sessionstore.do", method = RequestMethod.GET)
	public ModelAndView sessionstore(@RequestParam Map<String,Object> paramMap, HttpServletRequest request, HttpSession session) {
		logger.info("into sessionstore.do");
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, String> sessionMap = (HashMap<String, String>)viewService.getOneRole(paramMap);
		
		if(session == null){
			mav.setViewName("pure-view/login");
		}else{
			mav.setViewName("view/dashboard");
			session.setAttribute("login_session", sessionMap);
		}
		return mav;
	}
	
	
	@RequestMapping(value = "dashboard.do", method = RequestMethod.GET)
	public String dashboard(Model model) {
		logger.info("into dashboard.do");
		return "view/dashboard";
	}
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(Model model) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view/main");
		logger.info("into main.do");
		
		return "view/main";
	}
	
	@RequestMapping(value = "sub.do", method = RequestMethod.GET)
	public String sub(Model model) {
		logger.info("into sub.do");
		
		//db sample
		List<HashMap<String, String>> data = viewService.memberList();
		
		for(int i=0;i<data.size();i++) {
			System.out.println(data.get(i));
		}
		return "view/sub";
	}
	
	// Contents
	@RequestMapping(value = "contents/manage.do", method = RequestMethod.GET)
	public String contentsManage(Model model) {
		
//		List<Map> cateList = cateService.listByLevel(1);
//		model.addAttribute("cateList", cateList);
		return "view/contents";
	}
}
