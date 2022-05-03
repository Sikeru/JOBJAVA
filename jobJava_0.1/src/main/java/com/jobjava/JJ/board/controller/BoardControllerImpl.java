package com.jobjava.JJ.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
;
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
		QnAVO qnavo = boardservice.qnaSelectAll();
		mav.addObject("qna", qnavo);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

}
	
