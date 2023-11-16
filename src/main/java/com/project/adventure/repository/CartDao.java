package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Cart;

@Mapper
public interface CartDao {
	public List<Cart> cartList(Cart cart);
	public int totCntCart(Cart cart);
	public Cart getDetailCart(int cid);
	public int registerCart(Cart cart);
	public int modifyBCart(Cart cart);
	public int deleteCart(int cid);
}
