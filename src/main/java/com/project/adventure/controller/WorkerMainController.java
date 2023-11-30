package com.project.adventure.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.NoticeService;
import com.project.adventure.service.OrderService;
import com.project.adventure.service.ReportService;
import com.project.adventure.service.ReviewService;
import com.project.adventure.service.WorkerService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Order_Detail;
import com.project.adventure.vo.Report;
import com.project.adventure.vo.Review;
import com.project.adventure.vo.Worker;

@Controller
@RequestMapping("worker")
public class WorkerMainController {	
	@Autowired
	private WorkerService workerService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="workerLoginForm", method = RequestMethod.GET)
	public String workerLogin() {
		return "worker/workerLoginForm";
	}
	@RequestMapping(value="workerLoginForm", method = RequestMethod.POST)
	public String workerLogin(@ModelAttribute("wDto") Worker wDto, HttpSession session, Model model, String after) {
		String loginResult = workerService.loginCheck(wDto, session);
		if(loginResult.equals("로그인 성공")) {
			return "redirect:../" + after;
		}else {
			model.addAttribute("loginResult", "로그인에 실패했습니다.");
			model.addAttribute("wid", wDto.getWid());
			model.addAttribute("wpw", wDto.getWpw());
			return "worker/workerLoginForm";
		}
	}
	@RequestMapping(value="workerMain", method = {RequestMethod.GET, RequestMethod.POST})
	public String main(Model model) {
		return "worker/workerMain";
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("logoutResult", "로그아웃 되었습니다.");		
		return "forward:../main.do";
	}
	
	@RequestMapping(value = "workerReviewList", method = RequestMethod.GET)
	public String reviewList(Model model, Review review, String pageNum) {
		model.addAttribute("reviewList", reviewService.reviewList(review, pageNum));
		model.addAttribute("paging", new Paging(reviewService.totCnt(review), pageNum, 8, 5));
		model.addAttribute("reviewInfo", reviewService.reviewInfo());
		return "worker/workerReviewList";
	}
	
	@RequestMapping(value = "workerDeleteReview", method = RequestMethod.GET)
	public String workerDeleteReview(int[] rid, Model model) {
		model.addAttribute("workerReviewDeleteResult", reviewService.workerDeleteReview(rid));
		return "forward:workerReviewList.do";
	}
	
	@RequestMapping(value = "workerOrderList", method = RequestMethod.GET)
	public String orderList(Model model, Order_Detail order_Detail, String pageNum) {
		model.addAttribute("orderList", orderService.orderList(order_Detail, pageNum));
		model.addAttribute("paging", new Paging(orderService.totCnt(order_Detail), pageNum, 5, 5));
		return "worker/workerOrderList";
	}
	
	@RequestMapping(value = "reportList", method = RequestMethod.GET)
	public String reportList(Model model, Report report, String pageNum) {
		model.addAttribute("reportList", reportService.reportList(report, pageNum));
		model.addAttribute("paging", new Paging(reportService.totCnt(report), pageNum, 5, 5));
		return "worker/workerReportList";
	}
	
	@RequestMapping(value = "workerDeleteReport", method = RequestMethod.GET)
	public String deleteReport(int[] rno, Model model) {
		model.addAttribute("deleteResult", reportService.deleteReport(rno));
		return "worker/workerReportList";
	}
	
}
