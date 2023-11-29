package com.project.adventure.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class LostItem {
	private int lno;
	private String litem;
	private String lname;
	private String lphoto;
	private String location;
	private Date lrdate;
	private String lresult;	
	private String schWord;
	private Date schDate;
	private int startRow;
	private int endRow;	
}
