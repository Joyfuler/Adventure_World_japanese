package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.service.AttractionService;
import com.project.adventure.util.Paging;
import com.project.adventure.util.WeekDayCalculator;
import com.project.adventure.vo.Attraction;
import com.project.adventure.vo.Notice;

@Controller
@RequestMapping("workerAttraction")
public class WorkerAttractionController {
	@Autowired
	private AttractionService attractionService;
	@RequestMapping(value = "attractionList", method = {RequestMethod.GET, RequestMethod.POST})
	public String attractionList(Model model) {
		model.addAttribute("tag1List", attractionService.tag1List());
		model.addAttribute("tag2List", attractionService.tag2List());
		return "worker/workerAttraction";
	}
	@RequestMapping(value = "attractionListP", method = {RequestMethod.GET, RequestMethod.POST})
	public String attractionListP(String pageNum,Attraction attraction, Model model) {
		model.addAttribute("workerAttraction", attractionService.attractionListP(pageNum, attraction));
		model.addAttribute("tag1List", attractionService.tag1List());
		model.addAttribute("tag2List", attractionService.tag2List());
		System.out.println(attraction);
		model.addAttribute("paging", new Paging(attractionService.totCntAttraction(attraction), pageNum, 5, 5));
		return "worker/workerAttraction";
	}
	@RequestMapping(value = "attractionDetail", method = RequestMethod.GET)
	public String attractionDetail(Model model, String aid) {
		model.addAttribute("attractionDetail", attractionService.attractionDetail(aid));
		model.addAttribute("weekSchedule", WeekDayCalculator.getCurrentWeekSchedule());
		return "worker/workerAttractionDetail";
	}
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insert() {
		return "worker/workerAttractionInsert";
	}
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(MultipartHttpServletRequest mRequest, Attraction attraction, Model model) {
		model.addAttribute("insertResult", attractionService.insertAttraction(mRequest, attraction));
		return "forward:attractionListP.do";
	}
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(String aid, Model model) {
		System.out.println("id : " + aid);
		model.addAttribute("attraction", attractionService.attractionDetail(aid));
		return "worker/workerAttractionUpdate";
	}
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(MultipartHttpServletRequest mRequest, @ModelAttribute("nDto") Attraction attraction, Model model, String pageNum) {
		model.addAttribute("updateAttraction", attractionService.insertAttraction(mRequest, attraction));
		return "forward:attractionListP.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int aid, Model model) {
		model.addAttribute("attraction", attractionService.deleteAttraction(aid));
		model.addAttribute("deleteResult", "삭제 되었습니다.");
		return "forward:attractionListP.do";
	}
}
