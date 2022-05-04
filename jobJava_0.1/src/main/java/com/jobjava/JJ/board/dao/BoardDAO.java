package com.jobjava.JJ.board.dao;

import java.util.List;

import com.jobjava.JJ.board.vo.QnAVO;

public interface BoardDAO {
	public List selectAllArticlesList();
	public List<QnAVO> qnaSelectAll();
	public void insertQnATable(QnAVO qnAVO);
	public QnAVO qnaSelectOne(int QNA_NO);

}
