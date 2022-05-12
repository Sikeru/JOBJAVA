package com.jobjava.JJ.common.mail.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface MailDAO {
	public String findPwCertiMail(HashMap<String, String> member);
	public void pwdChange(HashMap<String, String> member);

}
