package com.project.adventure.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.EventDao;
import com.project.adventure.vo.Event;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDao eventDao;
	
	@Override
	public List<Event> eventList() {
		return eventDao.eventList();
	}
}
