package com.project.adventure.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.vo.Order_Detail;
import com.project.adventure.vo.Review;
import com.project.adventure.vo.Review_Comment;

public interface ReviewService {
	public void imageUpload(HttpServletRequest request, 
			HttpServletResponse response, 
			MultipartHttpServletRequest multiFile);
	public List<Review> reviewList(Review review, String pageNum);
	public int writeReview(Review review);
	public int totCnt(Review review);
	public Review getReviewContent(int rid);
	public Review reviewInfo();
	public void reviewWrite(Review review, MultipartHttpServletRequest mRequest, Model model, String pointObtained);
	public int reviewDelete(int rid);
	public void reviewModify(Review review, MultipartHttpServletRequest mRequest, Model model);
	public List<Review_Comment> getReviewComments(int rid, String replyPageNum);
	public int commentTotCnt(Review_Comment review_Comment);
	public int commentWrite(Review_Comment review_Comment);	
}