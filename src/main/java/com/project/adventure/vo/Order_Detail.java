package com.project.adventure.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Order_Detail {
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
	private int oid;
}
