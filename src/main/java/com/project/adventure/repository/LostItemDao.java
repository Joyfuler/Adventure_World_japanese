package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.LostItem;

@Mapper
public interface LostItemDao {
	public List<LostItem> itemList(LostItem lostItem);
	public int itemTotCnt(LostItem lostItem);
	public int insertItem(LostItem lostItem);
	public LostItem getQna(int lno);
	public int updateItem(LostItem lostItem);
	public int modifyItem(LostItem lostItem);
}
