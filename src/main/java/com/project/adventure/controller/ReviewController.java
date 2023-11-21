package com.project.adventure.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("review")
public class ReviewController {
	@RequestMapping(value = "reviewList", method = RequestMethod.GET)
	public String reviewList() {
		return "review/reviewList";
	}
}
