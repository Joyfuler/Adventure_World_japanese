    package com.project.adventure.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.adventure.service.AttractionService;
import com.project.adventure.service.CartService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Attraction;
import com.project.adventure.vo.Cart;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private AttractionService attractionService;
	@RequestMapping(value = "list",  method = {RequestMethod.GET, RequestMethod.POST})
	public String list(String mid, Model model,String pageNum) {
		model.addAttribute("cartList",cartService.cartList(pageNum, mid));
		model.addAttribute("paging", new Paging(cartService.totCntCart(mid), pageNum, 10, 10));
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
		model.addAttribute("passTicketResult", cartService.registerCart1(cart));				
		return "forward:list.do";
	}
	@RequestMapping(value="fastTicket", method=RequestMethod.GET)
	public String register2(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession(); 
		Attraction attraction = new Attraction();
		model.addAttribute("attractionList", attractionService.attractionList());
		return "cart/fastTicket";
	}
	@RequestMapping(value = "fastTicket", method=RequestMethod.POST)
	public String register2(Cart cart, Model model,
							String[] attraction) {
		model.addAttribute("fastTicketResult", cartService.registerCart2(cart, attraction));				
		return "forward:list.do";
	}	
	
	@RequestMapping(value = "delete", method= {RequestMethod.GET ,RequestMethod.POST})
	public String delete(int[] cid, Model model) {
		model.addAttribute("deleteResult", cartService.deleteCart(cid));
		return "forward:list.do";
	}	
	
	@RequestMapping(value = "expiredTicketautoDelete", method = RequestMethod.GET)
	public String autoDelete(int cid, Model model) {
		model.addAttribute("autoDeleteResult", cartService.autoDeleteCart(cid));
		return "forward:list.do";
	}
	
}
	