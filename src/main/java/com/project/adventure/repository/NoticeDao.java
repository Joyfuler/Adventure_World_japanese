package com.project.adventure.repository;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Notice;

@Mapper
public interface NoticeDao {
	public List<Notice> noticeList(Notice notice);
	public int totCntNotice(Notice notice);
	public int insertNotice(Notice notice);
	public int updateNotice(Notice notice);
	public Notice getDetailNotice(int nid);
}
