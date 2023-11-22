package com.project.adventure.service;

import java.util.ArrayList;
import com.project.adventure.vo.Order;

public interface OrderService {
	public ArrayList<Order> cartToOrder(int[] cid);
}
