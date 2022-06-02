package com.jobjava.JJ.member.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.member.vo.MemberVO;

public interface memberController {
	public ModelAndView signUpView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView signUpTestView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String signUp(@ModelAttribute("memberVO") MemberVO _memberVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView mypageForm(Principal principal, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity myPageUpDate(@RequestParam HashMap<String, String> member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String macGet(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String logST_Logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String memberFindView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String idFind(@RequestParam String userID, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String deleteMember(@RequestParam("ID") String userID,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
