package com.jobjava.JJ.leader.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.leader.service.LeaderService;
import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.Criteria;
import com.jobjava.JJ.leader.vo.Paging;

@Controller("LeaderController")
@RequestMapping(value = "/leader")
public class LeaderControllerImpl implements LeaderController {

	@Autowired
	LeaderService leaderService;

	// �������� Ȩ�������� �̵�
	@Override
	@RequestMapping(value = "/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView leaderMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		mav.setViewName(viewName);
		return mav;
	}

	// ��� ��� ȭ�� ȣ��
	@Override
	@RequestMapping("/company.do")
	public String companyLegister(Model model) {
		return "/leader/companyLegister";
	}

	@Override
	// ��� ��� insert
	@RequestMapping("/legister.do")
	public String legister(@RequestParam HashMap<String, String> cRegVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// ����ڰ� �Է��� ������ �Ķ���ͷ� �ѱ�
		System.out.println(cRegVO);
		leaderService.insertCompany(cRegVO);
		return "redirect:/leader/companyLegisterList.do";

	}

	@Override
	// //������ ��� ������ ȣ��
	@RequestMapping("/companyLegisterList.do")
	public ModelAndView boardList(Criteria cri, Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		

		// ��ü �� ����
		int boardListCnt = leaderService.boardListCnt();
		System.out.println(boardListCnt);

		// ����¡ ��ü
		Paging paging = new Paging();
		paging.setCri(cri);
		paging.setTotalCount(boardListCnt);
		
	
		List<Map<String, Object>> list = leaderService.boardList(cri);
		//���������� ������ �Խù� ����
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return mav;
	}

	// ������� ��â
	@RequestMapping(value = "/companyDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView companyDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("regiNO") String regiNO) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		CRegVO detail = leaderService.selectRegi(regiNO);
		mav.addObject("detailList", detail);
		mav.setViewName(viewName);
		return mav;
	}

	// �������� ����Ʈ
	@RequestMapping(value = "/surveylist.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView surveylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// �����������������̵�
	@RequestMapping(value = "/addsurveryfrom.do", method = RequestMethod.GET)
	public ModelAndView addSurveryFrom(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// ����������
	@RequestMapping(value = "/addsurveryfrom.do", method = RequestMethod.POST)
	public ModelAndView addSurvery(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> articlMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		
		articlMap.put("id", request.getParameter("id"));
		articlMap.put("title", request.getParameter("title"));
		articlMap.put("sDate", request.getParameter("sDate"));
		articlMap.put("eDate", request.getParameter("eDate"));
		
		while(enu.hasMoreElements()) {
			String name =  (String) enu.nextElement();
			String value = request.getParameter(name);
			if (name.substring(0,3).equals("qno") && !value.equals(null) ) {
				articlMap.put(name, value);
			}
		}
		
		mav.setViewName("redirect:/leader/surveylist.do");
		return mav;
	}
}