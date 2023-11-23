package com.project.adventure.util;

import lombok.Data;

@Data
public class Paging {
	private int currentPage = 1; 
	private int pageSize;
	private int blockSize;
	private int startRow;
	private int endRow;
	private int totCnt;
	private int pageCnt;
	private int startPage;
	private int endPage;
	private int orderNum;
	private int inverseNum;
	
	public Paging(int totCnt, String pageNum, int pageSize, int blockSize) {
		this.totCnt = totCnt; // 매개변수로 온 totCnt를 생성자로 대입
		if (pageNum != null && !pageNum.equals("")) {
			currentPage = Integer.parseInt(pageNum);
		}		
		this.pageSize = pageSize;
		this.blockSize= blockSize;
		startRow = (currentPage-1) * pageSize + 1;
		endRow = startRow + pageSize -1;
		pageCnt = (int) Math.ceil((double)totCnt / pageSize);
		startPage = currentPage - (currentPage-1) % blockSize;
		endPage = startPage + blockSize -1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}		
		orderNum = startRow; // 첫 라인에 출력할 순차번호		
		inverseNum = totCnt - startRow + 1; // 첫라인 출력 역순번호
	}
}
