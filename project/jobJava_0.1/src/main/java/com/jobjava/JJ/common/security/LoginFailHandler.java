package com.jobjava.JJ.common.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Service("loginFailHandler")
public class LoginFailHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		if(exception instanceof AuthenticationServiceException) {
			request.setAttribute("LoginFailMessage", "�˼��մϴ�. �ý��ۿ� ������ �߻��߽��ϴ�.");
		}
		else if(exception instanceof BadCredentialsException) {
			request.setAttribute("LoginFailMessage", "���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
		else if(exception instanceof DisabledException) {
			request.setAttribute("LoginFailMessage", "���� ����� �� ���� �����Դϴ�.");
		}
		else if(exception instanceof LockedException) {
			request.setAttribute("LoginFailMessage", "���� ��� �����Դϴ�.");
		}
		else if(exception instanceof AccountExpiredException) {
			request.setAttribute("LoginFailMessage", "�̹� ����� �����Դϴ�.");
		}
		else if(exception instanceof CredentialsExpiredException) {
			request.setAttribute("LoginFailMessage", "��й�ȣ�� ����� �����Դϴ�.");
		}
		else request.setAttribute("LoginFailMessage", "������ ã�� �� �����ϴ�.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/loginForm.do");
		dispatcher.forward(request, response);
	}
}