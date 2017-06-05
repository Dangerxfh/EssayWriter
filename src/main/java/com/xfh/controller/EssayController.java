package com.xfh.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xfh.service.EssayService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.xfh.model.Essay;

@Controller
@RequestMapping(value="/essay")
public class EssayController {
	@Resource
	private EssayService essayService;

	//写文章
	@RequestMapping("/write")
	public  String essayWrite(){
		return "essay/essay_write";
	}

	//添加文章
	@RequestMapping(value="/addE",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> add(@ModelAttribute Essay essay) throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		Essay cur_essay=essayService.save(essay);
		if(cur_essay==null){ //添加文章失败
			map.put("essay_add","error");
		}
		else{  //添加成功
			map.put("essay_add","success");
			map.put("e_id",cur_essay.getId());
		}
		return map;
	}
	
	//查看文章内容
	@RequestMapping(value="/detail/{id}")
	public String detail(@PathVariable("id") int id,Map<String,Object> map) throws Exception{
		Essay essay=essayService.getEssay(id);
		if(essay!=null){
			map.put("essay",essay);
			return "essay/essay_detail";
		}
		else
			return "redirect:/index";
	}
	//markdown图片上传
	@RequestMapping(value="/uploadfile",method=RequestMethod.POST)
	public void hello(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "editormd-image-file", required = false) MultipartFile attach){
	    try {
	        request.setCharacterEncoding( "utf-8" );
	        response.setHeader( "Content-Type" , "text/html" );
	        String rootPath = request.getSession().getServletContext().getRealPath("staticresources/upload/");

	        /**
	         * 文件路径不存在则需要创建文件路径
	         */
	        File filePath=new File(rootPath);
	        if(!filePath.exists()){
	            filePath.mkdirs();
	        }

	        Integer imgnum= (Integer) request.getSession().getAttribute("imgnum");
	        if(imgnum==null)
	        	imgnum=1;
	        else
	        	imgnum++;
	        request.getSession().setAttribute("imgnum",imgnum);
			SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmSS");
			String imgurl="p"+format.format(new Date())+imgnum+".jpg";

	        //最终文件名
			File realFile=new File(rootPath+File.separator+imgurl);
			FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);

	        //下面response返回的json格式是editor.md所限制的，规范输出就OK
	        response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"staticresources/upload/" + imgurl + "\"}" );
	    } catch (Exception e) {
	        try {
	            response.getWriter().write( "{\"success\":0}" );
	        } catch (IOException e1) {
	            e1.printStackTrace();
	        }
	    }
	}
}
