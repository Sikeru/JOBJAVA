package com.jobjava.JJ.common.security;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.UserDetailsDto;
import com.jobjava.JJ.memberDAO;

@Service("loginService")
public class LoginService implements UserDetailsService{	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		ArrayList<String> authList = new ArrayList<String>();
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		
		UserDetailsDto userDetailsDto = dao.selectUser(username);
		authList = dao.getAuthList(username);
		
		if (userDetailsDto == null) { //User�� ã�� ������ ���
			throw new UsernameNotFoundException(username);
		}
		else {
			userDetailsDto.setAuthority(authList);
		}
		
		return userDetailsDto; //������ UserDetails ��ü
	}
}