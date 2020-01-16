package com.kh.objet.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.objet.users.model.vo.UAUP;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(AdminCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		UAUP loginUser = (UAUP)session.getAttribute("loginUser");
		
		if(loginUser == null )  {
			response.sendRedirect("moveLogin.do");
			return false;
		}else {
			if(!loginUser.getUsertype().equals("USER")) {
				return true;
			}else {
				response.sendRedirect("warning.do");
				return false;
			}
		}
	}
	
	
	@Override
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	   ModelAndView modelAndView) throws Exception {
	  super.postHandle(request, response, handler, modelAndView);
	 }
}
