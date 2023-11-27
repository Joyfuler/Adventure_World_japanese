package com.project.adventure.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private String rid;
	private String rtitle;
	private String rcontent;
	private int rscore;
	private String rphoto;
	private Date rrdate;
	private String mid;
	private int otype;
	private int odid;
	private String mname;
	private String oatname1;
	private String oatname2;
	private String oatname3;
	private Date ovisitdate;
	private int startRow;
	private int endRow;
	private int op1;
	private int op2;
	private String sort;
	private int reviewcount;
	private double avg;
	private String searchWord;
}
