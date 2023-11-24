package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.FaqService;
import com.project.adventure.vo.Faq;

@Controller
@RequestMapping("qna")
public class FaqController {
	@Autowired
	private FaqService faqService;
	@RequestMapping(value = "faqList", method = RequestMethod.GET)
	public String faqList(Faq faq, Model model) {
		model.addAttribute("faqList", faqService.faqList(faq));
		return "qna/qnamain";
	}
}
