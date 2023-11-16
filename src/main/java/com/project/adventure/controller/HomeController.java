package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.BannerService;


@Controller
public class HomeController {	
	@Autowired
	public BannerService bannerService;
		
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home() {		
		return "home";
	}	
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main (Model model) {
		model.addAttribute("bannerList", bannerService.bannerList());		
		return "main/main";
	}	
}
