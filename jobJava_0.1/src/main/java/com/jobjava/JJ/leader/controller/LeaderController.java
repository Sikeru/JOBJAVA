package com.jobjava.JJ.leader.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.leader.vo.Criteria;

public interface LeaderController {
	// 뉴리더 메인 홈페이지 호출
	public ModelAndView leaderMain(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 뉴리더 기업등록 페이지 호출
	public String companyLegister(Model model) throws Exception;

	// 뉴리더 기업등록 insert
	public String legister(@RequestParam HashMap<String, String> cRegVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 기업등록 목록 페이지 호출
	public ModelAndView boardList(Criteria cri, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView companyDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("regiNO") String regiNO) throws Exception;
}
