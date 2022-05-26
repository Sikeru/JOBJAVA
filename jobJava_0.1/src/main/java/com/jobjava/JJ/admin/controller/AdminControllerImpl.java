package com.jobjava.JJ.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.admin.service.AdminService;
import com.jobjava.JJ.admin.vo.Paging;
import com.jobjava.JJ.admin.vo.SearchCriteria;
import com.jobjava.JJ.member.vo.MemberVO;

@Controller("adminController")
@RequestMapping(value="/admin")
public class AdminControllerImpl implements AdminController{
	@Autowired
	AdminService adminservice;
	
	@Override
	@RequestMapping(value= "/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminMain(SearchCriteria scri,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav=new ModelAndView();
		
		int boardListCnt = adminservice.selectAllMemberCnt(scri);

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(boardListCnt);

		List<MemberVO> member = adminservice.selectAllMember(scri);
		
		mav.addObject("paging", paging);
		mav.addObject("member", member);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@ResponseBody
	@RequestMapping(value= "/updateMember.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String updateMember(@ModelAttribute("MemberVO")MemberVO _memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			try{
				adminservice.updateMember(_memberVO);
				return "true";
			}catch(Exception e) {
				return "false";
			}
	}

	@Override
	@RequestMapping(value= "/loginStatistics.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView loginStatistics(SearchCriteria scri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav=new ModelAndView();
		
		int boardListCnt = adminservice.selectAllLoginStatisticsCnt(scri);

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(boardListCnt);

		List<HashMap <String,String>> member = adminservice.selectAllLoginStatistics(scri);
		
		mav.addObject("paging", paging);
		mav.addObject("member", member);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value= "/menuStatistics.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView menuStatistics(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		List<HashMap <String,String>> menuList = adminservice.selectAllMemuLog();
		mav.addObject("menuList", menuList);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value= "/authorityStatistics.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView authorityStatistics(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		List<String> authority = adminservice.selectAuthorityStatistics();
		mav.addObject("authority", authority);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

}

