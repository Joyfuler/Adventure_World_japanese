package com.project.adventure.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.adventure.vo.Cart;
import com.project.adventure.vo.Order;

public interface CartService {
	public List<Cart> cartList(String mid);	
	public int totCntCart(Cart cart);
	public Cart getDetailCart(int cid);
	public int registerCart1(Cart cart);
	public int registerCart2(Cart cart, String[] attracion);	
	public int modifyBCart(Cart cart);
	public int deleteCart(int[] cid);
	public List<Cart> toOrderList(int[] cid);
	public void updateResult(int[] cid);
	public Cart getTicketAmountAndPrice(int[] cid);
	public void cidsAdd(int[] cid, HttpSession session);
}
