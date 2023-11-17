package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Attraction;

@Mapper
public interface AttractionDao {
	public List<Attraction> bestAttractionList();
}