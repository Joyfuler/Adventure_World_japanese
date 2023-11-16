package com.project.adventure.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.CartService;
import com.project.adventure.vo.Cart;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	private CartService cartService;
	@RequestMapping(value = "list",  method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Cart cart, Model model) {
		model.addAttribute("cartList",cartService.cartList(cart));
		return "cart/list";
	}
	@RequestMapping(value="reserve", method=RequestMethod.GET)
	public String reserve() {
		return "cart/reserve";
	}

	@RequestMapping(value="passTicket", method=RequestMethod.GET)
	public String register1() {
		return "cart/passTicket";
	}
	@RequestMapping(value = "passTicket", method=RequestMethod.POST)
	public String register1(Cart cart, Model model) {
		model.addAttribute("passTicketResult", cartService.registerCart(cart));				
		return "forward:list.do";
	}
	@RequestMapping(value="fastTicket", method=RequestMethod.GET)
	public String register2() {
		return "cart/fastTicket";
	}
	@RequestMapping(value = "fastTicket", method=RequestMethod.POST)
	public String register2(Cart cart, Model model) {
		model.addAttribute("fastTicketResult", cartService.registerCart(cart));				
		return "forward:list.do";
	}
	
}
