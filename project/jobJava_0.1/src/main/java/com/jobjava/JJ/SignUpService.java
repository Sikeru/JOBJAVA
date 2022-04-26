package com.jobjava.JJ;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

//�� Ŭ������ ���� bean ��ü �����
@Service("signUpService")
public class SignUpService {
	
	@Autowired
	private BCryptPasswordEncoder bPasswordEncoder;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public boolean insertUserInfo(String username, String password) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		UserDetailsDto user = dao.selectUser(username);
		if (user != null) {
			return false;
		}
		else {
			dao.userSignUp(username,bPasswordEncoder.encode(password), '1'); //���� ���
			dao.giveAuth(username, "ROLE_USER"); //�⺻ ���� �ο�
			return true;
		}
	}
}