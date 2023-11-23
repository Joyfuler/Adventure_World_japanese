package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Cart;
import com.project.adventure.vo.Order_Detail;

@Mapper
public interface Order_DetailDao {
	public int orderDetailInsert(Cart cart);
	public List<Order_Detail> orderList(String mid);
}
