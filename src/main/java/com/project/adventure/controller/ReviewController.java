package com.project.adventure.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.adventure.service.OrderService;
import com.project.adventure.service.ReportService;
import com.project.adventure.service.ReviewService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Member;
import com.project.adventure.vo.Order_Detail;
import com.project.adventure.vo.Report;
import com.project.adventure.vo.Review;
import com.project.adventure.vo.Review_Comment;

@Controller
@RequestMapping("review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value = "reviewList", method = {RequestMethod.GET, RequestMethod.POST})
	public String reviewList(Model model, Review review, String pageNum) {
		model.addAttribute("reviewList", reviewService.reviewList(review, pageNum));
		model.addAttribute("paging", new Paging(reviewService.totCnt(review), pageNum, 8, 5));
		model.addAttribute("reviewInfo", reviewService.reviewInfo());
		return "review/reviewList";
	}	
	
	@RequestMapping(value = "reviewWrite", method = RequestMethod.GET)
	public String reviewWrite(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("member");
		model.addAttribute("availableList", orderService.reviewSelect(session));
		return "review/reviewWrite";
	}
	
	@RequestMapping(value = "reviewContent", method = {RequestMethod.GET, RequestMethod.POST})
	public String reviewContent(Model model, int rid, String replyPageNum) {
		model.addAttribute("reviewContent", reviewService.getReviewContent(rid));
		model.addAttribute("paging", new Paging(reviewService.commentTotCnt(rid), replyPageNum, 5, 5));
		model.addAttribute("reviewComments", reviewService.getReviewComments(rid, replyPageNum));		
		return "review/reviewContent";
	}
	
	@RequestMapping(value = "reviewWrite", method = RequestMethod.POST)
	public String reviewWrite(Model model, Review review, MultipartHttpServletRequest mRequest, String pointObtained, RedirectAttributes requestAttributes) {		
		reviewService.reviewWrite(review, mRequest, model, pointObtained);
		requestAttributes.addFlashAttribute("writeResult", "게시글 작성 완료");
		return "redirect:reviewList.do";
	}
	
	@RequestMapping(value = "reviewModify", method = RequestMethod.GET)
	public String reviewModify(Model model, int rid) {
		model.addAttribute("originalInfo", reviewService.getReviewContent(rid));
		model.addAttribute("originalTicket", orderService.selectedTicketInfo(rid));
		return "review/reviewModify";
	}
	
	@RequestMapping(value = "reviewModify", method = RequestMethod.POST)
	public String reviewModify(Model model, Review review, MultipartHttpServletRequest mRequest) {
		reviewService.reviewModify(review, mRequest, model);
		return "forward:reviewContent.do";
	}
	
	
	@RequestMapping(value = "reviewDelete", method = RequestMethod.GET)
	public String reviewDelete(Model model, int rid) {
		model.addAttribute("deleteResult", reviewService.reviewDelete(rid));
		return "forward:reviewList.do";
	}
	
	@RequestMapping(value = "commentWrite", method = RequestMethod.GET)
	public String commentWrite(Model model, Review_Comment review_Comment, HttpSession session) {
		model.addAttribute("commentWriteMsg", reviewService.commentWrite(review_Comment, session));
		return "forward:reviewContent.do";
	}
	
	@RequestMapping(value = "commentReplyView", method = RequestMethod.GET)
	public String commentReplyView(Model model, int rcid) {
		model.addAttribute("originalCommentInfo", reviewService.getOriginalCommentDto(rcid));
		return "review/reviewCommentReply";
	}
	
	@RequestMapping(value = "reviewCommentReply", method = RequestMethod.GET)
	public String reviewCommentReply(Model model, Review_Comment review_Comment, HttpSession session) {
		model.addAttribute("replyWriteMsg", reviewService.reviewCommentReply(review_Comment, session));
		return "forward:reviewContent.do";		
	}
	
	@RequestMapping(value = "commentDelete", method = RequestMethod.GET)
	public String commentDelete(Model model, int rcid) {
		model.addAttribute("deleteResult", reviewService.commentDelete(rcid));		
		return "forward:reviewContent.do";
	}
	
	@RequestMapping(value = "replyModifyView", method = RequestMethod.GET)
	public String replyModifyView(int rcid, Model model) {
		model.addAttribute("comment", reviewService.commentDetail(rcid));
		return "review/reviewCommentModify";
	}
	
	@RequestMapping(value = "modifyComment", method = RequestMethod.POST)
	public String modifyComment(Review_Comment review_Comment, Model model) {
		model.addAttribute("modifyResult", reviewService.modifyComment(review_Comment));		
		return "forward:reviewContent.do";
	}
	
	@RequestMapping(value = "report", method = RequestMethod.GET)
	public String report(Report report) {
		reportService.reportReview(report);
		return "forward:reviewContent.do";
	}
}
