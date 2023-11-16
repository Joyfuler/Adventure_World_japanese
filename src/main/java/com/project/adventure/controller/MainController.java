package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.BannerService;
import com.project.adventure.service.EventService;


@Controller
public class MainController {	
	@Autowired
	public BannerService bannerService;
	
	@Autowired
	public EventService eventService;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main (Model model) {
		model.addAttribute("bannerList", bannerService.bannerList());
		model.addAttribute("size", bannerService.bannerList().size());
		model.addAttribute("eventList", eventService.eventList());
		return "main/main";
	}	
	
	@RequestMapping(value = "event", method = RequestMethod.GET)
	public String event(Model model) {
		model.addAttribute("eventList", eventService.eventList());
		return "notice/event";
	}
	
}
