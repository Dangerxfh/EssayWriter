package com.xfh.service.impl;

import com.xfh.dao.IBaseDao;
import com.xfh.model.Essay;
import com.xfh.service.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("essayService")
@Transactional
public class EssayServiceImpl implements EssayService {

	@Autowired
	private IBaseDao<Essay> essayDao;
	//保存操作
	@Override
	public Essay save(Essay essay) {
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("e_title",essay.getE_title());
		params.put("e_date",essay.getE_date());
		//根据title和date查询
		List<Essay> essays=essayDao.getByParams(1,Essay.class,params);
		if(essays.isEmpty()){
			essayDao.save(essay);
			//查询刚刚插入的文章,以便获取w_id
			essays=essayDao.getByParams(1,Essay.class,params);
			return  essays.get(0);
		}
		return null;
	}

	@Override
	public Essay getEssay(Integer id) throws Exception {
		List<Essay> essays=essayDao.getByParam(Essay.class,"id",id);
		return essays.get(0);
	}

	@Override
	public List<Essay> getAll() {
		List<Essay> essays=essayDao.getAll(Essay.class);
		return  essays;
	}
}
