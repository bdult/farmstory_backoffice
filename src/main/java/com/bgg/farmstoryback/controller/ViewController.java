package com.bgg.farmstoryback.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.dao.UserDao;
import com.bgg.farmstoryback.dto.UserDto;
import com.bgg.farmstoryback.service.UserService;
import com.bgg.farmstoryback.service.ViewService;

@Controller
public class ViewController {
	
	private Logger logger = LoggerFactory.getLogger(ViewController.class);
	
	@Autowired
	private ViewService viewService;

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "dashboard.do", method = RequestMethod.GET)
	public String dashboard(Model model) {
		logger.info("into dashboard.do");
		
		//db sample
		List<HashMap<String, String>> data = viewService.memberList();
		
		for(int i=0;i<data.size();i++) {
			System.out.println(data.get(i));
		}
		
		return "view/dashboard";
	}
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("into main.do");
		
		//db sample
		List<HashMap<String, String>> data = viewService.memberList();
		
		for(int i=0;i<data.size();i++) {
			System.out.println(data.get(i));
		}
		
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
	
	@RequestMapping(value = "user.do", method = RequestMethod.GET)
	public ModelAndView user(Model model) {
		

		ModelAndView mav = new ModelAndView();
		logger.info("into user.do");
		
		mav.addObject("positionList", userService.userList());
		
		mav.setViewName("view/user");
		return mav;
	}
	
	@RequestMapping(value = "userinsert.do", method = RequestMethod.POST)
	public ModelAndView userInsert(Map<String, String> map) {
		
		ModelAndView mav = new ModelAndView();
		logger.info("into userinsert.do");
		
		mav.addObject("positionList", userService.userList());
		
		mav.setViewName("view/userinsert");
		return mav;
	}
}
