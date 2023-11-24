package com.project.adventure.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Order {
	private int oid;
	private String oname;
	private String omail;
	private String ophone;
	private Date odate;
	private String mid;
	private int ompoint;
	private String payment;
	
}
