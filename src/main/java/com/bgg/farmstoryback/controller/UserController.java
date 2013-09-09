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
import com.mysql.jdbc.StringUtils;

@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "user/logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request, HttpSession session) {
		logger.info("logout.do");

		if(session != null){
			session.invalidate();
		}
        
        return "pure-user/login";
	}
	
	@RequestMapping(value = "user/login.do")
	public String login(
			@RequestParam Map<String,Object> paramMap, HttpServletRequest request, HttpSession session) {
		
		logger.info("login method");
		
		if(StringUtils.isNullOrEmpty((String)paramMap.get("id"))){
			return "pure-user/login";
		}else{
			HashMap<String, Object> sessionMap = (HashMap<String, Object>)userService.getOneRole(paramMap);
			if(sessionMap !=null){
				session.setAttribute("login_session", sessionMap);
				return "redirect:/dashboard.do";
			}else{
				return "pure-user/login";
			}
		}
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
		
		mav.addObject("positionList", userService.userList());
		mav.addObject("type", "userView");
		
		mav.setViewName("user/user");
		return mav;
	}
	
	@RequestMapping(value = "adminUser.do", method = RequestMethod.GET)
	public ModelAndView adminUser(Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("positionList", userService.adminUserList());
		mav.addObject("type", "adminView");
		
		mav.setViewName("user/user");
		return mav;
	}

	@RequestMapping(value = "user/search.do", method = RequestMethod.GET)
	public ModelAndView userSearch(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("searchList", userService.userSearch(paramMap));
		mav.addObject("type", "search");
		
		mav.setViewName("user/user");
		return mav;
	}
	
	@RequestMapping(value = "user/createView.do", method = RequestMethod.GET)
	public ModelAndView createView(Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("type", "create");
		mav.setViewName("user/userinsert");
		return mav;
	}
	
	@RequestMapping(value = "user/childCreateView.do", method = RequestMethod.GET)
	public ModelAndView childCreateView(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("userListOne",userService.getUserOne(paramMap));
		mav.addObject("type", "childCreate");
		mav.setViewName("user/userinsert");
		return mav;
	}
	
	@RequestMapping(value = "user/create.do", method = RequestMethod.POST)
	public String create(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("insertUserList", userService.insertUser(paramMap));


		Map<String, Object> typeCheck = userService.typeCheck(paramMap);
		String type = typeCheck.get("MEMBER_TYPE").toString();
		
		if(type.equals("2")){
			logger.info(typeCheck.get("MEMBER_TYPE").toString());
			return "redirect:/user.do";
		}else {
			return "redirect:/adminUser.do";	
		}
	}
	
	@RequestMapping(value = "user/childCreate.do", method = RequestMethod.POST)
	public String childCreate(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("insertUserList", userService.insertChild(paramMap));


		return "redirect:/user/modify.do?id=" + paramMap.get("id").toString();
	}
	
	@RequestMapping(value = "user/delete.do", method = RequestMethod.GET)
	public String delete(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("insertUserList", userService.deleteUser(paramMap));
		
		return "redirect:/user.do";
	}

	@RequestMapping(value = "user/childDelete.do", method = RequestMethod.GET)
	public String childDelete(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("insertUserList", userService.deleteChild(paramMap));

		return "redirect:/user/modify.do?id=" + paramMap.get("id").toString();
	}
	
	@RequestMapping(value = "user/modify.do", method = RequestMethod.GET)
	public ModelAndView modify(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();

		
		mav.addObject("userListOne",userService.getUserOne(paramMap));
		mav.addObject("childList", userService.childList(paramMap));
		mav.addObject("type", "edit");
		mav.setViewName("user/userinsert");
		
		return mav;
	}

	@RequestMapping(value = "user/childModify.do", method = RequestMethod.GET)
	public ModelAndView childModify(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userListOne",userService.getUserOne(paramMap));
		mav.addObject("childListOne",userService.getChildOne(paramMap));
		mav.addObject("type", "childEdit");
		mav.setViewName("user/userinsert");
		
		return mav;
	}
	
	@RequestMapping(value = "user/update.do", method = RequestMethod.GET)
	public String userUpdate(@RequestParam Map<String,Object> paramMap) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("insertUserList",userService.updateUser(paramMap));

		Map<String, Object> typeCheck = userService.typeCheck(paramMap);
		String type = typeCheck.get("MEMBER_TYPE").toString();
		
		if(type.equals("2")){
			logger.info(typeCheck.get("MEMBER_TYPE").toString());
			return "redirect:/user.do";
		}else {
			return "redirect:/adminUser.do";	
		}
	}
	
	@RequestMapping(value = "user/childUpdate.do", method = RequestMethod.POST)
	public String childUpdate(@RequestParam Map<String,Object> paramMap) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("insertUserList",userService.updateChild(paramMap));
		
		return "redirect:/user/modify.do?id=" + paramMap.get("id").toString();
	}
}
