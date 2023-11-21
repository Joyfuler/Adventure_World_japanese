package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.adventure.service.AttractionService;
import com.project.adventure.util.WeekDayCalculator;
import com.project.adventure.vo.Attraction;

@Controller
@RequestMapping("attraction")
public class AttractionController {
	
	@Autowired
	private AttractionService attractionService;	
	
	@RequestMapping(value = "attractionList", method = RequestMethod.GET)
	public String attractionList(Model model) {
		model.addAttribute("attractionList", attractionService.attractionList());
		model.addAttribute("tag1List", attractionService.tag1List());
		model.addAttribute("tag2List", attractionService.tag2List());
		return "attraction/attractionList";
	}
	
	@RequestMapping(value = "searchAttracionList", method = RequestMethod.GET)
	public String searchAttractionList(Model model, Attraction attraction) {	
		model.addAttribute("searchOk", "searchOk");
		model.addAttribute("searchAttractionList", attractionService.searchAttractionList(attraction));
		return "forward:attractionList.do";
	}
	
	@RequestMapping(value = "attractionDetail", method = RequestMethod.GET)
	public String attractionDetail(Model model, String aid) {
		model.addAttribute("attractionDetail", attractionService.attractionDetail(aid));
		model.addAttribute("weekSchedule", WeekDayCalculator.getCurrentWeekSchedule());
		return "attraction/attractionDetail";
	}
	
	@RequestMapping(value = "stopdayInfo", method = RequestMethod.GET)
	public String stopdayInfo(Model model) {
		model.addAttribute("weekSchedule", WeekDayCalculator.getCurrentWeekSchedule());
		return "attraction/stopdayInfo";
	}
	
	
}
