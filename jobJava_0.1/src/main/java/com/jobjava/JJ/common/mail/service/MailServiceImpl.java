package com.jobjava.JJ.common.mail.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.common.mail.dao.MailDAO;

@Service(value="MailService")
public class MailServiceImpl implements MailService{
	@Autowired
	private BCryptPasswordEncoder bPasswordEncoder;	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public String findPwCertiMail(HashMap<String, String> member) throws Exception {
		MailDAO dao = sqlSession.getMapper(MailDAO.class);
		return dao.findPwCertiMail(member);
	}

	@Override
	public void pwdChange(HashMap<String, String> member) throws Exception {
		member.put("PWD",bPasswordEncoder.encode(member.get("DecryptionPWD")));
		MailDAO dao = sqlSession.getMapper(MailDAO.class);
		dao.pwdChange(member);
	}


}
