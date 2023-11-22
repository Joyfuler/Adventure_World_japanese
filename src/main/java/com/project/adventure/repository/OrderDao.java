package com.project.adventure.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDao {
	public int cartToOrder(int[] cid);
}
