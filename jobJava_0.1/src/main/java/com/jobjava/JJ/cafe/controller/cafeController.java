package com.jobjava.JJ.cafe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;

public interface CafeController {
	// ���� ���� Ȩ�������� �̵�
	public ModelAndView cafeMain(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// ���� ������� �������� �̵�
	public String jobapp(Model model) throws Exception;

	// ���� �������
	public String jobAppresult(@ModelAttribute("JobAppVO") JobAppVO jobAppVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// ������α׷���û(��������)
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	// ���� �Խ���
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	ModelAndView hireinfo(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception;

}
