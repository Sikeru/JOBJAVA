package com.spring.ex02;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class UserController extends MultiActionController {
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userID="";
		String passwd="";
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		userID = request.getParameter("userID");
		passwd = request.getParameter("passwd");
		String viewName = getViewName(request);
		
		mav.addObject("userID",userID);
	    mav.addObject("passwd",passwd);
	    mav.setViewName(viewName);
	    System.out.println("ViewName:"+viewName);
		return mav;
	}
	private  String getViewName(HttpServletRequest request) throws Exception {
	      String contextPath = request.getContextPath();
	      String uri = (String)request.getAttribute("javax.servlet.include.request_uri");
	      if(uri == null || uri.trim().equals("")) {
	         uri = request.getRequestURI();
	      }

	      int begin = 0;
	      if(!((contextPath==null)||("".equals(contextPath)))){
	         begin = contextPath.length();   // ��ü ��û���� ����
	      }

	      int end;
	      if(uri.indexOf(";")!=-1){
	         end=uri.indexOf(";");      // uri�� ;�� ���� ��� ;���� ��ġ�� ����
	      }else if(uri.indexOf("?")!=-1){
	         end=uri.indexOf("?");    // uri�� ?�� ���� ��� ?���� ��ġ�� ����
	      }else{
	         end=uri.length();
	      }

	      String fileName=uri.substring(begin,end);
	      if(fileName.indexOf(".")!=-1){
	         fileName=fileName.substring(0,fileName.lastIndexOf("."));  
                               // ��û���� ���� ���� .��ġ�� ���� �� .do�տ������� ���ڿ� ����
	      }
	      if(fileName.lastIndexOf("/")!=-1){
	         fileName=fileName.substring(fileName.lastIndexOf("/"),fileName.length());
                              // ��û���� ���� ���� /��ġ�� ���� �� / ���������� ���ڿ��� ����
	      }
	      return fileName;
	   }

}
