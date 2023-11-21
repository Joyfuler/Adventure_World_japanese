package com.project.adventure.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.AttractionDao;
import com.project.adventure.vo.Attraction;
@Service
public class AttractionServiceImpl implements AttractionService {
	
	@Autowired
	private AttractionDao attractionDao;	

	@Override
	public List<Attraction> bestAttractionList() {
		return attractionDao.bestAttractionList();

	}

	@Override
	public List<Attraction> attractionList() {
		return attractionDao.attractionList();
	}

	@Override
	public List<Attraction> tag1List() {
		return attractionDao.tag1List();
	}

	@Override
	public List<Attraction> tag2List() {
		return attractionDao.tag2List();
	}

	@Override
	public List<Attraction> searchAttractionList(Attraction attraction) {		
		return attractionDao.searchAttractionList(attraction);
	}

	@Override
	public Attraction attractionDetail(String aid) {
		return attractionDao.attractionDetail(aid);
	}

}
