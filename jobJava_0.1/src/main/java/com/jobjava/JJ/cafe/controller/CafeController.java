package com.jobjava.JJ.cafe.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.cafe.vo.ApplyVO;
import com.jobjava.JJ.cafe.vo.FileVO;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.ProgramVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;
import com.jobjava.JJ.cafe.vo.ShopBasketVO;

public interface CafeController {
	// 꿈터 메인 홈페이지로 이동
	public ModelAndView cafeMain(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 꿈터 구직등록 페이지로 이동
	public String jobapp(Model model) throws Exception;
	// 꿈터 구직등록(다중파일)
	public ResponseEntity addNewArticle2(JobAppVO jobappVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	// 신청페이지
	public String apply(ApplyVO applyVO) throws Exception;
	public String applyresult(@ModelAttribute("ApplyVO") ApplyVO applyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	// 꿈터 구직등록
//	public String jobAppresult(@ModelAttribute("JobAppVO") JobAppVO jobAppVO, HttpServletRequest request,
//			HttpServletResponse response) throws Exception;

	// 기업프로그램신청(다중파일)
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	// 꿈터 게시판
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 채용정보
	ModelAndView hireinfo(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception;
	
	public ModelAndView updateView(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("PROGRAM_NO") String PROGRAM_NO) throws Exception;
	// 채용공고
		public ModelAndView postingList(SearchCriteria scri, Model model, HttpServletRequest request,
				HttpServletResponse response) throws Exception;
	//프로그램 삭제
	public String delete(int PROGRAM_NO, FileVO programVO) throws Exception;

	//프로그램 수정
	ResponseEntity proupdate(ProgramVO programVO, MultipartHttpServletRequest multipartRequest,HttpServletRequest request, HttpServletResponse response) throws Exception;

	//장바구니
		public ModelAndView jobPostingInCartList(SearchCriteria scri, Model model, HttpServletRequest request, ShopBasketVO ShopBasketVO,
				HttpServletResponse response ) throws Exception;

	
		// 학생마이페이지리스트
		public ModelAndView studentmypagelist(Model model, HttpServletRequest request, HttpServletResponse response)
				throws Exception;

		// 기업마이페이지리스트
		public ModelAndView companymypagelist(SearchCriteria scri, Model model, HttpServletRequest request,
				HttpServletResponse response, Principal principal) throws Exception;
	

}
