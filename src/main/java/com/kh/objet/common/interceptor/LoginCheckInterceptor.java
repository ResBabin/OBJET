package com.kh.objet.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		if(session != null) {
			logger.debug("로그인 상태로 접근 : " + request.getRequestURI() + " 요청");
		}else {
			logger.debug("비로그인 상태로 접근 : " + request.getRequestURI() + " 요청");
		}
		return super.preHandle(request, response, handler);	// 항상 true를 리턴
	}
}
