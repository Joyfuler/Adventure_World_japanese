package com.project.adventure.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeComment {
	private int cnum;
	private int nid;
	private String cname;
	private String cmemo;
	private Timestamp cdate;
	private int cgroup;
	private int cstep;
	private int cindent;
	private String cip;
	private int startRow;
	private int endRow;
}
