package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Review_Comment;
@Mapper
public interface Review_CommentDao {
	public List<Review_Comment> getReviewComments(Review_Comment review_Comment);	
	public int commentWrite(Review_Comment review_Comment);
	public int commentTotCnt(int rid);
	public Review_Comment getOriginalCommentDto(int rcid);
	public int reviewCommentReply(Review_Comment review_Comment);
	public void commentReplyPreStep(Review_Comment review_Comment);
	public int checkCommentCount(Review_Comment review_Comment);
	public int commentDelete(int rcid);	
	public Review_Comment commentDetail(int rcid);
	public int modifyComment(Review_Comment review_Comment);
	public int deleteAllComments(int rid);
}
