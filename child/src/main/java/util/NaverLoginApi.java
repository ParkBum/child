package util;

import com.github.scribejava.core.builder.api.DefaultApi20;
import com.github.scribejava.core.extractors.TokenExtractor;
import com.github.scribejava.core.model.OAuth2AccessToken;

public class NaverLoginApi extends DefaultApi20{

 	protected NaverLoginApi(){ }
 
 	private static class InstanceHolder{
 		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
 		}
 	
 	
 	public static NaverLoginApi instance(){
 		return InstanceHolder.INSTANCE;
 	}
 	
 	@Override	//접근 토근 발급 요청문 형식
 	public String getAccessTokenEndpoint() {
 		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
 	}					
 	@Override	//네이버 사용자 프로필 조회
 	protected String getAuthorizationBaseUrl() {
 		return "https://nid.naver.com/oauth2.0/authorize";
 	}
 	
 	
 	@Override
	public String getRefreshTokenEndpoint() {
 		return "https://nid.naver.com/oauth2.0/token?grant_type=refresh_token&refresh_token=authorization_code";
	}
	@Override
	public TokenExtractor<OAuth2AccessToken> getAccessTokenExtractor() {
		return super.getAccessTokenExtractor();
	}

 
 }