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

}
