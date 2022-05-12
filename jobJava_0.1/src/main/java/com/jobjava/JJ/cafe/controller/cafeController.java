package com.jobjava.JJ.cafe.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.cafe.vo.Criteria;
import com.jobjava.JJ.cafe.vo.JobAppVO;



public interface CafeController {
	//���� ���� Ȩ�������� �̵�
	public ModelAndView cafeMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//���� ������� �������� �̵�
	public String jobapp(Model model) throws Exception;
	//���� �������
	public String jobAppresult(@ModelAttribute("JobAppVO") JobAppVO jobAppVO, HttpServletRequest request, HttpServletResponse response) throws
	  Exception;

	//���� ������ �������� �̵�
	public String cafemypage(Model model) throws Exception;
	//���� ������
	public String mypageresult(@RequestParam HashMap<String, String> myPageVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
		
	  //���� �Խ��� 
	  ModelAndView boardList(Criteria cri, Model model, HttpServletRequest request, HttpServletResponse response)
				throws Exception;
	  
	  ModelAndView hireinfo(HttpServletRequest request, HttpServletResponse response, Model model)
				throws Exception;
	

}
