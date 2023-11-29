package com.project.adventure.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.vo.LostItem;

public interface LostItemService {
	public List<LostItem> itemList(String pageNum,LostItem lostItem);
	public int itemTotCnt(LostItem lostItem);
	public int insertItem(MultipartHttpServletRequest mRequest,LostItem lostItem);
	public LostItem getQna(int lno);
	public int updateItem(LostItem lostItem);
	public int modifyItem(MultipartHttpServletRequest mRequest,LostItem lostItem);
}
