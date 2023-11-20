package com.project.adventure.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.WorkerService;
import com.project.adventure.vo.Worker;

@Controller
@RequestMapping("worker")
public class WorkerController {
	@Autowired
	private WorkerService workerService;
	@RequestMapping(value="workerLoginForm", method = RequestMethod.GET)
	public String workerLogin() {
		return "worker/workerLoginForm";
	}
	@RequestMapping(value="workerLoginForm", method = RequestMethod.POST)
	public String workerLogin(String wid, String wpw, HttpSession session, Model model, String after) {
		Worker loginWorker = workerService.loginCheck(wid, wpw, session);
		if(loginWorker != null) {
			return "redirect:../" + after;
		}else {
			model.addAttribute("loginResult", "로그인에 실패했습니다.");
			model.addAttribute("wid", wid);
			model.addAttribute("wpw", wpw);
			return "worker/workerLoginForm";
		}
	}
}
