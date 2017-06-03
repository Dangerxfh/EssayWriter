package com.xfh.service;

import com.xfh.model.Essay;

import java.util.List;
import java.util.Map;

public interface EssayService {
	//保存
	public Essay save(Essay essay);

	//根据id查看文章
	public Essay getEssay(Integer id) throws Exception;

	//获取所有文章
	public  List<Essay> getAll();
	
}
