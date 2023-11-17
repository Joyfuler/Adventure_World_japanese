package com.project.adventure.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.adventure.repository.WorkerDao;
import com.project.adventure.vo.Worker;
@Service
public class WorkerServiceImpl implements WorkserService {
	@Autowired
	private WorkerDao workerDao;
	@Override
	public String loginCheck(String wid, String wpw, HttpSession httpSession) {
		String result="로그인성공";
		Worker worker = workerDao.getWorkerInfo(wid); //db에서 가져온id정보
		if(worker == null || !worker.getWpw().equals(wpw)) { //입력한 아이디가null인지? 입력한 비번과 db에 비번이 맞는지?
			result = "아이디 혹은 비밀번호를 입력하세요";
		}else {
			httpSession.setAttribute("worker", worker);
		}
		return result;
	}

}
