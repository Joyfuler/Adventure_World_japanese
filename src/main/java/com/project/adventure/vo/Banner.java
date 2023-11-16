package com.project.adventure.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;


@Data
public class Banner {
	private int bno;
	private String btitle;
	private int border;
	private String usage;
	private Date brdate;
	private String bimg;
}
