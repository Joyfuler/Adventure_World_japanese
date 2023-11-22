package com.project.adventure.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Order {
	private int oid;
	private int cid;
	private String mid;
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
}
