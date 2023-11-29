package com.project.adventure.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.vo.Banner;

public interface BannerService {
	public List<Banner> bannerList(String from);
	public int insertBanner(MultipartHttpServletRequest mRequest, Banner banner);
	public int updateBanner(Banner banner);
	public int deleteBanner(int bno);
	public int cntBanner(Banner banner);
}
