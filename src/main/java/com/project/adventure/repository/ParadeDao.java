package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Parade;

@Mapper
public interface ParadeDao {
	public List<Parade> paradeList();
}
