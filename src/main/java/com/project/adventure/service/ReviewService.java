package com.project.adventure.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ReviewService {
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile);

}