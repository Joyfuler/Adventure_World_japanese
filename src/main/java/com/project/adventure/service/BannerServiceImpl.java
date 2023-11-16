package com.project.adventure.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.BannerDao;
import com.project.adventure.vo.Banner;
@Service
public class BannerServiceImpl implements BannerService {
	@Autowired
	private BannerDao bannerDao;
		
	@Override
	public List<Banner> bannerList() {
		return bannerDao.bannerList();		
	}

}
