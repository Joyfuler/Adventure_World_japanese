package com.project.adventure.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Notice {
	private int nid;
	private String ntitle;
	private String ncontent;
	private Timestamp nrdate;
	private String mid;
}
