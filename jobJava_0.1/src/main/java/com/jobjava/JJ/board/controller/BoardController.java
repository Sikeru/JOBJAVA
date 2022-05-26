package com.jobjava.JJ.board.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.board.vo.EmploymentVO;
import com.jobjava.JJ.board.vo.OnlineVO;
import com.jobjava.JJ.board.vo.QnAVO;

public interface BoardController {
	public ModelAndView tomain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView qnATable(@RequestParam HashMap<String, Integer> paging,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView onlineConTable(@RequestParam HashMap<String, Integer> paging,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView qnAAddTableView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String qnAAddTable(@ModelAttribute("QnAVO") QnAVO _qnAVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView qnATableView(@RequestParam("QNA_NO") int _QNA_NO ,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity qnAUpDateTable(@ModelAttribute("QnAVO") QnAVO _qnAVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity qnADeleteTable(@RequestParam("QNA_NO") int _QNA_NO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchQNATable(@RequestParam HashMap<String, Object> search,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView onlineAddTableView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String onlineAddTable(@ModelAttribute("OnlineVO") OnlineVO _onlineVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView onlineTableView(@RequestParam("ON_COM_NO") int ON_COM_NO ,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity onlineDeleteTable(@RequestParam("ON_COM_NO") int ON_COM_NO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity upDateonlineTable(@ModelAttribute("OnlineVO") OnlineVO _onlineVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchOnlineTable(@RequestParam HashMap<String, Object> search, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView employmentConTable(@RequestParam HashMap<String, Integer> paging,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView employmentTableView(@RequestParam("EMP_CON_NO") int _EMP_CON_NO ,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView employmentAddTableView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity upDateEmploymentTable(@ModelAttribute("EmploymentVO") EmploymentVO _employmentVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ResponseEntity employmentDeleteTable(@RequestParam("EMP_CON_NO") int EMP_CON_NO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String employmentAddTable(@ModelAttribute("EmploymentVO") EmploymentVO _employmentVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchEmploymentTable(@RequestParam HashMap<String, Object> search, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView supportAddTableView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String supportAddTable(Principal principal,MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView supportTableView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity supportUpdateTable(Principal principal,MultipartHttpServletRequest multipartRequest,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity supportDeleteTable(@RequestParam("BOARD_NO") String BOARD_NO,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
