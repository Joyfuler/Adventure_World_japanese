package com.project.adventure.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.adventure.vo.Order;
import com.project.adventure.vo.Order_Detail;

public interface OrderService {
	public void orderDetail (Order order, HttpSession session);
	public List<Order_Detail> orderList(HttpSession session);
	
}
