package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Event;

@Mapper
public interface EventDao {
	public List<Event> eventList();
}
