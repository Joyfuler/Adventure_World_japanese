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
	public int registerCart1(Cart cart) {	
		switch (cart.type) {
	    case 0:

	    	cart.setPrice1(cart.p1 * 53000);
	    	cart.setPrice2(cart.p2 * 30000);
	    	cart.setType(0);
	        break;
	    case 1:

	    	cart.setPrice1(cart.p1 * 110000);
	    	cart.setPrice2(cart.p2 * 70000);
	    	cart.setType(1);
	        break;
		}
		return cartDao.registerCart1(cart);
	}
	
	@Override
	public int registerCart2(Cart cart, String[] attracion) {	
		switch (cart.type) {
	    case 0:

	    	cart.setPrice1(cart.p1 * 53000);
	    	cart.setPrice2(cart.p2 * 30000);
	    	cart.setType(0);
	        break;
	    case 1:

	    	cart.setPrice1(cart.p1 * 110000);
	    	cart.setPrice2(cart.p2 * 70000);
	    	cart.setType(1);
	        break;
		}
		int result = 0;
		for(String aname : attracion) {
			cart.setAtname1(attracion[0]);	
			cart.setAtname2(attracion[1]);
			cart.setAtname3(attracion[2]);
		}
		return cartDao.registerCart2(cart);
	}

	@Override
	public int modifyBCart(Cart cart) {
		return cartDao.modifyBCart(cart);
	}

	@Override
	public int deleteCart(int[] cid) {
		int result = 0;
		for(int id : cid) {
			result += cartDao.deleteCart(id);
		}
		return result;
	}

}
