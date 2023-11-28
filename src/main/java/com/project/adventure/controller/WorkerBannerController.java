package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.service.BannerService;
import com.project.adventure.vo.Attraction;
import com.project.adventure.vo.Banner;

@Controller
@RequestMapping("workerBanner")
public class WorkerBannerController {
	@Autowired
	private BannerService bannerService;
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String bannerList(Banner banner, Model model) {
		model.addAttribute("bannerList" ,bannerService.bannerList());
		model.addAttribute("cntBanner", bannerService.cntBanner(banner));
		return "worker/workerBanner";
	}
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(Banner banner, Model model) {
		model.addAttribute("UpdateBanner", bannerService.updateBanner(banner));
		return "forward:list.do";
	}
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insert(Banner banner, Model model) {
		model.addAttribute("bannerList" ,bannerService.bannerList());
		model.addAttribute("cntBanner", bannerService.cntBanner(banner));
		return "worker/workerBannerInsert";
	}
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(MultipartHttpServletRequest mRequest, Banner banner, Model model) {
		model.addAttribute("bannerList", bannerService.insertBanner(mRequest, banner));
		return "forward:list.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int bno, Model model) {
		model.addAttribute("banner", bannerService.deleteBanner(bno));
		model.addAttribute("deleteResult", "배너가 삭제 되었습니다.");
		return "forward:list.do";
	}
}
