package com.jobjava.JJ.counselor.service;

import java.util.List;

import com.jobjava.JJ.counselor.vo.ArticleVO;

public interface BoardService {
	public List<ArticleVO> listArticles() throws Exception;
}
