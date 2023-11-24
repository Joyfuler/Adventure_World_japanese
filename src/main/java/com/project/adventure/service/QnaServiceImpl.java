package com.project.adventure.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.QnaDao;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Qna;
@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDao qnaDao;
	@Override
	public List<Qna> QnaList(String pageNum, Qna qna) {
		Paging paging = new Paging(qnaDao.qnaTotCnt(qna), pageNum, 10, 10);
		qna.setStartRow(paging.getStartRow());
		qna.setEndRow(paging.getEndRow());
		return qnaDao.QnaList(qna) ;
	}
	@Override
	public int qnaTotCnt(Qna qna) {
		return  qnaDao.qnaTotCnt(qna);
	}

	@Override
	public int insertQna(Qna qna) {
		qnaDao.qnaPreRepstep(qna);
		return qnaDao.insertQna(qna);
	}

	@Override
	public Qna getQna(int qno) {
		return qnaDao.getQna(qno);
	}

	@Override
	public int qnaPreReply(Qna qna) {
		qnaDao.qnaPreRepstep2(qna);
		return qnaDao.qnaPreReply(qna);
	}

}
