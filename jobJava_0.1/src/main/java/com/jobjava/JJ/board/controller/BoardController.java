package com.jobjava.JJ.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface BoardController {
	public ModelAndView tomain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView qnATable(HttpServletRequest request, HttpServletResponse response) throws Exception;	


}
