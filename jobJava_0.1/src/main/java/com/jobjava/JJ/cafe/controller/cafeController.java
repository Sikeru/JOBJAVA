package com.jobjava.JJ.cafe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;

public interface CafeController {
	// 꿈터 메인 홈페이지로 이동
	public ModelAndView cafeMain(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 꿈터 구직등록 페이지로 이동
	public String jobapp(Model model) throws Exception;

	// 꿈터 구직등록
	public String jobAppresult(@ModelAttribute("JobAppVO") JobAppVO jobAppVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 기업프로그램신청(다중파일)
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	// 꿈터 게시판
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	ModelAndView hireinfo(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception;

}
