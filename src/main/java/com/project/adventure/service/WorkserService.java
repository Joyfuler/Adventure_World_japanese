package com.project.adventure.service;

import javax.servlet.http.HttpSession;

public interface WorkserService {
	public String loginCheck(String wid, String wpw, HttpSession httpSession);
}
