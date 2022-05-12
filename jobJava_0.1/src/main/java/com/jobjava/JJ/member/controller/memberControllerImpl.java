package com.jobjava.JJ.member.controller;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.member.service.MemberService;
import com.jobjava.JJ.member.vo.CMemberVO;
import com.jobjava.JJ.member.vo.EMemberVO;
import com.jobjava.JJ.member.vo.MMemberVO;
import com.jobjava.JJ.member.vo.MemberVO;
import com.jobjava.JJ.member.vo.NMemberVO;
import com.jobjava.JJ.member.vo.SMemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class memberControllerImpl implements memberController {
	@Autowired
	MemberService memberservice;
	
	
	@RequestMapping("/termsgree.do")
	public String termsgree(Model model) {
		return "/member/termsgree";
	}
	
	@RequestMapping("/signUpTestView.do")
	public ModelAndView signUpTestView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		try {
			if(request.getParameter("check").equals("checkAll")) {
				mav.setViewName("/member/signUpTestView");
				return mav;
			}
			mav.setViewName("/member/termsgree");
			return mav;
		}catch(Exception e) {
			mav.setViewName("/member/termsgree");
			return mav;
					
		}
	}
	
	@RequestMapping("/signUpView.do")
	public ModelAndView signUpView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		try {
		if(request.getParameter("email").equals(null)) {
			mav.setViewName("/member/termsgree");
			return mav;
		}
		if(memberservice.email_check(request.getParameter("email")).equals("TRUE")) {
			mav.addObject("msg", 1);
			mav.setViewName("/member/signUpTestView");
			return mav;
		}
		mav.addObject("email", request.getParameter("email"));
		mav.setViewName("/member/signUpView");
		return mav;
		
		}catch(NullPointerException e) {
			mav.setViewName("/member/termsgree");
			return mav;
		}

	}
	
	
	@Override
	@RequestMapping("/signUp.do")
	public String signUp(@ModelAttribute("memberVO") MemberVO _memberVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
		//����ڰ� �Է��� ������ �Ķ���ͷ� �ѱ�
		boolean isInserted = memberservice.insertUserInfo(_memberVO);
		if(isInserted) return "/member/loginForm";
		else return "/member/signUpView";
	}
	
	@RequestMapping(value="/loginForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/mypageForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView mypageForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String userId = request.getParameter("ID");
		MemberVO membervo = memberservice.myInfo(userId);
		if(membervo.getAUTHORITY().equals("ROLE_USER")) {
			NMemberVO nmembervo = memberservice.NUmyInfo(userId);
			mav.addObject("member", nmembervo);
		}else if(membervo.getAUTHORITY().equals("ROLE_STU")) {
			SMemberVO smembervo = memberservice.SUmyInfo(userId);
			mav.addObject("member", smembervo);
		}else if(membervo.getAUTHORITY().equals("ROLE_COM")) {
			CMemberVO commembervo = memberservice.COMmyInfo(userId);
			mav.addObject("member", commembervo);
		}else if(membervo.getAUTHORITY().equals("ROLE_EMP")) {
			EMemberVO empmembervo = memberservice.EMPmyInfo(userId);
			mav.addObject("member", empmembervo);
		}else if(membervo.getAUTHORITY().equals("ROLE_MAG")) {
			MMemberVO ummembervo = memberservice.MAGmyInfo(userId);
			mav.addObject("member", ummembervo);
		}
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myPageUpDate.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity myPageUpDate(@RequestParam HashMap<String, String> member,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO membervo = memberservice.myInfo(member.get("ID"));
		memberservice.upDateMember(member, membervo.getAUTHORITY());
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('ȸ�� ������ ���ƽ��ϴ�.����������â���� �̵��մϴ�.');";
		    message += " location.href='"+request.getContextPath()+"/member/mypageForm.do?ID="+member.get("ID")+"';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
		    message += " location.href='"+request.getContextPath()+"/member/mypageForm.do?ID='"+member.get("ID")+"';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@ResponseBody
	@RequestMapping(value="/macGet.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String macGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String rMac = null;
		InetAddress ip;
		try {
			ip = InetAddress.getLocalHost();
		   
			NetworkInterface network = NetworkInterface.getByInetAddress(ip);
			byte[] mac = network.getHardwareAddress();
		   
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < mac.length; i++) {
				sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
			}
				rMac = sb.toString();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (SocketException e){
			e.printStackTrace();
		}
		
		return rMac;
	}
	
	@RequestMapping(value="/logST_Logout.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String logST_Logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		memberservice.logST_Logout();
		return "/main/main";
	}
	
	@ResponseBody
	@RequestMapping(value="/id_check.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String id_check(@RequestParam String userID, HttpServletRequest request, HttpServletResponse response) throws Exception {
		return memberservice.id_check(userID);
	}

	@Override
	@RequestMapping(value="/memberFindView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String memberFindView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/member/memberFindView";
	}
		
	@Override
	@ResponseBody
	@RequestMapping(value="/idFind.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String idFind(String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		return memberservice.idFind(email);
	}


}
