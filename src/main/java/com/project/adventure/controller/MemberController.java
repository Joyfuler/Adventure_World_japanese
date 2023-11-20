package com.project.adventure.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.adventure.service.MemberService;
import com.project.adventure.vo.Member;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;	
	
	@RequestMapping(value = "joinMember", method = RequestMethod.GET)
	public String joinMember() {
		return "member/terms";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}	
	
	@RequestMapping(value = "midConfirm", method = RequestMethod.POST)
	public String midConfirm(String mid, Model model) {
		model.addAttribute("midConfirmResult", memberService.midConfirm(mid));
		return "member/midConfirm";
	}
	
	@RequestMapping(value = "memailConfirm", method = RequestMethod.POST)
	public String memailConfirm(String memail, Model model) {
		model.addAttribute("memailConfirmResult", memberService.memailConfirm(memail));
		return "member/memailConfirm";
	}
	
	// 작동안됨
	@RequestMapping(value = "mailCheck", method = RequestMethod.GET)	
	public String mailCheck(String memail, Model model) {
		System.out.println("이메일 인증 요청 :" + memail);
		String authNumber = memberService.joinEmail(memail);
		model.addAttribute("authNumber", authNumber);
		return "member/authNumber";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@ModelAttribute("memberDto") Member member, Model model, HttpSession session) {		
		model.addAttribute("joinResult", memberService.joinMember(member, session));
		return "forward:member/login.do";
	}
	
	@RequestMapping(value = "loginMember", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value = "login")
	public String login(String mid, String mpw, HttpSession session, Model model, String next) {
		String msg = memberService.loginCheck(mid, mpw, session);
		if (msg.equals("로그인 되었습니다.")) {
			model.addAttribute("loginResult", msg);
			return "redirect: ../" + next;
		} else {
			model.addAttribute("loginResult", msg);
			return "member/login";
		}
	}	
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("logoutResult", "로그아웃 되었습니다.");		
		return "forward:../main.do";
	}
		
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findId() {
		return "member/findId";
	}
	
	@RequestMapping(value = "findId", method = RequestMethod.POST)
	public String findId(Member member, Model model) {
		model.addAttribute("findResult", memberService.findId(member));
		return "member/findId";
	}
	
	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public String findPw() {
		return "member/findPw";
	}
	
	@RequestMapping(value = "findPw", method = RequestMethod.POST)
	public String findPw(Member member, Model model) {
		return "member/findPw";
	}
}