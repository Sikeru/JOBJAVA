package com.jobjava.JJ.common.mail.controller;

import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jobjava.JJ.common.mail.service.MailService;


@Controller("MailController")
@RequestMapping(value="/mail")
public class MailControllerImpl implements MailController{
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MailService mailservice;

	@ResponseBody
	@RequestMapping(value = "/certiMail.do", method = RequestMethod.GET)
	public String certiMail(@RequestParam String email, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String generatedString = RandomValueGeneration();

		// �� ���� vo�� ���� Ŭ���� �� JSP�� �ۼ��� �ʿ�� �����մϴ�.
		String subject = "JOBJAVA �̸��� ����";
		// �̹��� ������ ����� �Բ� �����մϴ�.
		String content = "<div id=\"readFrame\">\r\n" + 
				"        <div style=\"width:760px; margin:0 auto;\">\r\n" + 
				"            <h1 style=\"display:block;width:430px;margin:51px auto 26px\">JOBJAVA �̸��� ����Ű �߱�</h1>\r\n" + 
				"            <hr>\r\n" + 
				"            <img src=\"http://image.happymoney.co.kr/image/mail//icon_5.gif\" alt=\"���ǸӴ�\" style=\"display:block;width:112px;height:112px;margin:51px auto 26px\" border=\"0\" loading=\"lazy\"><br>\r\n" + 
				"            \r\n" + 
				"            <p style=\"display:block;width:300px;margin:0 auto;\">ȸ���� �̸��� ������ �߱��Ͽ����ϴ�.</p>\r\n" + 
				"            <br>\r\n" + 
				"            <h1 style=\"display:block;width:190px;margin:51px auto 26px\">"
				+ generatedString 
				+ "</h1>\r\n" + 
				"            <br>\r\n" + 
				"            <p style=\"display:block;width:220px;margin:0 auto;\">�̸���Ű�� ���� �Է����ּ���</p>\r\n" + 
				"        </div>\r\n" + 
				"    </div>";
		String from = "jobjava1230@gmail.com"; //
		String to = email;

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);

			// ���ε� ���� ��� ���� new File �ȿ� �� �ۼ� ex}"D:\\test.txt"
//	            FileSystemResource file = new FileSystemResource(new File("")); 
			// ÷������ �̸�/Ȯ���� ����(��� �� �� ���ϰ� ���� �޵��� ���ּ���)
//	            mailHelper.addAttachment("test.txt", file);

			mailSender.send(mail);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return generatedString;
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/findPwCertiMail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String findPwCertiMail(@RequestParam HashMap<String, String> member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mailservice.findPwCertiMail(member); 
	}


	@Override
	@RequestMapping(value="/pwdChange.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity pwdChange(@RequestParam HashMap<String, String> member,HttpServletRequest request, HttpServletResponse response) throws Exception {
		member.put("DecryptionPWD", RandomValueGeneration());
		mailservice.pwdChange(member);
		// �� ���� vo�� ���� Ŭ���� �� JSP�� �ۼ��� �ʿ�� �����մϴ�.
		String subject = "JOBJAVA �ӽ� ��й�ȣ";
		// �̹��� ������ ����� �Բ� �����մϴ�.
		String content = "<div id=\"readFrame\">\r\n" + 
				"        <div style=\"width:760px; margin:0 auto;\">\r\n" + 
				"            <h1 style=\"display:block;width:430px;margin:51px auto 26px\">JOBJAVA �̸��� ����Ű �߱�</h1>\r\n" + 
				"            <hr>\r\n" + 
				"            <img src=\"http://image.happymoney.co.kr/image/mail//icon_5.gif\" alt=\"���ǸӴ�\" style=\"display:block;width:112px;height:112px;margin:51px auto 26px\" border=\"0\" loading=\"lazy\"><br>\r\n" + 
				"            \r\n" + 
				"            <p style=\"display:block;width:300px;margin:0 auto;\">ȸ���� �ӽ� ��й�ȣ�� �߱��Ͽ����ϴ�.</p>\r\n" + 
				"            <br>\r\n" + 
				"            <h1 style=\"display:block;width:190px;margin:51px auto 26px\">"
				+ member.get("DecryptionPWD") 
				+ "</h1>\r\n" + 
				"            <br>\r\n" + 
				"            <p style=\"display:block;width:100px;margin:0 auto;\">�ӽ� ��й�ȣ</p>\r\n" + 
				"        </div>\r\n" + 
				"    </div>";
		String from = "jobjava1230@gmail.com"; //
		String to = member.get("EMAIL");

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);

			// ���ε� ���� ��� ���� new File �ȿ� �� �ۼ� ex}"D:\\test.txt"
//	            FileSystemResource file = new FileSystemResource(new File("")); 
			// ÷������ �̸�/Ȯ���� ����(��� �� �� ���ϰ� ���� �޵��� ���ּ���)
//	            mailHelper.addAttachment("test.txt", file);

			mailSender.send(mail);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('�ӽú�й�ȣ�� �̸��Ϸ� �����߽��ϴ�. �α���â���� �̵��մϴ�.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do;'";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do;'";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	public String RandomValueGeneration() {
		int leftLimit = 97; // letter 'a'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 10;
		Random random = new Random();
		StringBuilder buffer = new StringBuilder(targetStringLength);
		for (int i = 0; i < targetStringLength; i++) {
			int randomLimitedInt = leftLimit + (int) (random.nextFloat() * (rightLimit - leftLimit + 1));
			buffer.append((char) randomLimitedInt);
		}
		String generatedString = buffer.toString();
		return generatedString;
	}
	


}
