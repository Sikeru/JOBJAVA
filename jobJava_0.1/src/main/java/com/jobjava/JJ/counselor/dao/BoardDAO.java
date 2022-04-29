package com.jobjava.JJ.counselor.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface BoardDAO {
	public List selectAllArticlesList() throws DataAccessException;

}
