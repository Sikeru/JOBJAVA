package com.jobjava.JJ.counselor.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.counselor.service.CounselorService;
import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.UniregVO;


@Controller("CounselorController")
@RequestMapping(value = "/counselor")
public class CounselorControllerImpl implements CounselorController  {
	@Autowired
	CounselorService counselorService;

	private CounselorService service;

	private CounselorService counseolrService;

	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(CounselorController.class);
	
	// 상담사 메인페이지로 이동
	@RequestMapping(value = "/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	   public ModelAndView counselor(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      String viewName = (String) request.getAttribute("viewName");

	      List<HashMap<String, String>> counselor = counselorService.JobList();
	      mav.addObject("counselor", counselor);
	      
	      List<HashMap<String, String>> counselor1 = counselorService.JobList2();
	      mav.addObject("counselor1", counselor1);
	   
	      mav.setViewName(viewName);
	      return mav;
	      
	   }
	
	@RequestMapping(value = "/attendance.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView attendance(CriteriaVO cri, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List<HashMap<String, String>> attendanceCheck = counselorService.attendancelist();
		mav.addObject("attendanceCheck", attendanceCheck);
		mav.setViewName(viewName);
		
		/*
		 * int boardListCnt = counselorService.boardListCnt();
		 * System.out.println(boardListCnt);
		 * 
		 * // 페이징 객체 PagingVO paging = new PagingVO(); paging.setCri(cri);
		 * paging.setTotalCount(boardListCnt);
		 * 
		 * 
		 * List<Map<String, Object>> list = counselorService.boardList(cri); //한페이지당 보여줄
		 * 게시물 갯수 System.out.println(list);
		 * 
		 * model.addAttribute("list", list); model.addAttribute("paging", paging);
		 */

		return mav;
	}
	
	@RequestMapping(value = "/commuteCheck.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView commuteCheck(@RequestParam HashMap<String, String> commuteDate, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<HashMap<String, String>> commuteCheck = counselorService.commutelist(commuteDate);
		System.out.println(commuteDate);
		ModelAndView mav = new ModelAndView();

		mav.addObject("commuteCheck", commuteCheck);
		mav.setViewName("/counselor/commuteCheck");

		return mav;
	}
	
	@RequestMapping(value = "/jobregForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	   public ModelAndView jobregForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView("redirect:/counselor/uniregList");
	      String viewName = (String) request.getAttribute("viewName");
	      mav.setViewName(viewName);
	      return mav;
	   }

	
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
	
	@Override
	@RequestMapping(value = "/adduni.do")
	   public String adduni(@RequestParam HashMap<String, String> uniregVO, HttpServletRequest request, 
			   HttpServletResponse response) throws Exception {
		System.out.println(uniregVO);
	      counselorService.adduni(uniregVO);
	      return "redirect:/counselor/uniregList.do";
	}
	
	// 대학 등록
	@RequestMapping(value = "/uniregForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView uniregForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      String viewName = (String) request.getAttribute("viewName");
	      mav.setViewName(viewName);
	      return mav;
	   }
	
	// 대학 등록시 등록 목록으로 가게 하는(?) 코드
	

	// 대학 리스트

	@RequestMapping(value = "/uniregList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView uniregList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("uniregList", counselorService.uniList());
		String viewName = (String) request.getAttribute("viewName");
	     mav.setViewName(viewName);
		return mav;
	}

	
	  //채용정보 상세창
    @RequestMapping(value = "/uniregView.do", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView uniregView(HttpServletRequest request, HttpServletResponse response,
          @RequestParam String unibno) throws Exception {
       ModelAndView mav = new ModelAndView();
       String viewName = (String) request.getAttribute("viewName");
       UniregVO detail = counselorService.selectProgram(unibno);
       mav.addObject("uniread", detail); // ("jsp에서 받는 이름", 주는 데이터) 
       mav.setViewName(viewName);
       return mav;
    }



	@Override
	@RequestMapping(value = "/modifyuniregState", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity modifyuniregState(@RequestParam HashMap<String, String> unireg, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			counselorService.modifyuniregState(unireg);
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders(); message = "mod_success";
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			return resEntity;
	}



	@Override
	@RequestMapping(value = "/regcheck.do")
	public String regcheck(HashMap<String, String> uniregVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			counselorService.regcheck(uniregVO);
			return "redirect:/counselor/uniregList.do";
	}

	@Override
	public ModelAndView addUni(HashMap<String, String> UniregVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView attendance(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * @Override public ModelAndView boardList(CriteriaVO cri, Model model,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * // TODO Auto-generated method stub return null; }
	 */

	@Override
	public ModelAndView companyDetail(HttpServletRequest request, HttpServletResponse response, String regiNO)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "/jobMatchingView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView jobMatchingView(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			String user_id = request.getParameter("ID");
			List<HashMap<String, Object>> bInfo = counselorService.selectAllBasketInfo(user_id);
			List<HashMap<String, String>> chMember = counselorService.selectAllChMember(user_id);
			mav.addObject("bInfo", bInfo);
			mav.addObject("member", chMember);
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
		}catch(Exception e) {
			mav.setViewName("/counselor/main");
		}
	    return mav;
	}
	
	@ResponseBody
	@Override
	@RequestMapping(value = "/memberMatching.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity memberMatching(@RequestParam HashMap<String, String> member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		counselorService.memberMatching(member);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('매칭완료했습니다.');";
		    message += " location.href='"+request.getContextPath()+"/counselor/main.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('오류가 발생했습니다.');";
		    message += " location.href='"+request.getContextPath()+"/counselor/main.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	
}
