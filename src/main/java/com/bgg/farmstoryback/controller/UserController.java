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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.common.JsonResponseMaker;
import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.service.UserService;
import com.mysql.jdbc.StringUtils;

@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PageUtil pageUtil;
	
	@Autowired
	private JsonResponseMaker jsonResMaker;
	
	@RequestMapping(value = "user/logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request, HttpSession session) {
		logger.info("logout.do");
		session.invalidate();
        return "pure-user/login";
	}
	
	@RequestMapping(value = "user/login.do")
	public String login(@RequestParam Map<String,Object> paramMap, HttpSession session) {
		if(paramMap.isEmpty()){
			return "pure-user/login";
		}else{
			// 관리자 계정만 로그인 가능 하도록
			Map sessionMap = userService.getOneRole(paramMap);
			session.setAttribute("login_session", sessionMap);
			return "redirect:/dashboard.do";
		}
	}
	
	@RequestMapping(value = "user/login.ajax",  produces = "application/json;charset=UTF-8")
	public @ResponseBody String loginAjax(@RequestParam Map paramMap, HttpSession session) {
		
		logger.info("parma {}", paramMap);
		
		Map response = new HashMap();
		
		// ID 체크
		if(userService.isNotFountUser(paramMap)){
			response.put("code", 404);
			response.put("msg", "ID 가 없습니다.");
			return jsonResMaker.generateMap("data", response);
		}
		
		// 관리자 계정만 로그인 가능 하도록
		if(userService.isNotAdminUser(paramMap)){
			response.put("code", 400);
			response.put("msg", "관리자 회원이 아닙니다.");
			return jsonResMaker.generateMap("data", response);
		}
		
		// PWD 체크
		Map userInfo = userService.getOneRole(paramMap);
		if(userInfo == null){
			response.put("code", 400);
			response.put("msg", "비밀번호가 틀립니다.");
			return jsonResMaker.generateMap("data", response);
		}else{
			session.setAttribute("login_session", userInfo);
		}
		
		response.put("code", 200);
		response.put("msg", "ok");
		String res = jsonResMaker.generateMap("data", response);
		logger.info("response {}", res);
		return res;
		
	}
	
	
	@RequestMapping(value = "/user/user/manage.do")
	public String userManage(Model model, @RequestParam Map parameter) {
		
		int pageNum=0;
		if(parameter.get("pageNum") == null){
			pageNum=1;
		}else{
			pageNum = Integer.parseInt((String)parameter.get("pageNum"));
		}
		int totalCount = userService.normalUserTotalCount(parameter);
		
		Map pageInfo = pageUtil.pageLink(totalCount, pageNum);
		pageInfo.put("startNo", pageUtil.getStartRowNum(pageNum));
		pageInfo.put("perPage", pageUtil.PER_PAGE);
		pageInfo.put("search", parameter.get("search"));
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		model.addAttribute("search", parameter.get("search"));
		
		model.addAttribute("positionList", userService.userList(pageInfo));
		model.addAttribute("type", "userView");
		return "user/manage";
	}
	
	@RequestMapping(value = "/user/admin/manage.do", method = RequestMethod.GET)
	public String adminManage(Model model, @RequestParam Map parameter) {
		
		int pageNum=0;
		if(parameter.get("pageNum") == null){
			pageNum=1;
		}else{
			pageNum = Integer.parseInt((String)parameter.get("pageNum"));
		}
		int totalCount = userService.adminUserTotalCount(parameter);
		
		Map pageInfo = pageUtil.pageLink(totalCount, pageNum);
		pageInfo.put("startNo", pageUtil.getStartRowNum(pageNum));
		pageInfo.put("perPage", pageUtil.PER_PAGE);
		pageInfo.put("search", parameter.get("search"));
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		model.addAttribute("search", parameter.get("search"));
		
		model.addAttribute("positionList", userService.adminUserList(pageInfo));
		model.addAttribute("type", "adminView");
		return "user/manage";
	}
	
	@RequestMapping(value = "user/detail.do", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam Map<String,Object> paramMap) {
		model.addAttribute("detail",userService.detail(paramMap));
		return "user/info";
	}
	
	@RequestMapping(value = "user/admin/createView.do", method = RequestMethod.GET)
	public String adminCreateView(Model model) {
		return "user/createView";
	}
	
	
	@RequestMapping(value = "user/admin/create.do", method = RequestMethod.POST)
	public String adminCreate(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("insertUserList", userService.addAdminUser(paramMap));


		Map<String, Object> typeCheck = userService.typeCheck(paramMap);
		String type = typeCheck.get("MEMBER_TYPE").toString();
		
		if(type.equals("2")){
			logger.info(typeCheck.get("MEMBER_TYPE").toString());
			return "redirect:/user.do";
		}else {
			return "redirect:/adminUser.do";	
		}
	}
	

	
	@RequestMapping(value = "user/admin/delete.do", method = RequestMethod.GET)
	public String adminDelete(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("insertUserList", userService.deleteUser(paramMap));
		
		return "redirect:/user.do";
	}
	@RequestMapping(value = "user/childModify.do", method = RequestMethod.GET)
	public ModelAndView childModify(@RequestParam Map<String,Object> paramMap) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userListOne",userService.detail(paramMap));
		mav.addObject("childListOne",userService.getChildOne(paramMap));
		mav.addObject("type", "childEdit");
		mav.setViewName("user/info");
		
		return mav;
	}

//	@RequestMapping(value = "user/childDelete.do", method = RequestMethod.GET)
//	public String childDelete(@RequestParam Map<String,Object> paramMap) {
//		
//		ModelAndView mav = new ModelAndView();
//		
//		mav.addObject("insertUserList", userService.deleteChild(paramMap));
//
//		return "redirect:/user/modify.do?id=" + paramMap.get("id").toString();
//	}
//	@RequestMapping(value = "user/childCreate.do", method = RequestMethod.POST)
//	public String childCreate(@RequestParam Map<String,Object> paramMap) {
//		
//		ModelAndView mav = new ModelAndView();
//
//		mav.addObject("insertUserList", userService.insertChild(paramMap));
//
//
//		return "redirect:/user/modify.do?id=" + paramMap.get("id").toString();
//	}
//	
//	@RequestMapping(value = "user/update.do", method = RequestMethod.GET)
//	public String userUpdate(@RequestParam Map<String,Object> paramMap) {
//
//		ModelAndView mav = new ModelAndView();
//
//		mav.addObject("insertUserList",userService.updateUser(paramMap));
//
//		Map<String, Object> typeCheck = userService.typeCheck(paramMap);
//		String type = typeCheck.get("MEMBER_TYPE").toString();
//		
//		if(type.equals("2")){
//			logger.info(typeCheck.get("MEMBER_TYPE").toString());
//			return "redirect:/user.do";
//		}else {
//			return "redirect:/adminUser.do";	
//		}
//	}
//	
//	@RequestMapping(value = "user/childUpdate.do", method = RequestMethod.POST)
//	public String childUpdate(@RequestParam Map<String,Object> paramMap) {
//
//		ModelAndView mav = new ModelAndView();
//
//		mav.addObject("insertUserList",userService.updateChild(paramMap));
//		
//		return "redirect:/user/modify.do?id=" + paramMap.get("id").toString();
//	}
}
