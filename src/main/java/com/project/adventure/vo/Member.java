package com.project.adventure.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String mid;
	private String mpw;
	private String mname;
	private String mphone;
	private String memail;
	private String maddress1;
	private String maddress2;
	private String maddress3;
	private Date mrdate;
	private int mlevel;
	private int startRow;
	private int endRow;
	private int mpoint;
}
