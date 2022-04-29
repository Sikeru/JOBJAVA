package com.jobjava.JJ;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value= "/" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/main/main");
		return mav;
	}
	
	
	@RequestMapping("/login.html")
	public String login(HttpServletRequest request, Model model, Authentication authentication) {
        String uri = request.getHeader("Referer"); //이전 경로
        //이전 경로가 로그인 관련 페이지가 아닐 경우에만 저장, 속성값이 null이 되면 오류가 발생하므로 이 경우도 처리한다.
		if(uri!=null && !(uri.contains("/member/loginForm.do")||uri.contains("/login_check"))) request.getSession().setAttribute("prevPage", uri);
		return "/main/main";
	}
	

		

}
