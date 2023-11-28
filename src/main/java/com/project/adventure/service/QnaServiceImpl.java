package com.project.adventure.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		return qnaDao.insertQna(qna);
	}

	@Override
	public Qna getQna(int qno) {
		return qnaDao.getQna(qno);
	}

	@Override
	public int qnaReply(Qna qna) {
		return qnaDao.qnaReply(qna);
	}
	@Override
	public int deleteQna(int qno) {
		return qnaDao.deleteQna(qno);
	}
	@Override
	public int modify(Qna qna) {
		return qnaDao.modify(qna);
	}
}
