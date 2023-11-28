package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Cart;
import com.project.adventure.vo.Order_Detail;

@Mapper
public interface Order_DetailDao {
	public int orderDetailInsert(Cart cart);
	public List<Order_Detail> orderList(String mid);
	public List<Order_Detail> orderList(Order_Detail order_Detail);
	public int priceTotal(int oid);
	public int totCnt(Order_Detail order_Detail);
	public int deleteOrder(int oid);
	public List<Order_Detail> reviewSelect(String mid);
	public void checkReviewOk(int odid);
	public Order_Detail selectedTicketInfo(int odid);
	
}
