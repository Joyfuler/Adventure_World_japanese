package com.project.adventure.service;

import javax.servlet.http.HttpSession;

import com.project.adventure.vo.Worker;

public interface WorkerService {
	public String loginCheck(Worker worker, HttpSession httpSession);
}
