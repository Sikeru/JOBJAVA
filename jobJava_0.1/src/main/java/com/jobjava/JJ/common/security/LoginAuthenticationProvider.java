package com.jobjava.JJ.common.security;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jobjava.JJ.member.dao.memberDAO;
import com.jobjava.JJ.member.vo.MemberVO;

//�� Ŭ������ ���� bean ��ü �����
@Service("loginAuthenticationProvider")
public class LoginAuthenticationProvider implements AuthenticationProvider{
	@Autowired
	UserDetailsService loginService;
	@Autowired
	BCryptPasswordEncoder bPasswordEncoder;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		//DB���� ���� ���ڵ带 DTO��ü�� ��������
		String userId = authentication.getName();
		String userPw = (String) authentication.getCredentials();
		MemberVO membervo = (MemberVO) loginService.loadUserByUsername(userId);
		
		//LoginFailHandler�� ������ ����
		if (membervo == null || !userId.equals(membervo.getUsername())
				|| !bPasswordEncoder.matches(userPw, membervo.getPassword())) {
			throw new BadCredentialsException(userId); //���̵�, ��й�ȣ ����ġ
		} else if(!membervo.isEnabled()) {
			throw new DisabledException(userId); //���� ��Ȱ��ȭ
		} else if(!membervo.isAccountNonLocked()) {
			throw new LockedException(userId); //���� ���
		} else if (!membervo.isAccountNonExpired()) {
			throw new AccountExpiredException(userId); //���� ����
		} else if (!membervo.isCredentialsNonExpired()) {
			throw new CredentialsExpiredException(userId); //��й�ȣ ����
		}
		
		//�α��� ����
		membervo.setPWD(null);
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		dao.log_Login(userId);
		
		
		
		Authentication newAuth = new UsernamePasswordAuthenticationToken(userId,null,membervo.getAuthorities());
		return newAuth;		
	}
	
	//��ȯ ��ü Ÿ�� �˻�
	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}