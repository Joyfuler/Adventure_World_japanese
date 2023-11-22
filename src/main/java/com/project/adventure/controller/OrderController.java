package com.project.adventure.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("order")
public class OrderController {
	
	
	
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public String orderList(@RequestParam("cid") List<Integer> cidList) {		
		return "order/orderList";
	}
}
