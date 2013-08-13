package com.bgg.farmstoryback.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class FarmstoryInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(FarmstoryInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		
		try {
			long startTime = System.currentTimeMillis();
			request.setAttribute("startTime", startTime);

			if(	
				//세션 체크 예외 리스트
//				! request.getServletPath().contains( "dashboard.do" ) &&
				! request.getServletPath().contains( "sessionstore.do" ) &&
				! request.getServletPath().contains( "login.do" ) &&
				! request.getServletPath().contains( "logout.do" )
				
			){
				
				HttpSession session = request.getSession(false);
				
				if ( session == null || session.getAttribute("login_session") == null){
					response.sendRedirect("login.do");

					return false;
				} else {

					Object obj = session.getAttribute("login_session");
					HashMap<String, String> sessionMap = (HashMap<String, String>)obj;
					String role = String.valueOf( sessionMap.get("MEMBER_ROLE") );
					
//					HashMap<String, String> sessionMap = (HashMap<String, String>) session.getAttribute("loggin_session");
//					String role = sessionMap.get("MEMBER_ROLE");
					
					logger.info("role: {}", role);
					
					// 권한 체크
					if( role.equals("1") && 
							! request.getServletPath().contains( "dashboard.do" ) &&
							! request.getServletPath().contains( "user.do" ) &&
							! request.getServletPath().contains( "category.do" ) &&
							! request.getServletPath().contains( "main.do" ) &&
							! request.getServletPath().contains( "sub.do" )
					){
						response.sendRedirect("dashboard.do");
						return false;
					}else if( role.equals("2") && 
							! request.getServletPath().contains( "dashboard.do" ) &&
							! request.getServletPath().contains( "main.do" ) &&
							! request.getServletPath().contains( "sub.do" )
					){
						response.sendRedirect("dashboard.do");
						return false;
					}
				}
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
}
