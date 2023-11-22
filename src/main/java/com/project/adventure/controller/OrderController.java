package com.project.adventure.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.project.adventure.service.CartService;
import com.project.adventure.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired
	private CartService cartService;	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public String orderList(int[] cid, Model model) {
		orderService.cartToOrder(cid);		
		model.addAttribute("orderAddMsg", "장바구니에 있던 " + cid.length + "개 항목의 주문 페이지로 이동합니다.");		
		model.addAttribute("orderList", orderService.orderList(cid));
		cartService.deleteCart(cid);
		System.out.println("orderList: " + orderService.orderList(cid));		
		return "order/orderList";
	}
}
