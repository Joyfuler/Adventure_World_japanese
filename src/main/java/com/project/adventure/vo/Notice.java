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
	private String wid;
	// top-N구문에서 필요한 필드
	private int startRow;
	private int endRow;
	//검색을 위한 필드
	private String schTitle;
}
