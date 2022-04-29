package com.jobjava.JJ.common.security;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.member.dao.memberDAO;
import com.jobjava.JJ.member.vo.MemberVO;

@Service("loginService")
public class LoginService implements UserDetailsService{	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVO loadUserByUsername(String username) throws UsernameNotFoundException {
		ArrayList<String> authList = new ArrayList<String>();
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		MemberVO membervo = dao.loginselectUser(username);
		authList = dao.getAuthList(username);
		
		if (membervo == null) { //User을 찾지 못했을 경우
			throw new UsernameNotFoundException(username);
		}
		else {
			membervo.setAuthority(authList);
		}
		return membervo; //완전한 UserDetails 객체
	}
}