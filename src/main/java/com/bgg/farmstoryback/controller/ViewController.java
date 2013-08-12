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
	public String login(Model model) {

	    
		return "pure-view/login";
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request, HttpSession session) {
		logger.info("logout.do");

        session.setAttribute("login_session", null);
        logger.info((String)session.getAttribute("login_session"));
        
        return "pure-view/login";
	}
	
	@RequestMapping(value = "sessionstore.do", method = RequestMethod.GET)
	public ModelAndView sessionstore(@RequestParam Map<String,Object> paramMap, HttpServletRequest request, HttpSession session) {
		logger.info("into sessionstore.do");
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, String> sessionMap = (HashMap<String, String>)viewService.getOneRole(paramMap);
		session.setAttribute("login_session", sessionMap);
	    mav.setViewName("view/dashboard");
	    
		return mav;
	}
	
	
	@RequestMapping(value = "dashboard.do", method = RequestMethod.GET)
	public String dashboard(Model model) {
		logger.info("into dashboard.do");
		
		
		return "view/dashboard";
	}
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("into main.do");
		
		return "view/main";
	}
	
	@RequestMapping(value = "sub.do", method = RequestMethod.GET)
	public String sub(Model model) {
		logger.info("into sub.do");
		
		
		return "view/sub";
	}
	
}
