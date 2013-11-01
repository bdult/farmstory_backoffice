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
			
			//false로 변경 하면 로그인 세션 체크 안함
//			if(notExcludeRequestPath(request)){
			if(false){
				if (noHasSession(request)){
					response.sendRedirect(request.getContextPath()+"/user/login.do");
					return false;
				}
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	private boolean notExcludeRequestPath(HttpServletRequest request) {
		//세션 체크 예외 리스트
		return 
		! request.getServletPath().contains( "login.do" ) &&
		! request.getServletPath().contains( "login.ajax" ) &&
		! request.getServletPath().contains( "logout.do" );
		
//		return false;
	}

	private boolean noHasSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		return session == null || session.getAttribute("login_session") == null;
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
