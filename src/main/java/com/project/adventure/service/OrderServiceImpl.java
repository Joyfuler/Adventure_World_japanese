package com.project.adventure.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.CartDao;
import com.project.adventure.repository.OrderDao;
import com.project.adventure.repository.Order_DetailDao;
import com.project.adventure.vo.Cart;
import com.project.adventure.vo.Member;
import com.project.adventure.vo.Order;
import com.project.adventure.vo.Order_Detail;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private CartDao cartDao;
	@Autowired
	private Order_DetailDao order_DetailDao;
	@Autowired
	private OrderDao orderDao;
	@Override
	public void orderDetail(Order order, HttpSession session) {
		orderDao.ordersInfoInsert(order);
		ArrayList<Integer> cids = (ArrayList<Integer>) session.getAttribute("cids");
		for (Integer cid : cids) {
			Cart cart = cartDao.getDetailCart(cid);
			order_DetailDao.orderDetailInsert(cart);
			cartDao.deleteCart(cid);			
		}
		
		session.removeAttribute("cids");
		
	}
	@Override
	public List<Order_Detail> orderList(HttpSession session) {
		String mid = null;
		Member member = (Member)session.getAttribute("member");
		if (member != null) {
			mid = member.getMid();
		}		
		return order_DetailDao.orderList(mid);		
	}
}
