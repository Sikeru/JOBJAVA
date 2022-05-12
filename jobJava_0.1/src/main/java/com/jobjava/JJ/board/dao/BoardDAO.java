package com.jobjava.JJ.board.dao;

import java.util.HashMap;
import java.util.List;

import com.jobjava.JJ.board.vo.QnAVO;

public interface BoardDAO {
	public List selectAllArticlesList();
	public List<QnAVO> qnaSelectAll(HashMap<String, Integer> paging);
	public int qnaTotalTable();
	public void insertQnATable(QnAVO qnAVO);
	public QnAVO qnaSelectOne(int QNA_NO);
	public void upDateQnATable(QnAVO qnAVO);
	public String selectEmpName(QnAVO qnAVO);
}
