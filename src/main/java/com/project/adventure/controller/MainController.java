package com.project.adventure.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.service.AttractionService;
import com.project.adventure.service.BannerService;
import com.project.adventure.service.EventService;
import com.project.adventure.service.ParadeService;
import com.project.adventure.service.ReviewService;


@Controller
public class MainController {	
	@Autowired
	public BannerService bannerService;	
	@Autowired
	public EventService eventService;
	@Autowired
	public AttractionService attractionService;
	@Autowired
	public ParadeService paradeService;
	@Autowired
	public ReviewService reviewService;
	
	@RequestMapping(value = "main", method = {RequestMethod.GET, RequestMethod.POST })
	public String main (Model model) {
		model.addAttribute("bannerList", bannerService.bannerList()); 
		model.addAttribute("eventList", eventService.eventList());
		model.addAttribute("bestList", attractionService.bestAttractionList());
		model.addAttribute("paradeList", paradeService.paradeList());
		return "main/main";
	}	
	
	@RequestMapping(value = "event", method = RequestMethod.GET)
	public String event(Model model) {
		model.addAttribute("eventList", eventService.eventList());
		return "notice/event";
	}	
	
	@RequestMapping(value = "paradeList", method = RequestMethod.GET)
	public String paradeList(Model model) {
		model.addAttribute("paradeList", paradeService.paradeList());
		return "parade/paradeList";
	}
	
	@RequestMapping(value = "howCome", method = RequestMethod.GET)
	public String howCome() {
		return "notice/howCome";
	}
	
	@RequestMapping(value = "fileupload", method = RequestMethod.POST)
	public void boardImageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile) {
		reviewService.imageUpload(request, response, multiFile);
	}
	
	
}
