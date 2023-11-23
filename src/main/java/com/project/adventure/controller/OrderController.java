package com.project.adventure.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.CartService;
import com.project.adventure.service.OrderService;
import com.project.adventure.vo.Order;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;	
	
	@RequestMapping(value = "orderForm", method = RequestMethod.GET)
	public String orderList(int[] cid, Model model) {		
		 model.addAttribute("orderList", cartService.toOrderList(cid));
		 model.addAttribute("amountInfo", cartService.getTicketAmountAndPrice(cid));		 
		return "order/orderForm";		
	}	
	
	@RequestMapping(value = "orderComplete", method = RequestMethod.GET)
	public String orderComplete(int[] cid, Model model, Order order, HttpSession session) {
		cartService.deleteCart(cid);
		cartService.cidsAdd(cid, session);
		// 멤버 포인트 사용한 것만큼 감소시켜 주어야함. memberService 추가
		
		orderService.orderDetail(order, session);
		
		model.addAttribute("orderComplete","결제가 완료되었습니다. 마이페이지 > 주문내역을 통해 확인하실 수 있습니다.");
		model.addAttribute("orderList", orderService.orderList(session));
		// 이후 order_detail과 order_list 테이블에 각각 데이터를 삽입. order_list에는 페이지에서 받아온
		return "forward:../main.do";
	}
}
