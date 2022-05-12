package com.jobjava.JJ.counselor.controller;



import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.counselor.vo.JobregVO;
import com.jobjava.JJ.member.vo.MemberVO;

public interface CounselorController {
	public ModelAndView counselor(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 상담사 기업등록 페이지 호출
	public ModelAndView jobregForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addJob(@RequestParam HashMap<String, String> jobregVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView uniregForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addUni(@RequestParam HashMap<String, String> UniregVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	     
}
