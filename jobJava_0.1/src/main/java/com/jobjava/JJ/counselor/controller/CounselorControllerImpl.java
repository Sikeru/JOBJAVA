package com.jobjava.JJ.counselor.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.counselor.service.CounselorService;

@Controller("CounselorController")
@RequestMapping(value = "/counselor")
public class CounselorControllerImpl implements CounselorController  {
	@Autowired
	CounselorService counselorService;

	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(CounselorController.class);
	
	// 상담사 메인페이지로 이동
	@RequestMapping(value = "/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView counselor(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List<HashMap<String, String>> counselor = counselorService.JobList();
		mav.addObject("counselor", counselor);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/jobregForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	   public ModelAndView jobregForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      String viewName = (String) request.getAttribute("viewName");
	      mav.setViewName(viewName);
	      return mav;
	   }
	
//	@RequestMapping(value = "/addJob.do", method = { RequestMethod.POST, RequestMethod.GET })
//	   public ModelAndView addJob(@ModelAttribute("JobregVO") JobregVO jobregVO,
//			   HttpServletRequest request, HttpServletResponse response) throws Exception {
//	      ModelAndView mav = new ModelAndView();
//	      System.out.println(jobregVO.getCAREER());
//	      counselorService.addJob(jobregVO);
//	      String viewName = (String) request.getAttribute("viewName");
//	      mav.setViewName(viewName);
//	      return mav;
//	   }
	
	// 조회창 만들면 조회창으로 가도록 수정하기 !!!!!!!
	
	@RequestMapping(value = "/addJob.do", method = { RequestMethod.POST, RequestMethod.GET })
	   public ModelAndView addJob(@RequestParam HashMap<String, String> jobregVO,
			   HttpServletRequest request, HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      counselorService.addJob(jobregVO);
	      String viewName = (String) request.getAttribute("viewName");
	      mav.setViewName(viewName);
	      return mav;
	   }
	
	@RequestMapping(value = "/uniregForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView uniregForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 ModelAndView mav = new ModelAndView();
     String viewName = (String) request.getAttribute("viewName");
     mav.setViewName(viewName);
     return mav;
   }
	
	@RequestMapping(value = "/addUni.do", method = { RequestMethod.POST, RequestMethod.GET })
	   public ModelAndView addUni(@RequestParam HashMap<String, String> uniregVO,
			   HttpServletRequest request, HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      counselorService.addUni(uniregVO);
	      String viewName = (String) request.getAttribute("viewName");
	      mav.setViewName(viewName);
	      return mav;
	   }
 
}
	  