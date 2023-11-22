package com.project.adventure.service;

import java.util.ArrayList;
import java.util.List;

import com.project.adventure.vo.Cart;
import com.project.adventure.vo.Order;

public class OrderServiceImpl implements OrderService {

	private CartService cartService;
	
	@Override
	public ArrayList<Order> cartToOrder(int[] cid) {		
		ArrayList<Order> orderLists = new ArrayList<Order>();
		for (int id : cid) {
			Cart cartList = cartService.getDetailCart(id);
			Order order = new Order();
			order.setCid(cartList.getCid());			
			order.setMid(cartList.getMid());
			order.setOp1(cartList.getP1());
			//
			
			orderLists.add(order);
		}
			return orderLists;	
		
	}

}
