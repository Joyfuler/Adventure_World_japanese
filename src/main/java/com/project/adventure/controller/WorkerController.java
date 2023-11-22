package com.project.adventure.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.service.NoticeService;
import com.project.adventure.service.WorkerService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Notice;
import com.project.adventure.vo.Worker;

@Controller
@RequestMapping("worker")
public class WorkerController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private WorkerService workerService;
	@RequestMapping(value="workerLoginForm", method = RequestMethod.GET)
	public String workerLogin() {
		return "worker/workerLoginForm";
	}
	@RequestMapping(value="workerLoginForm", method = RequestMethod.POST)
	public String workerLogin(@ModelAttribute("wDto") Worker wDto, HttpSession session, Model model, String after) {
		String loginResult = workerService.loginCheck(wDto, session);
		if(loginResult.equals("로그인 성공")) {
			return "redirect:../" + after;
		}else {
			model.addAttribute("loginResult", "로그인에 실패했습니다.");
			model.addAttribute("wid", wDto.getWid());
			model.addAttribute("wpw", wDto.getWpw());
			return "worker/workerLoginForm";
		}
	}
	@RequestMapping(value="workerMain", method = {RequestMethod.GET, RequestMethod.POST})
	public String main(Model model) {
		return "worker/workerMain";
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("logoutResult", "로그아웃 되었습니다.");		
		return "forward:../main.do";
	}
/************worker공지사항****************/
	@RequestMapping(value="list" , method = {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Notice notice, Model model) {
		model.addAttribute("notice", noticeService.noticeList(pageNum, notice));
		model.addAttribute("paging", new Paging(noticeService.totCntNotice(notice), pageNum, 5, 5));
		return "worker/workerNotice";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(int nid, Model model) {
		model.addAttribute("notice", noticeService.getDetailNotice(nid));
		return "worker/workerNoticeDetail";
	}
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insert() {
		return "worker/workerNoticeInsert";
	}
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(MultipartHttpServletRequest mRequest, Notice notice, Model model) {
		model.addAttribute("insertResult", noticeService.insertNotice(mRequest, notice));
		return "forward:list.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
