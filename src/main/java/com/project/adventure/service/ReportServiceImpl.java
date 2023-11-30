package com.project.adventure.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.ReportDao;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao reportDao;
	
	
	@Override
	public List<Report> reportList(Report report, String pageNum) {
		Paging paging = new Paging(reportDao.totCnt(report), pageNum, 5, 5);
		report.setStartRow(paging.getStartRow());
		report.setEndRow(paging.getEndRow());		
		return reportDao.reportList(report);
	}

	@Override
	public int reportReview(Report report) {
		return reportDao.reportReview(report);
	}

	@Override
	public int deleteReport(int[] rno) {
		int result = 0;
		for (int no: rno) {
			result += reportDao.deleteReport(no);
		}
		return result;
	}

	@Override
	public int totCnt(Report report) {
		return reportDao.totCnt(report);
	}

}
