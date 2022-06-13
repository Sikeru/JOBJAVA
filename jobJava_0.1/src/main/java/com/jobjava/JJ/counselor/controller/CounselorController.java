package com.jobjava.JJ.counselor.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.counselor.vo.CriteriaVO;
import com.jobjava.JJ.counselor.vo.SearchCriteria;
import com.jobjava.JJ.counselor.vo.SturegVO;

public interface CounselorController {
	public ModelAndView counselor(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 상담사 기업등록 페이지 호출
	public ModelAndView jobregForm(HttpServletRequest request, HttpServletResponse response) throws Exception;


	// 상담사 대학등록 페이지 호출
	public ModelAndView uniregForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String adduni(@RequestParam HashMap<String, String> uniregVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 상담사가 등록한 대학 등록 게시판
	public ModelAndView uniregList(CriteriaVO cri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 대학 등록 상세창 조회
	public ModelAndView uniregView(HttpServletRequest request, HttpServletResponse response,
	          @RequestParam int UNI_B_NO) throws Exception;
	
	// 접수상태 변경
	public ResponseEntity modifyuniregState(@RequestParam HashMap<String, String> unireg, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;

	public String regcheck(@RequestParam HashMap<String, String> uniregVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView addUni(@RequestParam HashMap<String, String> UniregVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView companyDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("regiNO") String regiNO) throws Exception;

	// 업무일지
	public ModelAndView journalList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 학생 급여 조회
	public ModelAndView studentSalaryList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	// 대학사업비 조회
	public ModelAndView universitySalaryList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	//상담일지관리 등록
	public ModelAndView consultationJournalForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String addjou(@RequestParam HashMap<String, String> consultationJournalVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;	
	
	// 상담 일지 관리 리스트
	public ModelAndView consultationList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	// 학생 등록 페이지
	public ModelAndView studenregForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String addstu(@RequestParam HashMap<String, String> sturegVO,HttpServletRequest request, HttpServletResponse response) throws Exception;	
		public ModelAndView studenView(HttpServletRequest request, HttpServletResponse response,
		          @RequestParam String CM_NO) throws Exception;
		
//상담사가 등록한 학생 등록 게시판
	public ModelAndView studenList(SearchCriteria scri, Model model, HttpServletRequest request,
		         HttpServletResponse response) throws Exception;
//			public ModelAndView studenList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView studenupdateView(HttpServletRequest request, HttpServletResponse response, String CM_NO)
			throws Exception;
	ResponseEntity studenupdate(SturegVO sturegVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView companyupdateView(HttpServletRequest request, HttpServletResponse response, String CM_NO)
			throws Exception;
	// 기업 등록 페이지
	public ModelAndView companyList(SearchCriteria scri, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView companyregForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String addcompany(@RequestParam HashMap<String, String> comregVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView companyView(HttpServletRequest request, HttpServletResponse response, @RequestParam String CM_NO)
			throws Exception;

	// 기업등록 목록 페이지 호출
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
		
	// 일자리 매칭
	public ModelAndView jobMatchingView(Principal principal,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity memberMatching(@RequestParam HashMap<String, String> member, HttpServletRequest request, 
				HttpServletResponse response) throws Exception;

	ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request, HttpServletResponse response,
			Object commuteCheck) throws Exception;

}
