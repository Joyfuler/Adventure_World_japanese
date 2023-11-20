package com.project.adventure.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.MemberDao;
import com.project.adventure.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private JavaMailSender mailSender;	
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
		String content = "Adventure World 홈페이지를 방문해주셔서 감사합니다." + "<br><br>인증 번호는  <span style = \"color:red;\">" + authNumber + "</span> 입니다."
				+ "<br><br>해당 인증번호를 인증번호 확인란에 입력해 주세요." + "<br><br>감사합니다.";

		mailSend(setFrom, toMail, title, content);
		System.out.println("인증코드는: " + authNumber);
		return Integer.toString(authNumber);
	}

	@Override
	public void mailSend(final String setFrom, final String toMail, final String title, final String content) {
		MimeMessagePreparator message = new MimeMessagePreparator() {			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
				mimeMessage.setFrom(new InternetAddress(setFrom));
				mimeMessage.setSubject(title);
				mimeMessage.setText(content, "utf-8", "html");				
			}
		};
		mailSender.send(message);
		System.out.println(toMail + "에게 인증메일 전송완료");
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

	@Override
	public String findId(Member member) {
		String msg = "";
		Member findMember = new Member();
		findMember.setMname(member.getMname());
		findMember.setMphone(member.getMphone());
		Member findResult = memberDao.findId(findMember);
		if (findResult != null) {
			msg = "찾으신 아이디는 [" + findResult.getMid() + "] 입니다.";
		} else {
			msg = "해당하는 정보와 일치하는 회원이 없습니다.";
		}		
		return msg;		
		}

	@Override
	public String findPw(Member member) {
		String msg = "";
		Member findPwMember = new Member();
		findPwMember.setMid(member.getMid());
		findPwMember.setMname(member.getMname());
		findPwMember.setMphone(member.getMphone());
		Member findResult = memberDao.findPw(findPwMember);
		if (findResult != null) {
			msg = member.getMname() + "님이 찾으신 아이디의 비밀번호는 [" + findResult.getMpw() + "]입니다.";
		} else {
			msg = member.getMname() + "님이 요청하신 정보의 아이디가 없습니다.";		
		}		
		return msg;
	}

	@Override
	public int modifyMember(Member member) {
		return memberDao.modifyMember(member);		
	}
}
