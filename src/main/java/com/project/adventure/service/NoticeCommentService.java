package com.project.adventure.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.adventure.vo.NoticeComment;

public interface NoticeCommentService {
	public List<NoticeComment> noticeComments(int nid, String commentPageNum, Model model);
	public int commentTotCnt(int nid);
	public void commentWrite(NoticeComment noticeComment, HttpServletRequest request, Model model);
	public void commentReply(NoticeComment noticeComment, HttpServletRequest request, Model model);
	public void commentModify(NoticeComment noticeComment, HttpServletRequest request, Model model);
	public void commentDelete(int cnum, Model model);
	public NoticeComment commentDetail(int cnum);

}
