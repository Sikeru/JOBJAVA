package com.jobjava.JJ.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.board.service.BoardService;
import com.jobjava.JJ.board.vo.QnAVO;


@Controller("BoardController")
@RequestMapping(value="/board")
public class BoardControllerImpl implements BoardController{
	@Autowired
	BoardService boardservice;

	@Override
	@RequestMapping(value = "/board/listArticles.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		{
			String viewName = (String)request.getAttribute("viewName");

			ModelAndView mav = new ModelAndView(viewName);

			return mav;
		}
	}

	@Override
	public ModelAndView tomain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@RequestMapping(value="/qnATable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView qnATable(@RequestParam HashMap<String, Integer> paging,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		if(paging.isEmpty()) {
			paging.put("section", 1);
			paging.put("pageNum", 1);
		}
		
		List<QnAVO> qnavo = boardservice.qnaSelectAll(paging);
		int qnaTotalTable = boardservice.qnaTotalTable();
		mav.addObject("qnaTotal", qnaTotalTable);
		mav.addObject("qna", qnavo);
		mav.addObject("paging", paging);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/qnAAddTableView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView qnAAddTableView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/qnAAddTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String qnAAddTable(@ModelAttribute("QnAVO") QnAVO _qnAVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		boardservice.insertQnATable(_qnAVO);
		return "redirect:/board/qnATable.do";
	}
	
	@RequestMapping(value="/qnATableView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView qnATableView(@RequestParam("QNA_NO") int _QNA_NO ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		QnAVO qnavo = boardservice.qnaSelectOne(_QNA_NO);
		mav.addObject("qna", qnavo);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/qnAUpDateTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity qnAUpDateTable(@ModelAttribute("QnAVO") QnAVO _qnAVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		boardservice.upDateQnATable(_qnAVO);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('수정을 마쳤습니다. 원래 페이지로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/board/qnATableView.do?QNA_NO="+_qnAVO.getQNA_NO()+"';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/board/qnATableView.do?QNA_NO='"+_qnAVO.getQNA_NO()+"';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/searchQNATable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchQNATable(@RequestParam HashMap<String, Object> search, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		if(search.get("section") == null && search.get("pageNum") == null) {
			search.put("section", 1);
			search.put("pageNum", 1);
		}
		
		HashMap<String, Integer> paging = new HashMap<String, Integer>();
		List<QnAVO> qnavo = boardservice.qnaSelectSearch(search);
		int	qnaTotalTable = boardservice.qnaSelectTotalSearch(search);
		
		paging.put("section", Integer.parseInt(String.valueOf(search.get("section"))));
		paging.put("pageNum", Integer.parseInt(String.valueOf(search.get("pageNum"))));
		mav.addObject("qnaTotal", qnaTotalTable);
		mav.addObject("qna", qnavo);
		mav.addObject("paging", paging);
		mav.addObject("search", search);
		
		mav.setViewName("/board/qnATable");
		return mav;
	}
	
	

	

}
	
