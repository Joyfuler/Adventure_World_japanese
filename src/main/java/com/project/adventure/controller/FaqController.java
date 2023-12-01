package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.FaqService;
import com.project.adventure.vo.Faq;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqService;
	@RequestMapping(value = "faqList", method = {RequestMethod.GET,RequestMethod.POST})
	public String faqList(Model model, Faq faq) {
		model.addAttribute("faqList", faqService.faqList(faq));
		return "faq/faqList";
	}
	@RequestMapping(value = "workerFaqList", method = {RequestMethod.GET,RequestMethod.POST})
	public String workerFaqList(Faq faq, Model model) {
		model.addAttribute("faqList", faqService.faqList(faq));
		return "worker/workerFaqList";
	}
	@RequestMapping(value = "faqdelete", method = RequestMethod.GET )
	public String faqDelete(int fno,Model model) {
		model.addAttribute("faqDeleteResult",faqService.faqDelete(fno));
		return "forward:workerFaqList.do";
	}
	@RequestMapping(value = "faqModify", method =RequestMethod.GET)
	public String faqModify(Model model, int fno){
		model.addAttribute("faq",faqService.getfaqInfo(fno));
		return "worker/workerFaqUpdate";
	}

	@RequestMapping(value = "faqModify", method= RequestMethod.POST)
	public String faqModify(Model model, Faq faq){
		model.addAttribute("faqModify", faqService.faqModify(faq));
		return "forward:workerFaqList.do";
	}
	@RequestMapping(value = "faqInsert", method = RequestMethod.GET)
	public String faqInsert() {
		return "worker/workerFaqInsert";
	}
	@RequestMapping(value = "faqInsert", method = RequestMethod.POST)
	public String faqInsert(Model model, Faq faq) {
		model.addAttribute("faqInsertResult", faqService.faqinsert(faq));
		return "forward:workerFaqList.do";
	}
}
