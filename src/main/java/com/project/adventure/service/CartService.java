package com.project.adventure.service;

import java.util.List;

import com.project.adventure.vo.Cart;

public interface CartService {
	public List<Cart> cartList(Cart cart);
	public int totCntCart(Cart cart);
	public Cart getDetailCart(int cid);
	public int registerCart(Cart cart);
	public int modifyBCart(Cart cart);
	public int deleteCart(int cid);
}
