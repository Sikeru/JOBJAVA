package com.jobjava.JJ.calendar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController {
	@RequestMapping(value = "/celender/celender.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView calendar(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		model.addAttribute("test", "<h1>아아아아ㅏ</h1>");
		System.out.println();
		mav.setViewName(viewName);
		return mav;
	}
}
