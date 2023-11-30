package com.project.adventure.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.adventure.service.NoticeCommentService;
import com.project.adventure.vo.NoticeComment;

@Controller
@RequestMapping(value="noticeComment")
public class NoticeCommentController {
	@Autowired
	private NoticeCommentService noticeCommentService;
	@RequestMapping(value="write")
	public String write(NoticeComment noticeComment, Model model, HttpServletRequest request ) {
		noticeCommentService.commentWrite(noticeComment, request, model);
		return "forward:../notice/detail.do";
	}
	@RequestMapping(value="delete")
	public String delete(NoticeComment noticeComment, String commentPageNum, Model model) {
		noticeCommentService.commentDelete(noticeComment.getCnum(), model);
		return "forward:../notice/detail.do";
	}
	@RequestMapping(value="replyView")
	public String replyView(int cnum, Model model) {
		model.addAttribute("comment", noticeCommentService.commentDetail(cnum));
		return "notice/noticeCommentReply";
	}
	@RequestMapping(value="reply")
	public String reply(NoticeComment noticeComment, HttpServletRequest request, Model model) {
		noticeCommentService.commentReply(noticeComment, request, model);
		return "forward:../notice/detail.do";
	}
}
