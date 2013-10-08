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

import com.bgg.farmstoryback.common.JsonResponseMaker;
import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.service.UserService;

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

    Map response = new HashMap();
    
    // ID 체크
    if(userService.isNotFoundUser(paramMap)){
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
    
	Map pageInfo = pageUtil.pageLink(userService.normalUserTotalCount(parameter), parameter);
	model.addAttribute("pageInfo", pageInfo);
	model.addAttribute("pageList", pageInfo.get("pageList"));
    
    model.addAttribute("positionList", userService.userList(pageInfo));
    model.addAttribute("type", "userView");
    return "user/manage";
  }
  
  @RequestMapping(value = "/user/admin/manage.do", method = RequestMethod.GET)
  public String adminManage(Model model, @RequestParam Map parameter) {
    
	Map pageInfo = pageUtil.pageLink(userService.adminUserTotalCount(parameter), parameter);
	model.addAttribute("pageInfo", pageInfo);
	model.addAttribute("pageList", pageInfo.get("pageList"));
    
    model.addAttribute("positionList", userService.adminUserList(pageInfo));
    model.addAttribute("type", "adminView");
    return "user/manage";
  }
  
  @RequestMapping(value = "user/detail.do", method = RequestMethod.GET)
  public String detail(Model model, @RequestParam Map<String,Object> paramMap) {
	  
    model.addAttribute("detail",userService.detail(paramMap));
    
    return "user/info";
  }

  @RequestMapping(value = "user/childDetail.do", method = RequestMethod.GET)
  public String childDetail(Model model, @RequestParam Map<String,Object> paramMap) {
	  
    model.addAttribute("childDetail",userService.childDetail(paramMap));
    
    return "user/child_info";
  }
  
  @RequestMapping(value = "user/admin/createView.do", method = RequestMethod.GET)
  public String adminCreateView(Model model) {
	  
    return "user/createView";
  }
  
  
  @RequestMapping(value = "user/admin/create.do", method = RequestMethod.POST)
  public String adminCreate(Model model, @RequestParam Map<String,Object> paramMap) {

    userService.addAdminUser(paramMap);

    Map<String, Object> typeCheck = userService.typeCheck(paramMap);
    String type = typeCheck.get("MEMBER_TYPE").toString();
    
    if(type.equals("1")){
      return "redirect:/user/user/manage.do";  
    }else {
      return "redirect:/user/admin/manage.do";
    }
  }

  @RequestMapping(value = "user/admin/modify.do", method = RequestMethod.POST)
  public String adminModify(Model model, @RequestParam Map<String,Object> paramMap) {
	  userService.modifyAdminUser(paramMap);
	  

	    Map<String, Object> typeCheck = userService.typeCheck(paramMap);
	    String type = typeCheck.get("MEMBER_TYPE").toString();
	    
	    if(type.equals("1")){
	      return "redirect:/user/user/manage.do";  
	    }else {
	      return "redirect:/user/admin/manage.do";
	    }
  }
  @RequestMapping(value = "user/admin/delete.do", method = RequestMethod.GET)
  public String adminDelete(@RequestParam Map<String,Object> paramMap) {
    
    userService.deleteUser(paramMap);
    
    return "redirect:/user/admin/manage.do";
  }
  
  
}
