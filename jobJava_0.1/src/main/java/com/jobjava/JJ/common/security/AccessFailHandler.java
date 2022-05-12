package com.jobjava.JJ.common.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Service;

@Service("accessFailHandler")
public class AccessFailHandler implements AccessDeniedHandler{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		// TODO Auto-generated method stub
		if(accessDeniedException instanceof AccessDeniedException) {
			request.setAttribute("LoginFailMessage", "���� ������ ���� �����Դϴ�.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/main/main.do");
		dispatcher.forward(request, response);
	}
}