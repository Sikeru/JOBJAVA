package com.jobjava.JJ.cafe.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface MyPageDAO {
	public List selectMyOrderInfo(String order_id) throws DataAccessException;
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public void updateMyOrderCancel(String order_id) throws DataAccessException;
}
