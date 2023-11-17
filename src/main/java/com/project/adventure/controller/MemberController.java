package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.MemberService;

@Controller
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
}
