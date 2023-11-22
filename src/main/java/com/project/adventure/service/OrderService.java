package com.project.adventure.service;

import java.util.ArrayList;
import java.util.List;

import com.project.adventure.vo.Order;

public interface OrderService {
	public void cartToOrder(int[] cid);
	public List<Order> orderList(int[] cid);
}
