package com.jobjava.JJ.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.main.vo.SearchCriteria;

public interface mainController {
	public ModelAndView tomain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String alarmCenter(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView bestCompany(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity insertBestCompany(@RequestParam("BC_NAME") String bc_name,@RequestParam("BC_HP") String bc_hp,@RequestParam MultipartFile files, HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ResponseEntity deleteBestCompany(@RequestParam("BC_NO")String bc_no, HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ResponseEntity updateBestCompany(@RequestParam HashMap<String,String> company,@RequestParam("BC_FILENAME") MultipartFile files, HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView supportTable(SearchCriteria scri,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
