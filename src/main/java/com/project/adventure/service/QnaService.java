package com.project.adventure.service;

import java.util.List;

import com.project.adventure.util.Paging;
import com.project.adventure.vo.Qna;

public interface QnaService {
	public List<Qna> QnaList(String pageNum, Qna qna);
	public int qnaTotCnt(Qna qna);
	public int insertQna(Qna qna);
	public Qna getQna(int qno);
	public int qnaPreReply(Qna qna);
}
