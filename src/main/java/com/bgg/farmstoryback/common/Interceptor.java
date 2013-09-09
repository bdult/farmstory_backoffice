package com.bgg.farmstoryback.common;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mysql.jdbc.StringUtils;

public class Interceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(Interceptor.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		printRequestLog(request);
		try {
			if(	
				//세션 체크 예외 리스트
				! request.getServletPath().contains( "login.do" ) &&
				! request.getServletPath().contains( "logout.do" )				
			){
				HttpSession session = request.getSession(false);
				if ( session == null || session.getAttribute("login_session") == null){
					response.sendRedirect(request.getContextPath()+"/user/login.do");
					return false;
				}else {
					// 권한체크
					//HashMap<String, String> sessionMap = (HashMap<String, String>)session.getAttribute("login_session");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	private void printRequestLog(HttpServletRequest request) {
		try {
			StringBuffer sb = new StringBuffer();
			sb.append("[REQ]");
			sb.append("_IP_[" + request.getRemoteAddr() + "]");
			sb.append("_REQURL_[" + request.getServletPath() + "]");
			sb.append("_PARAM_[");

			// parameter
			Enumeration eNames = request.getParameterNames();
			while (eNames.hasMoreElements()) {
				String name = (String) eNames.nextElement();
				String[] values = request.getParameterValues(name);
				String paramIngo = "[" + name + " : ";
				for (int x = 0; x < values.length; x++) {
					if (x == 0) {
						// paramIngo += URLEncoder.encode(values[x], "UTF-8");
						paramIngo += values[x];
					} else {
						// paramIngo += ", "+URLEncoder.encode(values[x],
						// "UTF-8");
						paramIngo += ", " + values[x];
					}
				}

				if (!StringUtils.isNullOrEmpty((name))) {
					if (name.equals("pwd")) {
						paramIngo = "xxxx ]";
					} else {
						paramIngo += "]";
					}
				}

				if (eNames.hasMoreElements()) {
					sb.append(paramIngo + ",");
				} else {
					sb.append(paramIngo);
				}
			}
			sb.append("]");
			logger.info(sb.toString());
		} catch (Exception e) {
			logger.error("{}", e);
		}
	}
}
