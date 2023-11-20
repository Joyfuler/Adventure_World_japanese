package com.project.adventure.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.WorkerDao;
import com.project.adventure.vo.Worker;
@Service
public class WorkerServiceImpl implements WorkerService {
	@Autowired
	private WorkerDao workerDao;
	@Override
	public Worker loginCheck(String wid, String wpw, HttpSession session) {
		String result="로그인 성공";
		Worker worker = workerDao.loginCheck(wid,wpw); //db에서 가져온id정보
		if(worker == null || !worker.getWpw().equals(wpw)) { //입력한 아이디가null인지? 입력한 비번과 db에 비번이 맞는지?
			result = "아이디 혹은 비밀번호를 입력하세요";
		}else {
			session.setAttribute("worker", worker);
		}
		return worker;
	}

}
