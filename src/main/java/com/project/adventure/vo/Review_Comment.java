package com.project.adventure.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Review_Comment {
	private int rcid;
	private String rccontent;
	private Timestamp rcrdate;
	private int rcgroup;
	private int rcstep;
	private int rcindent;
	private int rid;
	private String mid;
	private String mname;
	private int startRow;
	private int endRow;	
}
