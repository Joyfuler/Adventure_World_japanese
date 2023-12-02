package com.project.adventure.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Qna;

@Mapper

public interface QnaDao {
	public List<Qna> QnaList(Qna qna);
	public int qnaTotCnt(Qna qna);
	public int insertQna(Qna qna);
	public int deleteQna(int qno);
	public Qna getQna(int qno);
	public int qnaReply(Qna qna);
	public int qnaRreply(Qna qna);
	public int modify(Qna qna);
	public int userModify(Qna qna);	

}
