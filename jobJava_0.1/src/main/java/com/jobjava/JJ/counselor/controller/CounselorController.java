package com.jobjava.JJ.counselor.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CounselorController {
	public ModelAndView counselor(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 상담사 기업등록 페이지 호출
	public ModelAndView jobregForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addJob(@RequestParam HashMap<String, String> jobregVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 상담사 대학등록 페이지 호출 
	public ModelAndView uniregForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String adduni(@RequestParam HashMap<String, String> uniregVO,HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 상담사가 등록한 대학 등록 게시판
	public ModelAndView uniregList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 대학 등록 상세창 조회
	public ModelAndView uniregView(HttpServletRequest request, HttpServletResponse response,
	          @RequestParam String unibno) throws Exception;
	 
	// 접수상태 변경
	
	public ResponseEntity modifyuniregState(@RequestParam HashMap<String, String> unireg, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public String regcheck(@RequestParam HashMap<String, String> uniregVO,HttpServletRequest request, HttpServletResponse response) throws Exception; 

	public ModelAndView addUni(@RequestParam HashMap<String, String> UniregVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView attendance(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView commuteCheck(@RequestParam HashMap<String, String> commuteDate, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
//	public ModelAndView boardList(CriteriaVO cri, Model model, HttpServletRequest request, HttpServletResponse response)
//			throws Exception;
	
	public ModelAndView companyDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("regiNO") String regiNO) throws Exception;
	
	// 일자리 매칭
	public ModelAndView jobMatchingView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity memberMatching(@RequestParam HashMap<String, String> member, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;

}
