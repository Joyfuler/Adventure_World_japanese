package com.project.adventure.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.util.Paging;
import com.project.adventure.vo.Qna;

public interface QnaService {
	public List<Qna> QnaList(String pageNum, Qna qna);
	public int qnaTotCnt(Qna qna);
	public int insertQna(Qna qna);
	public int deleteQna(int qno);
	public Qna getQna(int qno);
	public int qnaReply(Qna qna);
	public int modify(Qna qna);
	public int qnaRreply(Qna qna);
}
