package com.project.adventure.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.ParadeDao;
import com.project.adventure.vo.Parade;

@Service
public class ParadeServiceImpl implements ParadeService {

	@Autowired
	private ParadeDao paradeDao;
	
	@Override
	public List<Parade> paradeList() {
		return paradeDao.paradeList();
	}

}
