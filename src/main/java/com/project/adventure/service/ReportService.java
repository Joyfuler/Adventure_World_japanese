package com.project.adventure.service;

import java.util.List;

import com.project.adventure.vo.Report;

public interface ReportService {
	public List<Report> reportList(Report report, String pageNum);
	public int reportReview(Report report);
	public int deleteReport(int[] rno);
	public int totCnt(Report report);
	
}
