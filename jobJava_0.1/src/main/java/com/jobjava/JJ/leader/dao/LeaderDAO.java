package com.jobjava.JJ.leader.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.jobjava.JJ.leader.vo.AppVO;
import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.FileVO;
import com.jobjava.JJ.leader.vo.SearchCriteria;
import com.jobjava.JJ.leader.vo.SurveyVO;

public interface LeaderDAO {
	// 기업정보 등록
	public void legisterAdd(HashMap<String, String> cRegVO);

	// 기업 id값 불러오기
	public String selectCompanyID(Map articleMap);

	public int selectREGI_NO(Map articleMap);

	// 프로그램신청
	public int insertNewArticle(Map articleMap) throws DataAccessException;

	public void insertNewImage(List<FileVO> imageFileList) throws DataAccessException;

	public int selectNewImageFileNO();

	// 湲곗뾽�벑濡� 議고쉶
	public List<CRegVO> selectCompanyLegister();

	// 페이징
	public List<Map<String, Object>> boardList(SearchCriteria scri);

	public int boardListCnt(SearchCriteria scri);

	// 기업번호조회
	public CRegVO selectRegi(String regiNO);

	// �궗�썝 �븘�씠�뵒濡� �궗�썝踰덊샇 議고쉶
	public int selectEmpNO(String id);

	// �쑀���븘�씠�뵒濡� 湲곕낯�젙蹂� 議고쉶
	public AppVO selectUserInfo(String id);

	// �궗�뾽踰덊샇濡� �젣紐⑹“�쉶
	public String selectCregtitle(int regiNO);

	// �꽕臾몄“�궗 �젙蹂대벑濡�
	public void addSurvery(int empNO, String title, String sDate, String eDate);

	//
	public int selectSvNO(String title);

	// �꽕臾몄“�궗 臾명빆�벑濡�
	public void addQuestion(String ql, int svNO);

	// �꽕臾몃━�뒪�듃議고쉶
	public List<SurveyVO> selectAllSurveyList();

	// �꽕臾몃Ц�빆 議고쉶
	public List<SurveyVO> selectContent(int svNO);

	// �꽕臾몄“�궗 踰덊샇濡� �긽�꽭�럹�씠吏�議고쉶
	public SurveyVO selectSurvey(int svNO);

	// �떟蹂��벑濡�
	public void insertAnswer(int qno, String answer, String id);
}
