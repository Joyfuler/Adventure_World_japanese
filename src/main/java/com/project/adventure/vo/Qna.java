package com.project.adventure.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Qna {
	private int qno;
	private String qtitle;
	private String qcontent;
	private String qpw;
	private String isreply;
	private String reply;
	private Date qrdate;
	private int qgroup;
	private int qstep;
	private int qindent;
	private String mid;
	//검색
	private String schWord;
	private int startRow;
	private int endRow;	
	private String qpwchk;
}
