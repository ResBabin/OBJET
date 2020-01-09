package com.kh.objet.oauth;

import java.io.IOException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.kh.objet.users.model.vo.UAUP;

public class SNSLogin {
	private OAuth20Service oauthService;
	private String profileUrl;
	
	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.build(sns.getApi20Instance());
	}

	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	public String getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		OAuthRequest request = new OAuthRequest(Verb.GET, this.profileUrl);
		oauthService.signRequest(accessToken, request);
		Response response = oauthService.execute(request);
		
		// 응답받은 것은 json에 담겨옴(컨트롤러에서 파싱해줘야 함)
		return response.getBody();
	}

	/*private UAUP parseJson(String body) throws Exception {
		UAUP user = new UAUP();
		
		// Json을 Object로 매핑해줌
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		JsonNode id = rootNode.get("id");
		
		return user;
	}*/
}
