package com.project.adventure.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.CartService;
import com.project.adventure.service.MemberService;
import com.project.adventure.service.OrderService;
import com.project.adventure.vo.Member;
import com.project.adventure.vo.Order;
import com.project.adventure.vo.Order_Detail;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;	
	@Autowired
	private MemberService memberService;	
	
	@RequestMapping(value = "orderForm", method = RequestMethod.GET)
	public String orderList(int[] cid, Model model, HttpSession session) {
		 cartService.cidsAdd(cid, session);	
		 model.addAttribute("amountInfo", cartService.getTicketAmountAndPrice(cid));		 
		return "order/orderForm";		
	}	
	
	@RequestMapping(value = "orderComplete", method = RequestMethod.POST)
	public String orderComplete(Model model, Order order, HttpSession session) {		
		memberService.minusMemberPoint(order);
		orderService.orderDetail(order, session);		
		model.addAttribute("orderComplete","결제가 완료되었습니다. 마이페이지 > 주문내역을 통해 확인하실 수 있습니다.");			
		return "forward:/orderList.do";
	}
	
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public String orderList(String mid, Model model) {
		model.addAttribute("orderList", orderService.orderList(mid));
		return "order/orderList";
	}
}
