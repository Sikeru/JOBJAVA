package com.jobjava.JJ.cafe.controller;



import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.cafe.Calendar;
import com.jobjava.JJ.cafe.service.CafeService;
import com.jobjava.JJ.cafe.vo.Criteria;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.Paging;
import com.jobjava.JJ.cafe.vo.ProgramVO;

@Controller("CafeController")
@RequestMapping(value ="/cafe")
public class CafeControllerImpl implements CafeController {

	@Autowired
	CafeService cafeService;

	// 카페 메인 홈페이지로 이동
	@RequestMapping(value = "/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView cafeMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		mav.setViewName(viewName);
		return mav;
	}

	// 구직등록화면 호출
	@RequestMapping("/jobapp.do")
	public String jobapp(Model model) {
		return "/cafe/jobapp";
	}
	  
	// 구직등록 insert
	 
	 @RequestMapping("/jobresult.do") 
	 public String jobAppresult(@ModelAttribute("JobAppVO") JobAppVO _jobAppVO, HttpServletRequest request,
	  HttpServletResponse response) throws Exception { //사용자가 입력한 정보를 파라미터로 넘김
	  cafeService.insertJob(_jobAppVO);
	  
	  return "/cafe/main"; 
	  
	  
	  }
	 
	 // 기업  프로그램 등록화면 호출
		@RequestMapping("/mypage.do")
		public String cafemypage(Model model) {
			return "/mypage";
		}
		@Override
		//기업 프로그램 등록 insert
		@RequestMapping("/result.do")
		public String  mypageresult(@RequestParam HashMap<String, String> myPageVO, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			//사용자가 입력한 정보를 파라미터로 넘김
			cafeService.insertCompany(myPageVO);
			
			return "/cafe/main";
		
			
		}
		
	 @RequestMapping(value = "/hireinfo/hireinfo.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView hireinfo(HttpServletRequest request, HttpServletResponse response, Model model)
				throws Exception {
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			List<ProgramVO> board = cafeService.boardList();
			mav.addObject("boardList", board); // 디벨로퍼 연동 a= 원하는 jsp에서 넣고 싶은 위치
			mav.setViewName(viewName);
			return mav;

		}

		// 게시판 페이징//

		@RequestMapping(value = "/hireinfopaging.do")
		public ModelAndView boardList(Criteria cri, Model model, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			// 전체 글 개수
			int boardListCnt = cafeService.boardListCnt();
			// 페이징 객체
			Paging paging = new Paging();
			paging.setCri(cri);
			paging.setTotalCount(boardListCnt);
			List<Map<String, Object>> list = cafeService.boardList(cri);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);

			return mav;
		}
		//캘린더//
		@RequestMapping(value = "/celender.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView calendar(HttpServletRequest request, HttpServletResponse response, Model model)
				throws Exception {
			ModelAndView mav = new ModelAndView();
			Date date = new Date();
			Calendar cal = new Calendar();
			String viewName = (String) request.getAttribute("viewName");
			String year;
			String month;
			String lastDay;
			
			if(request.getParameter("year")==null&&request.getParameter("month")==null) {
				year = String.valueOf(date.getYear()+1900);
				month = String.valueOf(date.getMonth()+1);
				lastDay =String.valueOf(cal.lastDay(date.getYear()+1900, date.getMonth()+1));
			}else {
				year = request.getParameter("year");
				month = request.getParameter("month");
				lastDay =String.valueOf(cal.lastDay(Integer.parseInt(request.getParameter("year")), Integer.parseInt(request.getParameter("month"))));
			}
			
			for (int i = 1; i <= Integer.parseInt(lastDay); i++) {
				List sDate = cafeService.sDate(year+"-"+month+"-"+i);
				List dDate = cafeService.dDate(year+"-"+month+"-"+i);
				mav.addObject("sdate"+i, sDate);
				mav.addObject("ddate"+i, dDate);
			}
			mav.setViewName(viewName);
			return mav;
		}

	

	 

}
