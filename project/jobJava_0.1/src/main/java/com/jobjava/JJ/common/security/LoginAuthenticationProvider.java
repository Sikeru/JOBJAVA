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

//이 클래스에 대한 bean 객체 만들기
@Service("loginAuthenticationProvider")
public class LoginAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	UserDetailsService loginService;
	
	@Autowired
	BCryptPasswordEncoder bPasswordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		//DB에서 유저 레코드를 DTO객체로 가져오기
		String userId = authentication.getName();
		String userPw = (String) authentication.getCredentials();
		UserDetailsDto userDetailsDto = (UserDetailsDto) loginService.loadUserByUsername(userId);
		
		//LoginFailHandler로 오류를 던짐
		if (userDetailsDto == null || !userId.equals(userDetailsDto.getUsername())
				|| !bPasswordEncoder.matches(userPw, userDetailsDto.getPassword())) {
			throw new BadCredentialsException(userId); //아이디, 비밀번호 불일치
		} else if(!userDetailsDto.isEnabled()) {
			throw new DisabledException(userId); //계정 비활성화
		} else if(!userDetailsDto.isAccountNonLocked()) {
			throw new LockedException(userId); //계정 잠김
		} else if (!userDetailsDto.isAccountNonExpired()) {
			throw new AccountExpiredException(userId); //계정 만료
		} else if (!userDetailsDto.isCredentialsNonExpired()) {
			throw new CredentialsExpiredException(userId); //비밀번호 만료
		}
		
		//로그인 성공
		userDetailsDto.setPassword(null);
		
		Authentication newAuth = new UsernamePasswordAuthenticationToken(userId,null,userDetailsDto.getAuthorities());
		return newAuth;		
	}
	
	//반환 객체 타입 검사
	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}