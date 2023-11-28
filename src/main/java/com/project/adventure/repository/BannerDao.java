package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Banner;

@Mapper
public interface BannerDao {
	public List<Banner> bannerList();
	public int insertBanner(Banner banner);
	public int updateBanner(Banner banner);
	public int deleteBanner(int bno);
	public int cntBanner(Banner banner);
}
