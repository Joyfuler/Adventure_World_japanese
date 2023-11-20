package com.project.adventure.repository;

import java.util.List;

import com.project.adventure.vo.Qna;
import org.apache.ibatis.annotations.Mapper;

@Mapper

public interface QnaDao {
	public List<Qna> QnaList(Qna qna);
	public int qnaTotCnt(Qna qna);
	public int insertQna(Qna qna);
//	public int qnaHitUp(int bid);
	public Qna getQna(int qno);
	public int qnaPreReplyStep(Qna qna);
	public int qnaPreReply(Qna qna);	
//	public int QnaModify(Qna qna);
//	public int QnaDelete(int qna);
}
