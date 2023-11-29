package com.project.adventure.repository;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.NoticeComment;

@Mapper
public interface NoticeCommentDao {
	public List<NoticeComment> commentList(NoticeComment noticeComment);
	public int commentTotCnt(int bid);
	public int commentWrite(NoticeComment noticeComment);
	public int commentReplyPreStep(NoticeComment noticeComment);
	public int commentReply(NoticeComment noticeComment);
	public int commentModify(NoticeComment noticeComment);
	public int commentDelete(int cnum);
	public NoticeComment commentDetail(int cnum);
}
