package com.jobjava.JJ.member.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jobjava.JJ.member.dao.memberDAO;
import com.jobjava.JJ.member.vo.CMemberVO;
import com.jobjava.JJ.member.vo.EMemberVO;
import com.jobjava.JJ.member.vo.MMemberVO;
import com.jobjava.JJ.member.vo.MemberVO;
import com.jobjava.JJ.member.vo.NMemberVO;
import com.jobjava.JJ.member.vo.SMemberVO;

@Service("MemberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	@Autowired
	private BCryptPasswordEncoder bPasswordEncoder;	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertUserInfo(MemberVO membervo) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		membervo.setPWD(bPasswordEncoder.encode(membervo.getPWD()));
		MemberVO user = dao.selectUser(membervo);
		if (user != null) {
			return false;
		}
		else {
			if(membervo.getAUTHORITY().equals("ROLE_USER")) {
				dao.userSignUp(membervo); //유저 등록
				dao.NuserSignUp(membervo); //일반 유저 등록
			}else if(membervo.getAUTHORITY().equals("ROLE_STU")){
				dao.userSignUp(membervo); //유저 등록
				dao.SuserSignUp(membervo); //학생 유저 등록
			}else if(membervo.getAUTHORITY().equals("ROLE_COM")) {
				dao.userSignUp(membervo); //유저 등록
				dao.CuserSignUp(membervo);
			}else if(membervo.getAUTHORITY().equals("ROLE_EMP")) {
				dao.userSignUp(membervo); //유저 등록
				dao.EuserSignUp(membervo);//직원등록
			}else if(membervo.getAUTHORITY().equals("ROLE_MAG")) {
				dao.userSignUp(membervo); //유저 등록
				dao.MuserSignUp(membervo);//매니저등록
			}
			return true;
		}
	}

	@Override
	public MemberVO myInfo(String userId) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		MemberVO vo = dao.selectUserInfo(userId);
		return vo;
	}

	@Override
	public NMemberVO NUmyInfo(String userId) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		NMemberVO vo = dao.selectNUserInfo(userId);
		return vo;
	}
	@Override
	public SMemberVO SUmyInfo(String userId) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		SMemberVO vo = dao.selectSUserInfo(userId);
		return vo;
	}
	
	@Override
	public CMemberVO COMmyInfo(String userId) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		CMemberVO vo = dao.selectCOMInfo(userId);
		return vo;
	}

	@Override
	public EMemberVO EMPmyInfo(String userId) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		EMemberVO vo = dao.selectEMPInfo(userId);
		return vo;
	}

	@Override
	public MMemberVO MAGmyInfo(String userId) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		MMemberVO vo = dao.selectMAGInfo(userId);
		return vo;
	}

	@Override
	public void upDateMember(HashMap<String, String> member, String AUTHORITY) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		if(!member.get("passwd").equals(null) && !member.get("passwd").equals("")) {
			member.put("PWD",bPasswordEncoder.encode(member.get("passwd")));
		}
		if(AUTHORITY.equals("ROLE_USER")) {
			dao.upDateU(member);
			dao.upDateNU(member);
		}else if(AUTHORITY.equals("ROLE_STU")) {
			dao.upDateU(member);
			dao.upDateSU(member);
		}else if(AUTHORITY.equals("ROLE_COM")) {
			dao.upDateU(member);
			dao.upDateCOM(member);
		}else if(AUTHORITY.equals("ROLE_EMP")) {
			dao.upDateU(member);
			dao.upDateEMP(member);
		}else if(AUTHORITY.equals("ROLE_MAG")) {
			dao.upDateU(member);
			dao.upDateMAG(member);
		}
	}

	@Override
	public void logST_Logout() {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
	}

	@Override
	public String id_check(String userID) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		return dao.id_check(userID);
	}

	@Override
	public String email_check(String email) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		return dao.email_check(email);
	}

	@Override
	public String idFind(String email) {
		memberDAO dao = sqlSession.getMapper(memberDAO.class);
		return dao.idFind(email);
	}
	

}
