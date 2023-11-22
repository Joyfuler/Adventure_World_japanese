package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Order;

@Mapper
public interface OrderDao {
	public int cartToOrder(Order order);
	public List<Order> orderList(int[] cid);
}
