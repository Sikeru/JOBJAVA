package com.jobjava.JJ.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.board.vo.QnAVO;

public interface BoardController {
	public ModelAndView tomain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView qnATable(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public ModelAndView qnAAddTableView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String qnAAddTable(@ModelAttribute("QnAVO") QnAVO _qnAVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView qnATableView(@RequestParam("QNA_NO") int _QNA_NO ,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String qnAUpDateTable(@ModelAttribute("QnAVO") QnAVO _qnAVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
		

}
