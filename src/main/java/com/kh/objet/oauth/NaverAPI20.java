package com.kh.objet.oauth;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverAPI20 extends DefaultApi20 implements SnsUrls{
	// NaverAPI20 은 항상 싱글톤으로 만들어야 함(JVM에 Object가 하나만 생기게)
	// 싱글톤은 외부에서 생성 불가해야 함. 따라서 private
	private NaverAPI20() {}
	
	private static class InstanceHolder{
		//static final이라 한번밖에 못만듬
		private static final NaverAPI20 INSTANCE = new NaverAPI20();
	}
	
	public static NaverAPI20 instance() {	// 외부에서는 얘를 호출해서 사용
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
   		return NAVER_AUTH;
	}
}
