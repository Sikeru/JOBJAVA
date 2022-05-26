package com.jobjava.JJ.counselor.controller;

import java.security.Principal;
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
import com.jobjava.JJ.counselor.vo.Paging;
import com.jobjava.JJ.counselor.vo.SearchCriteria;
import com.jobjava.JJ.counselor.vo.UniregVO;


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
	      
	      List<HashMap<String, String>> counselor1 = counselorService.JobList2();
	      mav.addObject("counselor1", counselor1);
	   
	      mav.setViewName(viewName);
	      return mav;
	      
	   }
	
//	@RequestMapping(value = "/attendance.do", method = { RequestMethod.POST, RequestMethod.GET })
//	public ModelAndView attendance(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		String viewName = (String) request.getAttribute("viewName");
//		
//		List<HashMap<String, String>> attendanceCheck = counselorService.attendancelist();
//		mav.addObject("attendanceCheck", attendanceCheck);
//		
//		mav.setViewName(viewName);
//
//		return mav;
//	}
//	
//	@RequestMapping(value = "/commuteCheck.do", method = { RequestMethod.POST, RequestMethod.GET })
//	public ModelAndView commuteCheck(@RequestParam HashMap<String, String> commuteDate, HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		List<HashMap<String, String>> commuteCheck = counselorService.commutelist(commuteDate);
//		System.out.println(commuteDate);
//		ModelAndView mav = new ModelAndView();
//
//		mav.addObject("commuteCheck", commuteCheck);
//		mav.setViewName("/counselor/commuteCheck");
//
//		return mav;
//	}


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
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(UniregVO uniregVO) throws Exception {
		System.out.println(uniregVO.getUNI_B_NO());
		System.out.println("update");
		counselorService.update(uniregVO);

		return "redirect:/counselor/uniregView.do?UNI_B_NO=" + uniregVO.getUNI_B_NO();
	}
	
	// 채용정보 삭제
	   @RequestMapping(value = "/delete", method = RequestMethod.POST)
	   public String delete(UniregVO uniregVO) throws Exception {
	      counselorService.delete(uniregVO.getUNI_B_NO());

	      return "redirect:/counselor/uniregList.do?UNI_B_NO=" + uniregVO.getUNI_B_NO();
	   }
	

//	 대학 리스트
//
//	@RequestMapping(value = "/uniregList.do", method = { RequestMethod.POST, RequestMethod.GET })
//	public ModelAndView uniregList(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("uniregList", counselorService.uniList());
//		String viewName = (String) request.getAttribute("viewName");
//	     mav.setViewName(viewName);
//		return mav;
//	}
	 
	   
	// 20220519 페이징 부분 (안되면 위에 주석 풀기)
	 @RequestMapping(value = "/uniregList.do")
		public ModelAndView uniregList(CriteriaVO cri, Model model, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
		     mav.setViewName(viewName);
		     
		     int uniregListCnt = counselorService.uniregListCnt(cri);
		  
		     Paging paging = new Paging();
		     paging.setCri(cri);
		     paging.setTotalCount(uniregListCnt); 
		     
		     List<Map<String, Object>> list = counselorService.uniregList(cri);
		     System.out.println(list);
		     model.addAttribute("list", list);
		     model.addAttribute("paging", paging);
		     
			 return mav;
		}

	// 학생 등록
			@RequestMapping(value = "/studenregForm.do", method = { RequestMethod.POST, RequestMethod.GET })
			public ModelAndView studenregForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			      ModelAndView mav = new ModelAndView();
			      String viewName = (String) request.getAttribute("viewName");
			      mav.setViewName(viewName);
			      return mav;
			   }
			
			@Override
			@RequestMapping(value = "/addstu.do")
			public String addstu(@RequestParam HashMap<String, String> sturegVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
				System.out.println(sturegVO);
			      counselorService.addstu(sturegVO);
			      return "redirect:/counselor/studenList.do";
			}
			
			@RequestMapping(value = "/studenList.do", method = { RequestMethod.POST, RequestMethod.GET })
			public ModelAndView studenList(HttpServletRequest request, HttpServletResponse response) throws Exception {
				ModelAndView mav = new ModelAndView();
				mav.addObject("studenlist", counselorService.stulist());
				String viewName = (String) request.getAttribute("viewName");
			     mav.setViewName(viewName);
				return mav;
			}
			
			// 기업 등록
			@RequestMapping(value = "/companyregForm.do", method = { RequestMethod.POST, RequestMethod.GET })
			public ModelAndView companyregForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			      ModelAndView mav = new ModelAndView();
			      String viewName = (String) request.getAttribute("viewName");
			      mav.setViewName(viewName);
			      return mav;
			   }

			@Override
			@RequestMapping(value = "/addcompany.do", method = RequestMethod.GET)
			public String addcompany(@RequestParam HashMap<String, String> ComregVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
				System.out.println(ComregVO);
			      counselorService.addcompany(ComregVO);
			      return "redirect:/counselor/main.do"; // 임시로 작성
			}
			
	  //채용정보 상세창
    @RequestMapping(value = "/uniregView.do", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView uniregView(HttpServletRequest request, HttpServletResponse response,
          @RequestParam int UNI_B_NO) throws Exception {
       ModelAndView mav = new ModelAndView();
       String viewName = (String) request.getAttribute("viewName");
       UniregVO detail = counselorService.selectProgram(UNI_B_NO);
       mav.addObject("list", detail); // ("jsp에서 받는 이름", 주는 데이터) 
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
			System.out.println(uniregVO);
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
	public ModelAndView companyDetail(HttpServletRequest request, HttpServletResponse response, String regiNO)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	//업무일지
	@RequestMapping("/journal.do")
	public ModelAndView journalList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		
		int counseolrServiceCnt = counselorService.counseolrServiceCnt(scri);
		
		List<HashMap<String, String>> journalCheck = counselorService.journalList();
		mav.addObject("journalCheck", journalCheck);
		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(counseolrServiceCnt);
		
		List<Map<String, Object>> list = counselorService.journalList(scri);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	// //기업등록 목록 페이지 호출
	@RequestMapping("/attendance.do")
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		
//		List<HashMap<String, Object>> list =  new ArrayList<HashMap<String, Object>>();
//		list = counselorService.boardList();
//		// 한페이지당 보여줄 게시물 개수

		
//		// 전체 글 개수
		int counseolrServiceCnt = counselorService.counseolrServiceCnt(scri);
//		System.out.println(counseolrServiceCnt);
		
//		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(counseolrServiceCnt);

		List<Map<String, Object>> list = counselorService.boardList(scri);
		
		// 한페이지당 보여줄 게시물 개수
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return mav;
	}

	// 일자리 매칭
	@Override
	@RequestMapping(value = "/jobMatchingView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView jobMatchingView(Principal principal, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			String user_id = principal.getName();
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
