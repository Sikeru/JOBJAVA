package com.jobjava.JJ;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value= "/main/home.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		System.out.println(viewName);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping("/index.html")
	public String home(Model model) {
		return "home";
	}
	
	@RequestMapping("/vip.html")
	public String vip(Model model) {
		return "vip";
	}
	
	@RequestMapping("/admin.html")
	public String admin(Model model) {
		return "admin";
	}
	
	@RequestMapping("/login.html")
	public String login(Model model) {
		return "login";
	}
	
}
