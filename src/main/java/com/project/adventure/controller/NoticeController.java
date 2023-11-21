package com.project.adventure.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.NoticeService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Notice;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@RequestMapping(value="list" , method = {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Notice notice, Model model) {
		model.addAttribute("notice", noticeService.noticeList(pageNum, notice));
		model.addAttribute("paging", new Paging(noticeService.totCntNotice(notice), pageNum, 5, 5));
		return "notice/notice";
	}
}
