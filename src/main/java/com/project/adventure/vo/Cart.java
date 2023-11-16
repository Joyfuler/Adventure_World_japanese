package com.project.adventure.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Cart {
	public int cid;
	public int p1;
	public int p2;
	public int type;
	public String atname;
	public String atname2;
	public String atname3;
	public int price1;
	public int price2;
	public int result;
	public Date crdate;
	public Date visitdate;
	public int startRow;
	public int endRow;
	public String mid;
}
