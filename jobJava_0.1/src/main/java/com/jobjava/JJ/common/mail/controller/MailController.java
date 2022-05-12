package com.jobjava.JJ.common.mail.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;

public interface MailController {
	public String certiMail(@RequestParam String email, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String findPwCertiMail(@RequestParam HashMap<String, String> member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity pwdChange(@RequestParam HashMap<String, String> member,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
