package com.project.adventure.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Order_Detail {	
	private int oid;
	private String oname;
	private String omail;
	private String ophone;
	private Date odate;
	private String mid;
	private String ompoint;
	private String payment;
	private int odid;
	private int op1;
	private int op2;
	private int otype;
	private String oatname1;
	private String oatname2;
	private String oatname3;
	private int oprice1;
	private int oprice2;
	private int oresult;
	private Date ocrdate;
	private Date ovisitdate;	
	private int startRow;
	private int endRow;	
}
