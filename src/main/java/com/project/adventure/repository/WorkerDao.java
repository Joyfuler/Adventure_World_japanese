package com.project.adventure.repository;


import org.apache.ibatis.annotations.Mapper;

import com.project.adventure.vo.Worker;

@Mapper
public interface WorkerDao {
	public Worker loginCheck(String wid, String wpw);
	public int workerCnt();
}
