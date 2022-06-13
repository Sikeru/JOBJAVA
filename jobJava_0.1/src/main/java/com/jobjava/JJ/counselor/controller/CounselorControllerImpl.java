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
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.counselor.service.CounselorService;
import com.jobjava.JJ.counselor.vo.ComregVO;
import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.JobcheckVO;
import com.jobjava.JJ.counselor.vo.JobregVO;
import com.jobjava.JJ.counselor.vo.Paging;
import com.jobjava.JJ.counselor.vo.SearchCriteria;
import com.jobjava.JJ.counselor.vo.SturegVO;
import com.jobjava.JJ.counselor.vo.UniregVO;

@Controller("CounselorController")
@RequestMapping(value = "/counselor")

public class CounselorControllerImpl implements CounselorController {
	private static String CURR_FILE_REPO_PATH = "C:\\project\\file";
	
	@Autowired
	private JavaMailSender mailSender;

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
	
	@RequestMapping(value = "/jobregView.do", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView jobregView(HttpServletRequest request, HttpServletResponse response,
          @RequestParam int JOB_NO) throws Exception {
       ModelAndView mav = new ModelAndView();
       String viewName = (String) request.getAttribute("viewName");
       JobregVO detail = counselorService.selectjob(JOB_NO);
       mav.addObject("job", detail); // ("jsp에서 받는 이름", 주는 데이터) 
       mav.setViewName(viewName);
       return mav;
    }
	

	@Override
	// 출석 정보 리스트
	@RequestMapping("/attendance.do")
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
		HttpServletResponse response, Object commuteCheck) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		// 전체 글 개수
		int counseolrServiceCnt = counselorService.counseolrServiceCnt(scri);

		// 페이징 객체
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
	
	
	// 프로그램 리스트
	@RequestMapping(value = "/alarmSend.do", method = { RequestMethod.POST, RequestMethod.GET })
	   public ModelAndView alarmSend(CriteriaVO cri, Model model, HttpServletRequest request,
	         HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      String viewName = (String) request.getAttribute("viewName");
	      mav.setViewName(viewName);
	      
	      int programListCnt = counselorService.programListCnt(cri);
	     
	      Paging paging = new Paging();
		     paging.setCri(cri);
		     paging.setTotalCount(programListCnt); 
		     
		     List<Map<String, Object>> alarm = counselorService.proList(cri);
//		     System.out.println(alarm);
		     model.addAttribute("alarm", alarm);
		     model.addAttribute("paging", paging);
		     
			 return mav;
		}
	
	// 프로그램 리스트 접수진행수정
	@RequestMapping("/updateproList.do")
	   public String updateproList(HttpServletRequest request,HttpServletResponse response) throws Exception {
	      String permission=request.getParameter("permission");
	      String programNO= request.getParameter("programNO");
//	      System.out.println(permission+","+programNO);
	      
	      counselorService.proNameList(permission,programNO);
	      return "redirect:/counselor/alarmSend.do";
	   }
	
	// 등록된 프로그램 기업 승인 기능 (뉴리더)
		@RequestMapping(value = "/programPermission.do", method = { RequestMethod.POST, RequestMethod.GET })
		   public ModelAndView programPermission(CriteriaVO cri, Model model, HttpServletRequest request,
		         HttpServletResponse response) throws Exception {
		      ModelAndView mav = new ModelAndView();
		      String viewName = (String) request.getAttribute("viewName");
		      mav.setViewName(viewName);
		      
		      int proListCnt = counselorService.proListCnt(cri);
		     
		      Paging paging = new Paging();
			     paging.setCri(cri);
			     paging.setTotalCount(proListCnt); 
			     
			     List<Map<String, Object>> prolist = counselorService.programPermission(cri);
//			     System.out.println(prolist);
			     model.addAttribute("prolist", prolist);
			     model.addAttribute("paging", paging);
			     
				 return mav;
			}
		
		@RequestMapping("/updateleadproList.do")
		   public String updateleadproList(HttpServletRequest request,HttpServletResponse response) throws Exception {
		      String m_result =request.getParameter("m_result");
		      String regi_NO = request.getParameter("regi_NO");
//		      System.out.println(m_result+","+regi_NO);

		      
		      counselorService.programList(m_result,regi_NO);
		      return "redirect:/counselor/programPermission.do";
		   }
	
	@RequestMapping("/attendance2.do")
	public ModelAndView boardList2(SearchCriteria scri, Model model, HttpServletRequest request,
		HttpServletResponse response, Object commuteCheck) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName("/counselor/attendance");

		// 전체 글 개수
		int counseolrServiceCnt = counselorService.counseolrServiceCnt2(scri);

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(counseolrServiceCnt);

		List<Map<String, Object>> list = counselorService.boardList2(scri);

		// 한페이지당 보여줄 게시물 개수
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

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

	@RequestMapping(value = "/addjob.do", method = { RequestMethod.POST, RequestMethod.GET })
    public String addjob(@RequestParam HashMap<String, String> jobregVO, HttpServletRequest request, 
          HttpServletResponse response) throws Exception {
       System.out.println(jobregVO);
       counselorService.addJob(jobregVO);
       return "redirect:/counselor/jobregList.do";
 }
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(UniregVO uniregVO) throws Exception {
//		System.out.println(uniregVO.getUNI_B_NO());
//		System.out.println("update");
		counselorService.update(uniregVO);

		return "redirect:/counselor/uniregView.do?UNI_B_NO=" + uniregVO.getUNI_B_NO();
	}
	
	// 기업 정보 수정
	@RequestMapping(value = "/jobupdate",  method = { RequestMethod.POST, RequestMethod.GET })
	public String jobupdate(JobregVO jobregVO) throws Exception {
//		System.out.println(jobregVO.getJOB_NO());
//		System.out.println("jobupdate");
		counselorService.jobupdate(jobregVO);

		return "redirect:/counselor/jobregView.do?JOB_NO=" + jobregVO.getJOB_NO();
	}
	// 채용정보 삭제
	   @RequestMapping(value = "/jobdelete", method = { RequestMethod.POST, RequestMethod.GET })
	   public String jobdelete(JobregVO jobregVO) throws Exception {
//		   System.out.println(jobregVO.getJOB_NO());
//		   System.out.println("jobdelete");
		   counselorService.jobdelete(jobregVO.getJOB_NO());

	      return "redirect:/counselor/jobregList.do?JOB_NO=" + jobregVO.getJOB_NO();
	   }
	   
	   @RequestMapping(value = "/delete", method = RequestMethod.POST)
	   public String delete(UniregVO uniregVO) throws Exception {
	      counselorService.delete(uniregVO.getUNI_B_NO());

	      return "redirect:/counselor/uniregList.do?UNI_B_NO=" + uniregVO.getUNI_B_NO();
	   }
	
	// 등록된 기업 리스트
	@RequestMapping(value = "/jobregList.do", method = { RequestMethod.POST, RequestMethod.GET })
	   public ModelAndView jobregList(CriteriaVO cri, Model model, HttpServletRequest request,
	         HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      String viewName = (String) request.getAttribute("viewName");
	      mav.setViewName(viewName);
	      
	      int jobListCnt = counselorService.jobListCnt(cri);
	     
	      Paging paging = new Paging();
		     paging.setCri(cri);
		     paging.setTotalCount(jobListCnt); 
		     
		     List<Map<String, Object>> job = counselorService.jobList(cri);
//		     System.out.println(job);
		     model.addAttribute("job", job);
		     model.addAttribute("paging", paging);
		     
			 return mav;
		}
	
	// 상담 일지 등록
	@Override
	@RequestMapping(value = "/addjou.do")
	public String addjou(@RequestParam HashMap<String, String> consultationJournalVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		counselorService.addJou(consultationJournalVO);
		String viewName = (String) request.getAttribute("viewName");
		return "redirect:/counselor/consultation.do";
	}
	@RequestMapping(value = "/consultationJournalForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView consultationJournalForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	
	// 대학 등록 action
	@Override
	@RequestMapping(value = "/adduni.do")
	public String adduni(@RequestParam HashMap<String, String> uniregVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
//		System.out.println(uniregVO);
		counselorService.adduni(uniregVO);
		return "redirect:/counselor/uniregList.do";
	}

	// 대학 등록 폼
	@RequestMapping(value = "/uniregForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView uniregForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 대학 리스트
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
//	     System.out.println(list);
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

	// 채용정보 상세창
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
	
    // 학생정보 상세창
    @RequestMapping(value = "/studenView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView studenView(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("CM_NO") String CM_NO) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
//		System.out.println(CM_NO);
		SturegVO studenlist = counselorService.selectStu(CM_NO);
		mav.addObject("studenlist", studenlist); // ("jsp에서 받는 이름", 주는 데이터)
		mav.setViewName(viewName);
		return mav;
	}
    
    @Override
	@RequestMapping(value = "/studenupdateView.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView studenupdateView(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("CM_NO") String CM_NO) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		SturegVO studenlist = counselorService.selectStu(CM_NO);
		mav.addObject("studenlist", studenlist);
//		System.out.println(studenlist);
		mav.setViewName(viewName);
		return mav;
	}
    
    
    @RequestMapping(value = "/studenupdate", method = RequestMethod.POST)
	public ResponseEntity studenupdate(SturegVO sturegVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println(sturegVO.getID());
		counselorService.studenupdate(sturegVO);
		counselorService.studenupdate2(sturegVO);
//		System.out.println("studenupdate");
		
		int cM_NO = sturegVO.getCM_NO();
		Map articleMap = new HashMap();
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			message = "<script>";
			message += " alert('수정완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/counselor/studenList.do';";
			message += " </script>";

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다.');";
			message += " location.href='" + request.getContextPath() + "/counselor/studenList.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
    
    @RequestMapping(value = "/studendelete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String studendelete(SturegVO SturegVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
//		System.out.println(SturegVO.getCM_NO());
        counselorService.studendelete(SturegVO.getCM_NO());
		return "redirect:/counselor/studenList.do";
	}
	
	@Override
	@RequestMapping(value = "/addstu.do")
	public String addstu(@RequestParam HashMap<String, String> sturegVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
//		   System.out.println(sturegVO);
		   counselorService.addstu(sturegVO);
		    return "redirect:/counselor/studenList.do";
	}
	 @RequestMapping(value = "/studenList.do", method = { RequestMethod.POST, RequestMethod.GET })
	   public ModelAndView studenList(SearchCriteria scri, Model model, HttpServletRequest request,
	         HttpServletResponse response) throws Exception {
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("studenlist", counselorService.stulist());
	      String viewName = (String) request.getAttribute("viewName");
	      mav.setViewName(viewName);
	      return mav;
	   }
	 //기업 등록
		@RequestMapping(value = "/companyregForm.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView companyregForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			      ModelAndView mav = new ModelAndView();
			      String viewName = (String) request.getAttribute("viewName");
			      mav.setViewName(viewName);
			      return mav;
			   }
		@RequestMapping(value = "/companyView.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView companyView(HttpServletRequest request, HttpServletResponse response, @RequestParam("CM_NO") String CM_NO)
				throws Exception {
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
//			System.out.println(CM_NO);
			ComregVO companylist = counselorService.selectCom(CM_NO);
			mav.addObject("companylist", companylist); // ("jsp에서 받는 이름", 주는 데이터)
			mav.setViewName(viewName);
			return mav;	
		}
		@Override
		@RequestMapping(value = "/companyupdateView.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView companyupdateView(HttpServletRequest request, HttpServletResponse response,
				@RequestParam("CM_NO") String CM_NO) throws Exception {
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			ComregVO companylist = counselorService.selectCom(CM_NO);
			mav.addObject("companylist", companylist);
			
			mav.setViewName(viewName);
			return mav;
		}
		
		@RequestMapping(value = "/companyupdate", method = RequestMethod.POST)
		public ResponseEntity companyupdate(ComregVO comregVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
//			System.out.println(comregVO.getCM_NO());
			counselorService.companyupdate(comregVO);
	        		
			int cM_NO = comregVO.getCM_NO();
	        Map articleMap = new HashMap();
			
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
			try {
				message = "<script>";
				message += " alert('수정완료되었습니다.');";
				message += " location.href='" + request.getContextPath() + "/counselor/companyList.do';";
				message += " </script>";

			} catch (Exception e) {
				message = "<script>";
				message += " alert('오류가 발생했습니다.');";
				message += " location.href='" + request.getContextPath() + "/counselor/companyList.do';";
				message += " </script>";
				e.printStackTrace();
			}
			
			resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			return resEntity;
		}
		
		@RequestMapping(value = "/companydelete.do", method = { RequestMethod.POST, RequestMethod.GET })
		public String companydelete(ComregVO comregVO, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
//			System.out.println(comregVO.getCM_NO());
	        counselorService.companydelete(comregVO.getCM_NO());
			return "redirect:/counselor/companyList.do";
		}
		
		@Override
		@RequestMapping(value = "/addcompany.do", method = { RequestMethod.POST, RequestMethod.GET })
		public String addcompany(@RequestParam HashMap<String, String> comregVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
//				System.out.println(comregVO);
			      counselorService.addcompany(comregVO);
			      return "redirect:/counselor/companyList.do"; // 임시로 작성
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
	
	@RequestMapping(value = "/companyList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView companyList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			mav.addObject("companylist", counselorService.comlist());
			String viewName = (String) request.getAttribute("viewName");
		     mav.setViewName(viewName);
			return mav;
		}
	
	// 직무체험 점검 테이블로 이동~.~
	@RequestMapping(value ="/JobcheckForm.do" , method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView JobcheckForm(HttpServletRequest request, HttpServletResponse response, Principal principal) {
		ModelAndView mav = new ModelAndView();
		String userid = principal.getName();
		List<HashMap <String, String>> jobcheck = counselorService.JobcheckForm();
		
		mav.addObject("selectID", jobcheck);
		
		String viewName = (String) request.getAttribute("viewName");
	     mav.setViewName(viewName);
			return mav;
		}	
	
	@ResponseBody
	@RequestMapping(value ="/selectAppNO.do" , method = { RequestMethod.POST, RequestMethod.GET })
	public List<HashMap <String, String>> selectAppNO(@RequestParam("ID") String id,Model model, HttpServletRequest request, HttpServletResponse response) {
		List<HashMap <String, String>> listAppNO = counselorService.listAppNO(id);
		model.addAttribute("listAppNO", listAppNO);
		return listAppNO;
		
	}
	
	
	@RequestMapping(value = "/jobcheck.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String jobcheck(@ModelAttribute("JobcheckVO") JobcheckVO jobcheckVO, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	   counselorService.jobcheckAdd(jobcheckVO);
		 
		return "redirect:/counselor/JobcheckForm.do";

	}


	@Override
	@RequestMapping(value = "/regcheck.do")
	public String regcheck(HashMap<String, String> uniregVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
//		System.out.println(uniregVO);
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
	// 업무일지
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

		List<HashMap<String, Object>> list = counselorService.journalList(scri);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		mav.setViewName(viewName);
		return mav;
	}

	@Override
	// 학생 급여 조회
	@RequestMapping("/studentSalary.do")
	public ModelAndView studentSalaryList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		int counseolrServiceCnt = counselorService.counseolrServiceCnt(scri);

		List<HashMap<String, String>> studentSalaryCheck = counselorService.studentSalaryList();
		mav.addObject("studentSalaryCheck", studentSalaryCheck);
		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(counseolrServiceCnt);

		List<HashMap<String, Object>> list = counselorService.studentSalaryList(scri);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		mav.setViewName(viewName);
		return mav;
	}
	@Override
	// 대학사업비 조회
	@RequestMapping("/universitySalary.do")
	public ModelAndView universitySalaryList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		int counseolrServiceCnt = counselorService.counseolrServiceCnt(scri);

		List<HashMap<String, String>> universitySalaryCheck = counselorService.universitySalaryList();
		mav.addObject("universitySalaryCheck", universitySalaryCheck);
		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(counseolrServiceCnt);

		List<HashMap<String, Object>> list = counselorService.universitySalaryList(scri);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	// 상담 일지 관리 리스트
	@RequestMapping("/consultation.do")
	public ModelAndView consultationList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		int counseolrServiceCnt = counselorService.counseolrServiceCnt(scri);

		List<HashMap<String, String>> consultationCheck = counselorService.consultationList();
		mav.addObject("consultationCheck", consultationCheck);
		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(counseolrServiceCnt);

		List<HashMap<String, Object>> list = counselorService.consultationList(scri);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	public ModelAndView companyList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	// 학생 급여 조회 수정
	@RequestMapping("/updateSalary.do")
	public String updateSalary(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String process=request.getParameter("process");
		String comNO= request.getParameter("comNO");
		
		counselorService.updateName(process,comNO);
		return "redirect:/counselor/studentSalary.do";
	}
	
	// 대학사업비 조회 수정
	@RequestMapping("/updateSalaryList.do")
	public String updateSalaryList(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String permission=request.getParameter("permission");
		String unibNO= request.getParameter("unibNO");
//		System.out.println(permission+","+unibNO);
		
		counselorService.updateNameList(permission,unibNO);
		return "redirect:/counselor/universitySalary.do";
	}

	@Override
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
// 설문조사 리스트
	@RequestMapping(value = "/surveylist.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView surveylist(HttpServletRequest request, HttpServletResponse response, SearchCriteria scri,
			Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SurveyVO> surverList = counselorService.SurveyList(scri);
		mav.addObject("surverList", surverList);

		String viewName = (String) request.getAttribute("viewName");

		// 전체 글 개수
		int surverListCnt = counselorService.SurveyListcnt();

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(surverListCnt);

//				List<Map<String, Object>> list = leaderService.viewCommuteList(userID);
		// 한페이지당 보여줄 게시물 갯수

//				model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		mav.setViewName(viewName);
		return mav;
	}

	// 설문조사등록폼으로이동
	@RequestMapping(value = "/addsurveryfrom.do", method = RequestMethod.GET)
	public ModelAndView addSurveryFrom(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 설문조사등록
	@RequestMapping(value = "/addsurveryfrom.do", method = RequestMethod.POST)
	public ModelAndView addSurvery(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		String viewName = (String) request.getAttribute("viewName");
		List<String> qList = new ArrayList();
		Enumeration enu = request.getParameterNames();
		int empNO = counselorService.selectEmpno(request.getParameter("name"));
		String title = request.getParameter("title");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String div = request.getParameter("div");

		counselorService.addSurvery(empNO, title, sDate, eDate, div);

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			if (name.substring(0, 3).equals("qno") && !value.equals("")) {
				qList.add(value);
			}
		}

		int svNO = counselorService.selectSvNO(title);
		for (String ql : qList) {
			System.out.println(ql);
			counselorService.addQuestion(ql, svNO);
		}
		mav.setViewName("redirect:/counselor/surveylist.do");
		return mav;
	}

	@RequestMapping(value = "/surveyDetail.do", method = RequestMethod.GET)
	public ModelAndView surveyDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("svNO") int svNO) {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		SurveyVO surveyDetail = counselorService.surveyDetail(svNO);
		List<SurveyVO> surveyinfo = counselorService.viewSurvey(svNO);
		mav.addObject("surveyDetail", surveyDetail);
		mav.addObject("surveyinfo", surveyinfo);
		mav.addObject("svNO", svNO);
		return mav;
	}

	@RequestMapping(value = "/surveyUpdate.do", method = RequestMethod.POST)
	public String surveyUpdate(HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, String> modQueList) {
		// cnt는 수정된 길이를 반환하고 len은 기존길이를 가져온다

		int svNO = Integer.parseInt(modQueList.get("svNO"));
		int cnt = Integer.parseInt(modQueList.get("cnt"));
		List<SurveyVO> surveyinfo = counselorService.viewSurvey(svNO);
		List<Integer> qNO = counselorService.firstQno(svNO);
		int len = surveyinfo.size();

		// 항목의 수가 변하지 않았을때
		if (len == cnt) {
			for (int qn : qNO) {
				System.out.println(svNO);
				counselorService.modQue(svNO, modQueList.get(String.valueOf(qn)), qn);
			}
		}
		// 항목의 수가 더 줄어들었을때
		else if (len > cnt) {
			for (int qn : qNO) {
				if (modQueList.get(String.valueOf(qn)) == null) {
					counselorService.delQue(qn);
				} else {
					counselorService.modQue(svNO, modQueList.get(String.valueOf(qn)), qn);
				}
			}
		}
		// 항목의 수가 늘어났을때
		else {
			for (int qn : qNO) {
				counselorService.modQue(svNO, modQueList.get(String.valueOf(qn)), qn);
			}
			for (int i = 1; modQueList.get("insertno" + i) != null; i++) {
				counselorService.addQuestion(modQueList.get("insertno" + i), svNO);
			}
		}
		return "redirect:/counselor/surveyDetail.do?svNO=" + svNO;
	}

	// 설문조사 삭제
	@RequestMapping(value = "/surveyDelete.do", method = RequestMethod.GET)
	public String surveyDelete(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("svNO") int svNO) {
		counselorService.delSur(svNO);

		return "redirect:/counselor/surveylist.do";
	}

	// 설문조사 결과
	@RequestMapping(value = "/surveyResult.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView surveyResult(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("svNO") String svNO) {
		List<Map<String, Object>> resultList = counselorService.resultList(svNO);
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		mav.addObject("resultList", resultList);
		return mav;
	}

}
