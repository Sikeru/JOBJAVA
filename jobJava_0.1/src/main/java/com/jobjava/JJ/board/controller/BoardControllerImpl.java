package com.jobjava.JJ.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
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
	public ModelAndView qnATable(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		List<QnAVO> qnavo = boardservice.qnaSelectAll();
		mav.addObject("qna", qnavo);
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
	public String qnAUpDateTable(@ModelAttribute("QnAVO") QnAVO _qnAVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		boardservice.upDateQnATable(_qnAVO);
		return "redirect:/board/qnATableView.do?QNA_NO="+_qnAVO.getQNA_NO();
	}
	

	

}
	
