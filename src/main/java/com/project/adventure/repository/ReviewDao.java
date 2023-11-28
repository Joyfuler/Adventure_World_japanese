package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Review;

@Mapper
public interface ReviewDao {
	public List<Review> reviewList(Review review);
	public int writeReview(Review review);
	public int totCnt(Review review);
	public Review getReviewContent(int rid);
	public Review reviewInfo();
	public int reviewDelete(int rid);
	public int modifyReview(Review review);
}
