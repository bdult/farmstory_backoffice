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
	public String user(Model model) {
		
		List<HashMap<String, Object>> list = userService.userList();
		
		model.addAttribute("list", list);
		model.addAttribute("type", "userView");
		
		return "user/user";
	}
	
	@RequestMapping(value = "adminUser.do", method = RequestMethod.GET)
	public String adminUser(Model model, @RequestParam Map<String,Object> paramMap) {

		int pageNum=0;
		if(paramMap.get("pageNum") == null){
			pageNum=1;
		}else{
			pageNum = Integer.parseInt((String)paramMap.get("pageNum"));
		}
		
		
		
		List<HashMap<String, Object>> list = userService.adminUserList(); 
		
		model.addAttribute("list", list);
		model.addAttribute("type", "adminView");
		
		return "user/user";
	}

	//제외(search 코드 쿼리 수정)
	@RequestMapping(value = "user/search.do", method = RequestMethod.GET)
	public ModelAndView userSearch(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("searchList", userService.userSearch(paramMap));
		mav.addObject("type", "search");
		
		mav.setViewName("user/user");
		return mav;
	}
	
	@RequestMapping(value = "user/createView.do", method = RequestMethod.GET)
	public String createView(Model model) {
		
		model.addAttribute("type", "create");
		
		return "user/userinsert";
	}
	
	@RequestMapping(value = "user/childCreateView.do", method = RequestMethod.GET)
	public String childCreateView(Model model, @RequestParam Map<String,Object> paramMap) {

		
		model.addAttribute("childUserOne", userService.getUserOne(paramMap));
		model.addAttribute("type", "childCreate");

		return "user/userinsert";
	}
	
	@RequestMapping(value = "user/create.do", method = RequestMethod.POST)
	public String create(@RequestParam Map<String,Object> paramMap) {
		
		userService.insertUser(paramMap);
		
		Map<String, Object> typeCheck = userService.typeCheck(paramMap);
		String type = typeCheck.get("MEMBER_TYPE").toString();
		
		if(type.equals("1")){
			logger.info(typeCheck.get("MEMBER_TYPE").toString());
			return "redirect:/user.do";
		}else {
			return "redirect:/adminUser.do";
		}
	}
	
	@RequestMapping(value = "user/childCreate.do", method = RequestMethod.POST)
	public String childCreate(@RequestParam Map<String,Object> paramMap) {
		
		userService.insertChild(paramMap);
		
		return "redirect:/user/modify.do?id=" + paramMap.get("id").toString();
	}
	
	@RequestMapping(value = "user/delete.do", method = RequestMethod.GET)
	public String delete(@RequestParam Map<String,Object> paramMap) {
		
		Map<String, Object> typeCheck = userService.typeCheck(paramMap);
		String type = typeCheck.get("MEMBER_TYPE").toString();
		
		if(type.equals("1")){
			userService.deleteUser(paramMap);
			logger.info(typeCheck.get("MEMBER_TYPE").toString());
			return "redirect:/user.do";
		}else {
			userService.deleteUser(paramMap);
			return "redirect:/adminUser.do";
		}
	}

	@RequestMapping(value = "user/childDelete.do", method = RequestMethod.GET)
	public String childDelete(@RequestParam Map<String,Object> paramMap) {
		
		userService.deleteChild(paramMap);
		
		return "redirect:/user/modify.do?id=" + paramMap.get("id").toString();
	}
	
	@RequestMapping(value = "user/modify.do", method = RequestMethod.GET)
	public String modify(Model model, @RequestParam Map<String,Object> paramMap) {
		
		model.addAttribute("userListOne", userService.getUserOne(paramMap));
		model.addAttribute("childList", userService.childList(paramMap));
		model.addAttribute("type", "edit");
		
		return "user/userinsert";
	}

	@RequestMapping(value = "user/childModify.do", method = RequestMethod.GET)
	public String childModify(Model model, @RequestParam Map<String,Object> paramMap) {
		
		model.addAttribute("userListOne",userService.getUserOne(paramMap));
		model.addAttribute("childListOne",userService.getChildOne(paramMap));
		model.addAttribute("type", "childEdit");
		
		return "user/userinsert";
	}
	
	@RequestMapping(value = "user/update.do", method = RequestMethod.GET)
	public String userUpdate(@RequestParam Map<String,Object> paramMap) {

		userService.updateUser(paramMap);

		Map<String, Object> typeCheck = userService.typeCheck(paramMap);
		String type = typeCheck.get("MEMBER_TYPE").toString();
		
		if(type.equals("1")){
			logger.info(typeCheck.get("MEMBER_TYPE").toString());
			return "redirect:/user.do";
		}else {
			return "redirect:/adminUser.do";	
		}
	}
	
	@RequestMapping(value = "user/childUpdate.do", method = RequestMethod.POST)
	public String childUpdate(@RequestParam Map<String,Object> paramMap) {
		
		userService.updateChild(paramMap);
		
		return "redirect:/user/modify.do?id=" + paramMap.get("id").toString();
	}
}
