package com.project.adventure.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.adventure.repository.NoticeCommentDao;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.NoticeComment;
@Service
public class NoticeCommentServiceImpl implements NoticeCommentService {
	@Autowired
	private NoticeCommentDao noticeCommentDao;  
	@Override
	public List<NoticeComment> noticeComments(int nid, String commentPageNum, Model model) {
		NoticeComment noticeComment = new NoticeComment();
		Paging paging = new Paging(noticeCommentDao.commentTotCnt(nid), commentPageNum, 5, 5);
		noticeComment.setNid(nid);
		noticeComment.setStartRow(paging.getStartRow());
		noticeComment.setEndRow(paging.getEndRow());
		model.addAttribute("comPaging", paging);
		return noticeCommentDao.commentList(noticeComment);
	}

	@Override
	public int commentTotCnt(int nid) {
		return noticeCommentDao.commentTotCnt(nid);
	}

	@Override
	public void commentWrite(NoticeComment noticeComment, HttpServletRequest request, Model model) {
		noticeComment.setCip(request.getRemoteAddr());
		int result = noticeCommentDao.commentWrite(noticeComment);
		if(result == 1) {
			model.addAttribute("commentResult", "댓글이 등록되었습니다");
		}else {
			model.addAttribute("commentResult", "댓글 등록이 실패되었습니다");
		}
	}

	@Override
	public void commentReply(NoticeComment noticeComment, HttpServletRequest request, Model model) {
		noticeComment.setCip(request.getRemoteAddr());
		noticeCommentDao.commentReplyPreStep(noticeComment);
		int result = noticeCommentDao.commentReply(noticeComment);
		if(result == 1) {
			model.addAttribute("commentResult", noticeComment.getCnum() + "번 댓글에 답변하였습니다");
		}else {
			model.addAttribute("commentResult", noticeComment.getCnum() + "번 댓글을에 답변이 실패되었습니다");
		}

	}

	@Override
	public void commentModify(NoticeComment noticeComment, HttpServletRequest request, Model model) {
		noticeComment.setCip(request.getRemoteAddr());
		int result = noticeCommentDao.commentModify(noticeComment);
		if(result == 1) {
			model.addAttribute("commentResult", noticeComment.getCnum() + "번 댓글을 수정하였습니다");
		}else {
			model.addAttribute("commentResult", noticeComment.getCnum() + "번 댓글을 수정이 실패되었습니다");
		}

	}

	@Override
	public void commentDelete(int cnum, Model model) {
		int result = noticeCommentDao.commentDelete(cnum);
		if(result == 1) {
			model.addAttribute("commentResult", cnum + "번 댓글을 삭제하였습니다");
		}else {
			model.addAttribute("commentResult", cnum + "번 댓글 삭제가 실패되었습니다");
		}

	}

	@Override
	public NoticeComment commentDetail(int cnum) {
		return noticeCommentDao.commentDetail(cnum);
	}

}
