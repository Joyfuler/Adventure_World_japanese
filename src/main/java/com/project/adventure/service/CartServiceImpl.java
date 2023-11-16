package com.project.adventure.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.CartDao;
import com.project.adventure.vo.Cart;
@Service
public class CartServiceImpl implements CartService {
@Autowired
private CartDao cartDao;
	@Override
	public List<Cart> cartList(Cart cart) {
		return cartDao.cartList(cart);
	}

	@Override
	public int totCntCart(Cart cart) {
		return cartDao.totCntCart(cart);
	}

	@Override
	public Cart getDetailCart(int cid) {
		return cartDao.getDetailCart(cid);
	}

	@Override
	public int registerCart(Cart cart) {	
		return cartDao.registerCart(cart);
	}

	@Override
	public int modifyBCart(Cart cart) {
		return cartDao.modifyBCart(cart);
	}

	@Override
	public int deleteCart(int cid) {
		return cartDao.deleteCart(cid);
	}

}
