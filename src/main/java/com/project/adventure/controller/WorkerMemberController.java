package com.project.adventure.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.adventure.service.MemberService;
import com.project.adventure.service.MemberServiceImpl;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Member;

@Controller
public class WorkerMemberController {
	@Autowired
	private MemberService memberService;
	@RequestMapping(value = "memberList",method = RequestMethod.GET )
	public String memberList(String pageNum, Model model,Member member ) {
		model.addAttribute("memberList",memberService.memberList(pageNum, member));
		model.addAttribute("paging", new Paging(memberService.getMemberCount(), pageNum, 10, 10));
		return "worker/WorkerMemberList";
	}
	@RequestMapping(value = "workermodify", method = RequestMethod.GET)
	public String workermodify(String[] mid, Model model) {
		model.addAttribute("deleteResult", memberService.towithDrawalMember(mid));
		return "forward:memberList.do";
	}
	
	@RequestMapping(value = "workerRestoreLevel", method = RequestMethod.GET)
	public String workerRestoreLevel(String[] mid, Model model) {
		model.addAttribute("adjustResult", memberService.workerRestoreLevel(mid));
		return "forward:memberList.do";
	}
}
