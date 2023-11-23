package com.project.adventure.repository;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Order;

@Mapper
public interface OrderDao {
	public void ordersInfoInsert(Order order);
}
