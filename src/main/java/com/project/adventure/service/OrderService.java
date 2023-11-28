package com.project.adventure.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.adventure.vo.Order;
import com.project.adventure.vo.Order_Detail;

public interface OrderService {
	public void orderDetail (Order order, HttpSession session);
	public List<Order_Detail> orderList(HttpSession session);
	public List<Order_Detail> orderList(Order_Detail order_Detail, String pageNum);
	public int priceTotal(int oid);
	public int totCnt(Order_Detail order_Detail);
	public int deleteOrder (int[] oid);
	public List<Order_Detail> reviewSelect(HttpSession session);
	public Order_Detail selectedTicketInfo(int rid);
	
}
