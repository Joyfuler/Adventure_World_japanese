package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.service.NoticeService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Notice;

@Controller
@RequestMapping("worker")
public class WorkerNoticeController {
	@Autowired
	private NoticeService noticeService;
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
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(int nid, Model model) {
		model.addAttribute("notice", noticeService.getDetailNotice(nid));
		return "worker/workerNoticeUpdate";
	}
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(MultipartHttpServletRequest mRequest, @ModelAttribute("nDto") Notice notice, Model model, String pageNum) {
		model.addAttribute("insertUpdate", noticeService.insertNotice(mRequest, notice));
		return "forward:list.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int nid, Model model) {
		model.addAttribute("notice", noticeService.deleteNotice(nid));
		return "forward:list.do";
	}
}
