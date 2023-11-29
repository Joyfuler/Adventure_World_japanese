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
}
