package com.jobjava.JJ.common.security;

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

import com.jobjava.JJ.UserDetailsDto;

//�� Ŭ������ ���� bean ��ü �����
@Service("loginAuthenticationProvider")
public class LoginAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	UserDetailsService loginService;
	
	@Autowired
	BCryptPasswordEncoder bPasswordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		//DB���� ���� ���ڵ带 DTO��ü�� ��������
		String userId = authentication.getName();
		String userPw = (String) authentication.getCredentials();
		UserDetailsDto userDetailsDto = (UserDetailsDto) loginService.loadUserByUsername(userId);
		
		//LoginFailHandler�� ������ ����
		if (userDetailsDto == null || !userId.equals(userDetailsDto.getUsername())
				|| !bPasswordEncoder.matches(userPw, userDetailsDto.getPassword())) {
			throw new BadCredentialsException(userId); //���̵�, ��й�ȣ ����ġ
		} else if(!userDetailsDto.isEnabled()) {
			throw new DisabledException(userId); //���� ��Ȱ��ȭ
		} else if(!userDetailsDto.isAccountNonLocked()) {
			throw new LockedException(userId); //���� ���
		} else if (!userDetailsDto.isAccountNonExpired()) {
			throw new AccountExpiredException(userId); //���� ����
		} else if (!userDetailsDto.isCredentialsNonExpired()) {
			throw new CredentialsExpiredException(userId); //��й�ȣ ����
		}
		
		//�α��� ����
		userDetailsDto.setPassword(null);
		
		Authentication newAuth = new UsernamePasswordAuthenticationToken(userId,null,userDetailsDto.getAuthorities());
		return newAuth;		
	}
	
	//��ȯ ��ü Ÿ�� �˻�
	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}