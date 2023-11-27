package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.adventure.service.BannerService;

@Controller
@RequestMapping("banner")
public class WorkerBannerController {
	@Autowired
	private BannerService bannerService;
}
