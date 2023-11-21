package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Attraction;

@Mapper
public interface AttractionDao {
	public List<Attraction> bestAttractionList();
	public List<Attraction> attractionList();
	public List<Attraction> tag1List();
	public List<Attraction> tag2List();
	public List<Attraction> searchAttractionList(Attraction attraction);
	public Attraction attractionDetail(String aid);
	public List<Attraction> stopDayAttractionList();
}