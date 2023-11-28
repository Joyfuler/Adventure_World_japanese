package com.project.adventure.repository;

import java.util.List;

import com.project.adventure.vo.Review_Comment;

public interface Review_CommentDao {
	public List<Review_Comment> getReviewComments(int rid);	
	public int commentWrite(Review_Comment review_Comment);
	public int commentTotCnt(int rid);
}
