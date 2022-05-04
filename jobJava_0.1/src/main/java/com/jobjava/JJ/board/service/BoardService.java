package com.jobjava.JJ.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.board.vo.QnAVO;

public interface BoardService {
	public List<QnAVO> qnaSelectAll();
	public void insertQnATable(QnAVO qnAVO);
	public QnAVO qnaSelectOne(int _QNA_NO);
}
