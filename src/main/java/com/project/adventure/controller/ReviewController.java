package com.project.adventure.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.service.OrderService;
import com.project.adventure.service.ReviewService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Member;
import com.project.adventure.vo.Order_Detail;
import com.project.adventure.vo.Review;

@Controller
@RequestMapping("review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private OrderService orderService;	
	
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
	
	@RequestMapping(value = "reviewContent", method = RequestMethod.GET)
	public String reviewContent(Model model, int rid) {
		model.addAttribute("reviewContent", reviewService.getReviewContent(rid));
		return "review/reviewContent";
	}
	
	@RequestMapping(value = "reviewWrite", method = RequestMethod.POST)
	public String reviewWrite(Model model, Review review, MultipartHttpServletRequest mRequest, String pointObtained) {
		System.out.println("컨트롤러 review : " + review);
		reviewService.reviewWrite(review, mRequest, model, pointObtained);
		return "forward:reviewList.do";
	}	
}
