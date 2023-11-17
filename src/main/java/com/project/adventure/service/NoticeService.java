package com.project.adventure.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.vo.Notice;

public interface NoticeService {
	public List<Notice> noticeList();
	public int insertNotice(MultipartHttpServletRequest mRequest, Notice notice);
	public int updateNotice(MultipartHttpServletRequest mRequest, Notice notice);
	public Notice getDetailNotice(int nid);
}
