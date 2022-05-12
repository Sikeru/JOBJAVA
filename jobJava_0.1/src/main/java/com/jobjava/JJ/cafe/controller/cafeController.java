package com.jobjava.JJ.cafe.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.cafe.vo.Criteria;
import com.jobjava.JJ.cafe.vo.JobAppVO;



public interface CafeController {
	//꿈터 메인 홈페이지로 이동
	public ModelAndView cafeMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//꿈터 구직등록 페이지로 이동
	public String jobapp(Model model) throws Exception;
	//꿈터 구직등록
	public String jobAppresult(@ModelAttribute("JobAppVO") JobAppVO jobAppVO, HttpServletRequest request, HttpServletResponse response) throws
	  Exception;

	//꿈터 기업등록 페이지로 이동
	public String cafemypage(Model model) throws Exception;
	//꿈터 기업등록
	public String mypageresult(@RequestParam HashMap<String, String> myPageVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
		
	  //꿈터 게시판 
	  ModelAndView boardList(Criteria cri, Model model, HttpServletRequest request, HttpServletResponse response)
				throws Exception;
	  
	  ModelAndView hireinfo(HttpServletRequest request, HttpServletResponse response, Model model)
				throws Exception;
	

}
