package com.project.adventure.service;

import java.util.List;

import com.project.adventure.vo.Attraction;

public interface AttractionService {
	public List<Attraction> bestAttractionList();
	public List<Attraction> attractionList();
	public List<Attraction> tag1List();
	public List<Attraction> tag2List();
	public List<Attraction> searchAttractionList(Attraction attraction);
	public Attraction attractionDetail(String aid);
}
