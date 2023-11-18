package com.project.adventure.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.MemberDao;
import com.project.adventure.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	private JavaMailSenderImpl mailSender;
	private int authNumber;

	@Override
	public int midConfirm(String mid) {
		return memberDao.midConfirm(mid);
	}

	@Override
	public int memailConfirm(String memail) {
		return memberDao.memailConfirm(memail);
	}

	@Override
	public void makeRandomNumber() {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호는 " + checkNum);
		authNumber = checkNum;
	}

	@Override
	public String joinEmail(String memail) {
		makeRandomNumber();
		String setFrom = "triojang36@gmail.com";
		String toMail = memail;
		String title = "Adventure World 회원가입 인증메일입니다.";
		String content = "Adventure World 홈페이지를 방문해주셔서 감사합니다." + "<br><br>인증 번호는 " + authNumber + "입니다."
				+ "<br><br>해당 인증번호를 인증번호 확인란에 입력해 주세요." + "<br><br>감사합니다.";

		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}

	@Override
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			System.out.println(e.getMessage());
		}

	}

	@Override
	public int joinMember(Member member, HttpSession session) {
		int result = memberDao.joinMember(member);
		if (result == 1) {
			session.setAttribute("member", member);
		}
		return result;
	}

	@Override
	public String loginCheck(String mid, String mpw, HttpSession session) {
		String msg = "";
		Member loginMember = memberDao.getMemberInfo(mid);
		if (loginMember == null) {
			msg = "유효하지 않은 아이디입니다.";
		} else if (!loginMember.getMpw().equals(mpw)) {
			msg = "비밀번호가 서로 다릅니다.";
		} else {
			msg = "로그인 되었습니다.";
			session.setAttribute("member", loginMember);
		}		
		return msg;
	}
}
