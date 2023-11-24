package com.project.adventure.repository;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Faq;

@Mapper
public interface FaqDao {
	public List<Faq> faqList(Faq faq);
	public int faqModify(Faq faq);
	public int faqinsert(Faq faq);
}
