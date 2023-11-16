package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Banner;

@Mapper
public interface BannerDao {
	public List<Banner> bannerList();
}
