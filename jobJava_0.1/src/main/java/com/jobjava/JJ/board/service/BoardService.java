package com.jobjava.JJ.board.service;

import java.util.HashMap;
import java.util.List;

import com.jobjava.JJ.board.vo.EmploymentVO;
import com.jobjava.JJ.board.vo.OnlineVO;
import com.jobjava.JJ.board.vo.QnAVO;

public interface BoardService {
	public List<QnAVO> qnaSelectAll(HashMap<String, Integer> paging);
	public List<QnAVO> qnaSelectSearch(HashMap<String, Object> search);
	public int qnaSelectTotalSearch(HashMap<String, Object> search);
	public int qnaTotalTable();
	public void insertQnATable(QnAVO qnAVO);
	public QnAVO qnaSelectOne(int _QNA_NO);
	public void upDateQnATable(QnAVO qnAVO);
	public void qnADeleteTable(int _QNA_NO);
	public List<OnlineVO> onlineSelectAll(HashMap<String, Integer> paging);
	public List<OnlineVO> onlineSelectSearch(HashMap<String, Object> paging);
	public int onlineTotalTable();
	public int onlineSelectTotalSearch(HashMap<String, Object> search);
	public void insertOnlineTable(OnlineVO onlineVO);
	public OnlineVO onlineSelectOne(int ON_COM_NO);
	public void onlineDeleteTable(int ON_COM_NO);
	public void upDateonlineTable(OnlineVO onlineVO);
	public List<EmploymentVO> employmentSelectAll(HashMap<String, Integer> paging);
	public int employmentTotalTable();
	public EmploymentVO employmentSelectOne(int _EMP_CON_NO);
	public void employmentDeleteTable(int EMP_CON_NO);
	public void upDateemploymentTable(EmploymentVO _employmentVO);
	public void insertEmploymentTable(EmploymentVO _employmentVO);
	public List<EmploymentVO> employmentSelectSearch(HashMap<String, Object> search);
	public int employmentSelectTotalSearch(HashMap<String, Object> search);
	
}
