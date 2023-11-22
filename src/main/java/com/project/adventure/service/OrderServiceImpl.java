package com.project.adventure.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.CartDao;
import com.project.adventure.repository.OrderDao;
import com.project.adventure.vo.Cart;
import com.project.adventure.vo.Order;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private CartService cartService;	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public void cartToOrder(int[] cid) {		
		ArrayList<Order> orderLists = new ArrayList<Order>();
		for (int id : cid) {
			Cart cartList = cartService.getDetailCart(id);
			Order order = new Order();
			order.setCid(cartList.getCid());			
			order.setMid(cartList.getMid());
			order.setOp1(cartList.getP1());
			order.setOp2(cartList.getP2());
			order.setOtype(cartList.getType());
			order.setOatname1(cartList.getAtname1());
			order.setOatname2(cartList.getAtname2());
			order.setOatname3(cartList.getAtname3());
			order.setOprice1(cartList.getPrice1());
			order.setOprice2(cartList.getPrice2());
			order.setOresult(cartList.getResult());
			order.setOvisitdate(cartList.getVisitdate());
			orderDao.cartToOrder(order);
			System.out.println("카트에서 주문내역으로 추가됨 :" + order);
		}	
	}

	@Override
	public List<Order> orderList(int[] cid) {
		return orderDao.orderList(cid);		
	}
}
