package com.project.adventure.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.project.adventure.service.CartService;

@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired
	private CartService cartService;	
	
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public String orderList(int[] cid, Model model) {		
		return "order/orderList";
	}
}
