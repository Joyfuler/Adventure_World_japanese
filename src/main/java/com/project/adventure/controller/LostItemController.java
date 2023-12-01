package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.service.LostItemService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.LostItem;

@Controller
public class LostItemController {
	@Autowired
	private LostItemService lostItemService;
	@RequestMapping(value = "lostItemList", method = {RequestMethod.GET,RequestMethod.POST})
	public String lostitemList(Model model, String pageNum, LostItem lostItem) {
		model.addAttribute("lostItem",lostItemService.lostitemList(pageNum, lostItem));
		model.addAttribute("paging", new Paging(lostItemService.itemTotCnt(lostItem), pageNum, 10, 10));
		return "lostItem/lostItemList";
	}
	@RequestMapping(value = "workerlostItemList", method = {RequestMethod.GET,RequestMethod.POST})
	public String workeritemList(Model model, String pageNum, LostItem lostItem) {
		model.addAttribute("lostItem",lostItemService.lostitemList(pageNum, lostItem));
		model.addAttribute("paging", new Paging(lostItemService.itemTotCnt(lostItem), pageNum, 10, 10));
		return "worker/workerItemList";
	}
	@RequestMapping(value = "insertItem", method = RequestMethod.GET)
	public String insertItem() {
		return "worker/workerItemInsert";
	}
	@RequestMapping(value = "insertItem", method = RequestMethod.POST)
	public String insertItem(Model model, LostItem lostItem,MultipartHttpServletRequest mRequest) {
		model.addAttribute("insertReult",lostItemService.insertItem(mRequest, lostItem));
		return "forward:workerlostItemList.do";
	}
	@RequestMapping(value="modifyItem", method=RequestMethod.GET)
	public String updateForm(int lno, Model model) {
		model.addAttribute("lostItem",lostItemService.getItem(lno));
		return "worker/workerItemUpdate";
	}
	@RequestMapping(value="modifyItem", method=RequestMethod.POST)
	public String updateForm(Model model,LostItem lostItem,MultipartHttpServletRequest mRequest) {
		model.addAttribute("ItemModyfyReult", lostItemService.modifyItem(mRequest, lostItem));
		return "forward:workerlostItemList.do";
	}
	@RequestMapping(value="updateItem", method=RequestMethod.GET)
	public String updateItem(int lno,Model model,LostItem lostItem) {
		model.addAttribute("lostItem",lostItemService.getItem(lno));
		model.addAttribute("updateItemReult", lostItemService.updateItem(lostItem));
		return "forward:workerlostItemList.do";
	}
	@RequestMapping(value="deleteItem", method=RequestMethod.GET)
	public String deleteitem(int lno,Model model) {
		model.addAttribute("deleteItemReult", lostItemService.deleteItem(lno));
		return "forward:workerlostItemList.do";
	}
	
	
}
