package com.jobjava.JJ.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Service;

@Service("loginSuccessHandler")
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		//���1 : �α��� ������ ���� Spring Security�� ��û�� ����æ ���
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		//���2 : ����ڰ� ���� �α��� ��ư�� ���� ���
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		if(prevPage!=null) request.getSession().removeAttribute("prevPage");
		
		String uri = request.getContextPath();
		//���1 �� ��� uri�� ��� ����
		if(savedRequest!=null) uri = savedRequest.getRedirectUrl();
		//���2 �� ��� uri�� ��� ����
		else if(prevPage!=null) uri = prevPage;
		
		response.sendRedirect(uri);
	}
}