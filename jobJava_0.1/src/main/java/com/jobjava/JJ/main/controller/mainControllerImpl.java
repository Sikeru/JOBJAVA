package com.jobjava.JJ.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.main.service.MainService;

@Controller("mainController")
@RequestMapping(value="/main")
public class mainControllerImpl implements mainController{
	@Autowired
	MainService mainservice;
	@RequestMapping(value= "/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView tomain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value="/bessinfo.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mainservice.mnLog(request.getParameter("mnName"));
		mav.setViewName(viewName);
		return mav;
	}

}
