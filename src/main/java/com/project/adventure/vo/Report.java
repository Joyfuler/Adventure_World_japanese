package com.project.adventure.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Report {
	private String rno;
	private int rreason;
	private Timestamp reportdate;
	private String mid;
	private int rid;
	private int startRow;
	private int endRow;
	private String searchword;
	private String reportermid;
	private String writermid;
	private String rcontent;
	private String rtitle;
	private Timestamp rrdate;
	private String mname;
}
