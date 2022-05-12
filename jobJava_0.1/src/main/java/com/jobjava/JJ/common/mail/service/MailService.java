package com.jobjava.JJ.common.mail.service;

import java.util.HashMap;

public interface MailService {
	public String findPwCertiMail(HashMap<String, String> member)throws Exception;
	public void pwdChange(HashMap<String, String> member)throws Exception;
}
