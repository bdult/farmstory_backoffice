package com.bgg.farmstoryback.controller;

import java.util.HashMap;
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

import com.bgg.farmstoryback.service.UserService;

@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value = "user/loginView.do", method = RequestMethod.GET)
	public String loginView(Model model) {
		return "pure-view/login";
	}
	
	@RequestMapping(value = "user/logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request, HttpSession session) {
		logger.info("logout.do");

		if(session != null){
			session.invalidate();
		}
        
        return "pure-view/login";
	}
	
	@RequestMapping(value = "user/login.do", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam Map<String,Object> paramMap, HttpServletRequest request, HttpSession session) {
		logger.info("into sessionstore.do");
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, String> sessionMap = (HashMap<String, String>)userService.getOneRole(paramMap);
	    
		if(session == null || session.getAttribute("login_session") == null){
			mav.setViewName("pure-user/login");
		}else{
			mav.setViewName("main/dashboard");
			session.setAttribute("login_session", sessionMap);
		}
		return mav;
	}
	
	/**
	 * 	Result
			Key : MEMBER_ID -> Value : test
			Key : MEMBER_NM -> Value : unho
			Key : MEMBER_PW -> Value : 1234
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "user.do", method = RequestMethod.GET)
	public ModelAndView user(Model model) {
		
		ModelAndView mav = new ModelAndView();
		logger.info("into user.do");
		
		mav.addObject("positionList", userService.userList());
		
		mav.setViewName("view/user");
		return mav;
	}
	
	@RequestMapping(value = "user/createView.do", method = RequestMethod.POST)
	public ModelAndView createView(Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("type", "create");
		mav.setViewName("view/userinsert");
		return mav;
	}
	
	@RequestMapping(value = "user/create.do", method = RequestMethod.POST)
	public ModelAndView create(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("insertUserList", userService.insertUser(paramMap));

		mav.addObject("positionList", userService.userList());
		mav.setViewName("view/user");
		
		return mav;
	}
	
	@RequestMapping(value = "user/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("insertUserList", userService.deleteUser(paramMap));
		mav.addObject("positionList", userService.userList());
		
		mav.setViewName("view/user");
		return mav;
	}
	
	@RequestMapping(value = "user/modify.do", method = RequestMethod.GET)
	public ModelAndView modify(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		logger.info(paramMap.toString());
		
		mav.addObject("userListOne",userService.getUserOne(paramMap));
		mav.addObject("type", "edit");
		mav.setViewName("view/userinsert");
		
		return mav;
	}
	
//	@RequestMapping(value = "userupdate.do", method = RequestMethod.GET)
//	public ModelAndView userUpdate(@RequestParam Map<String,Object> paramMap) {
//
//		ModelAndView mav = new ModelAndView();
//
//		logger.info(paramMap.toString());
//		
//		mav.addObject("insertUserList",userService.updateUser(paramMap));
//
//		mav.addObject("positionList", userService.userList());
//		mav.setViewName("view/user");
//		return mav;
//	}
}
