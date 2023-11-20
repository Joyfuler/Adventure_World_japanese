package com.project.adventure.service;

import javax.servlet.http.HttpSession;

import com.project.adventure.vo.Worker;

public interface WorkerService {
	public Worker loginCheck(String wid, String wpw, HttpSession httpSession);
}
