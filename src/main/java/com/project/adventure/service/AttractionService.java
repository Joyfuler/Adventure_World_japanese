package com.project.adventure.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.vo.Attraction;

public interface AttractionService {
	public List<Attraction> bestAttractionList();
	public List<Attraction> attractionList();
	public List<Attraction> attractionListP(String pageNum, Attraction attraction);
	public int totCntAttraction(Attraction attraction);
	public List<Attraction> tag1List();
	public List<Attraction> tag2List();
	public List<Attraction> searchAttractionList(Attraction attraction);
	public Attraction attractionDetail(String aid);
	public List<Attraction> stopDayAttractionList();
	public int insertAttraction(MultipartHttpServletRequest mRequest, Attraction attraction);
	public int updateAttraction(MultipartHttpServletRequest mRequest, Attraction attraction);
	public int deleteAttraction(int aid);
}
