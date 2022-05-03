package com.jobjava.JJ.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jobjava.JJ.board.vo.QnAVO;

@Repository
public interface BoardDAO {
	public List selectAllArticlesList();
	public QnAVO qnaSelectAll();

}
