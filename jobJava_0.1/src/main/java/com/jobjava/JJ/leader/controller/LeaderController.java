package com.jobjava.JJ.leader.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.SearchCriteria;

public interface LeaderController {
	// 뉴리더 메인 홈페이지 호출
	public ModelAndView leaderMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 뉴리더 사업안내 페이지 호출
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 뉴리더 기업등록 페이지 호출
	public ModelAndView companyLegister(HttpServletRequest request, HttpServletResponse response,
			 Principal principal) throws Exception;

	// 뉴리더 기업등록수정 페이지 호출
	public ModelAndView legisterUpdateView(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("uniBNO") int uniBNO, Principal principal) throws Exception;

	// 뉴리더 기업등록수정
	public ResponseEntity legisterUpdate(CRegVO cRegVO, Principal principal,
			MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	// 뉴리더 기업등록삭제
	public String legisterDelete(int REGI_NO) throws Exception;

	// 뉴리더 기업등록 insert
	public ResponseEntity legister(MultipartHttpServletRequest multipartRequest, HttpServletResponse response,
			@RequestParam("uniBNO") String uniBNO, Model model) throws Exception;

	// 기업등록 목록 페이지 호출
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response, Principal principal) throws Exception;

	public ModelAndView companyDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("regiNO") String regiNO) throws Exception;


}
