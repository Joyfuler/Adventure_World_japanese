package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.FaqService;
import com.project.adventure.service.QnaService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Faq;
import com.project.adventure.vo.Qna;
@Controller
@RequestMapping("worker")
public class WorkerQnaController {
	@Autowired
	private QnaService qnaService;
	@RequestMapping(value = "workerQnaList", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaList(String pageNum, Qna qna, Model model) {
		model.addAttribute("qnaList", qnaService.QnaList(pageNum, qna));
		model.addAttribute("paging", new Paging(qnaService.qnaTotCnt(qna), pageNum, 10, 10));
		return "worker/workerQnaList";
	}
	@RequestMapping(value="workerQnaDetail", method = {RequestMethod.GET,RequestMethod.POST})
	public String adminqna_view (Model model, int qno){		
		model.addAttribute("Qna", qnaService.getQna(qno));
		return "worker/workerQnaDetail";
	}
	@RequestMapping(value="adminqnqreply", method = RequestMethod.POST)
	public String adminQnaRepSave (Qna qna, Model model){
		System.out.println("원글 번호 : " + qna.getQno());
        qnaService.qnaRreply(qna);
		model.addAttribute("replyResult",qnaService.qnaReply(qna));
		return "forward:workerQnaList.do";
	}
	@RequestMapping(value = "workerQnadelete", method = RequestMethod.GET)
	public String deleteQna(int qno, Model model ) {
		model.addAttribute("deleteResult",qnaService.deleteQna(qno));
		return "forward:workerQnaList.do";
	}
	@RequestMapping(value = "workerQnamodify", method = RequestMethod.GET)
	public String modify(Model model,int qno) {
		model.addAttribute("Qna", qnaService.getQna(qno));
		return "worker/workerQnaUpdate";
	}
	@RequestMapping(value = "workerQnamodify", method = RequestMethod.POST)
	public String modify(Model model, Qna qna) {
		model.addAttribute("modify",qnaService.modify(qna));
		return "forward:workerQnaDetail";
	}
}
