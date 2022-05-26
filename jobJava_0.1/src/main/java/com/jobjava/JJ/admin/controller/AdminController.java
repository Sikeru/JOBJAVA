package com.jobjava.JJ.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.admin.vo.SearchCriteria;
import com.jobjava.JJ.member.vo.MemberVO;

public interface AdminController {
	public ModelAndView adminMain(SearchCriteria scri,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String updateMember(@ModelAttribute("MemberVO") MemberVO _memberVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView loginStatistics(SearchCriteria scri,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView menuStatistics(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView authorityStatistics(HttpServletRequest request, HttpServletResponse response) throws Exception;

}

