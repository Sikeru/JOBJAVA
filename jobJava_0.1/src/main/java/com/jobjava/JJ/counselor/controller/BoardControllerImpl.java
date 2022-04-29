package com.jobjava.JJ.counselor.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.counselor.service.BoardService;
import com.jobjava.JJ.counselor.vo.ArticleVO;

@Controller("boardController")
public class BoardControllerImpl  implements BoardController{
		private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
		@Autowired
		private BoardService boardService;
		
		@Override
		@RequestMapping(value= "/board/listArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			List articlesList = boardService.listArticles();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("articlesList", articlesList);
			return mav;
			
		}

}
