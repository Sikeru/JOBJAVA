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
	@Autowired
	SignUpService signUpService;
	
	@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		System.out.println(viewName);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/member/loginForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping("/login.html")
	public String login(HttpServletRequest request, Model model, Authentication authentication) {
        String uri = request.getHeader("Referer"); //���� ���
        
        //�̹� ������ ������� �α��� ������ ���� ����
		// if(authentication!=null) return "duplicateLoginAlert";
        
        	//���� ��ΰ� �α��� ���� �������� �ƴ� ��쿡�� ����, �Ӽ����� null�� �Ǹ� ������ �߻��ϹǷ� �� ��쵵 ó���Ѵ�.
		if(uri!=null && !(uri.contains("/member/loginForm.do")||uri.contains("/login_check"))) request.getSession().setAttribute("prevPage", uri);
		return "/main/main";
	}
	

		
	@RequestMapping("/member/signUpView.do")
	public String signUpView(Model model) {
		return "signUpView";
	}
		
	@RequestMapping("/member/signUp.do")
	public String signUp(HttpServletRequest request, Model model) {
		//����ڰ� �Է��� ������ �Ķ���ͷ� �ѱ�
		boolean isInserted = signUpService.insertUserInfo(request.getParameter("id"), request.getParameter("password"));
		if(isInserted) return "login";
		else return "signUpView";
	}
}
