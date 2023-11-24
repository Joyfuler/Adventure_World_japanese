package com.project.adventure.service;

import java.util.List;

import com.project.adventure.vo.Faq;

public interface FaqService {
	public List<Faq> faqList(Faq faq);
	public int faqModify(Faq faq);
	public int faqinsert(Faq faq);
}
