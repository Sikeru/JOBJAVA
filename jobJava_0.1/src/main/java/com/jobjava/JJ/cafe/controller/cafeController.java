package com.jobjava.JJ.cafe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface cafeController {
	public ModelAndView tomain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
