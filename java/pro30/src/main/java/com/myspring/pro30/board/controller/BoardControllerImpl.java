package com.myspring.pro30.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.pro30.board.service.BoardService;
import com.myspring.pro30.board.vo.ArticleVO;

public class BoardControllerImpl implements BoardController{
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;

	@Override
	@RequestMapping(value = "/board/listArticles.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List articleList = boardService.listArticles();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articleList);
		return mav;
	}

}
