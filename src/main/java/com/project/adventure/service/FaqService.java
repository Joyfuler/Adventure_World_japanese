package com.project.adventure.service;

import java.util.List;

import com.project.adventure.vo.Faq;

public interface FaqService {
	public List<Faq> faqList(Faq faq);
	public Faq getfaqInfo(int fno);
	public int faqDelete(int fno);
	public int faqModify(Faq faq);
	public int faqinsert(Faq faq);
}
