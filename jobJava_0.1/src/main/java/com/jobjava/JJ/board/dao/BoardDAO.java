package com.jobjava.JJ.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobjava.JJ.board.vo.DelBoardTableVO;
import com.jobjava.JJ.board.vo.EmploymentVO;
import com.jobjava.JJ.board.vo.OnlineVO;
import com.jobjava.JJ.board.vo.QnAVO;

public interface BoardDAO {
	public List selectAllArticlesList();
	public List<QnAVO> qnaSelectAll(HashMap<String, Integer> paging);
	public int qnaTotalTable();
	public void insertQnATable(QnAVO qnAVO);
	public QnAVO qnaSelectOne(int QNA_NO);
	public void upDateQnATable(QnAVO qnAVO);
	public void qnADeleteTable(int QNA_NO);
	public String selectEmpName(QnAVO qnAVO);
	public List<QnAVO> qnaSelectSearch(HashMap<String, Object> search);
	public int qnaSelectTotalSearch(HashMap<String, Object> search);
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
	public EmploymentVO employmentSelectOne(int EMP_CON_NO);
	public void employmentDeleteTable(int EMP_CON_NO);
	public void upDateemploymentTable(EmploymentVO employmentVO);
	public void insertEmploymentTable(EmploymentVO employmentVO);
	public List<EmploymentVO> employmentSelectSearch(HashMap<String, Object> search);
	public int employmentSelectTotalSearch(HashMap<String, Object> search);
	public void insertF_BOARD(Map<String, Object> articleMap);
	public void insertBOARD_FILE(List<String> fileName);
	public int selectNowBOARD_NO();
	public HashMap<String, String> selectOneFileTable(String BOARD_NO);
	public List<HashMap<String, String>> selectFileNames(String BOARD_NO);
	public void deleteFile(String BOARD_NO, String delfile);
	public void updateFileTable(Map<String, Object> articleMap);
	public void updateTableFile(String BOARD_NO, List<String> fileName);
	public void deleteFileTable(String BOARD_NO);
}