package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Report;

@Mapper
public interface ReportDao {
	public List<Report> reportList(Report report);
	public int reportReview(Report report);
	public int deleteReport(int rno);
	public int totCnt(Report report);
}
