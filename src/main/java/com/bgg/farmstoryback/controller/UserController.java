package com.bgg.farmstoryback.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.service.UserService;

@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String main(Model model) {
		
		return "pure-view/login";
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
	public ModelAndView userInsert(Model model) {
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("type", "create");
		mav.setViewName("view/userinsert");
		return mav;
	}
	
	@RequestMapping(value = "usercreate.do", method = RequestMethod.POST)
	public ModelAndView userCreate(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("insertUserList", userService.insertUser(paramMap));

		mav.addObject("positionList", userService.userList());
		mav.setViewName("view/user");
		
		return mav;
	}
	
	@RequestMapping(value = "userdelete.do", method = RequestMethod.GET)
	public ModelAndView userDelete(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("insertUserList", userService.deleteUser(paramMap));
		mav.addObject("positionList", userService.userList());
		
		mav.setViewName("view/user");
		return mav;
	}
	
	@RequestMapping(value = "useredit.do", method = RequestMethod.GET)
	public ModelAndView userEdit(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();

		logger.info(paramMap.toString());
		
		mav.addObject("userListOne",userService.getUserOne(paramMap));
		mav.addObject("type", "edit");
		mav.setViewName("view/userinsert");
		
		return mav;
	}
	
	@RequestMapping(value = "userupdate.do", method = RequestMethod.GET)
	public ModelAndView userUpdate(@RequestParam Map<String,Object> paramMap) {

		ModelAndView mav = new ModelAndView();

		logger.info(paramMap.toString());
		
		mav.addObject("insertUserList",userService.updateUser(paramMap));

		mav.addObject("positionList", userService.userList());
		mav.setViewName("view/user");
		return mav;
	}
}
