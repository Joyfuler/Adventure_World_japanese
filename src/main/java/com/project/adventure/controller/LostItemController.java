package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.LostItemService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.LostItem;

@Controller
public class LostItemController {
	@Autowired
	private LostItemService lostItemService;
	@RequestMapping(value = "lostItemList", method = RequestMethod.GET)
	public String lostitemList(Model model, String pageNum, LostItem lostItem) {
		model.addAttribute("lostItem",lostItemService.itemList(pageNum, lostItem));
		model.addAttribute("paging", new Paging(lostItemService.itemTotCnt(lostItem), pageNum, 10, 10));
		return "lostItem/lostItemList";
	}
}
