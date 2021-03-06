package com.xfh.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.StringJoiner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.xfh.model.User;
import com.xfh.service.impl.EssayServiceImpl;
import com.xfh.service.UserService;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
    private UserService userService;

	@RequestMapping(value = "/tologin")
    public  String toLogin(){
	    return "user/user_login";
    }

	//登陆
	@RequestMapping(value = "/login",method =RequestMethod.POST )
	@ResponseBody
	public Map<String,Object> userLogin(@ModelAttribute User user, HttpSession session){
		System.out.println(user.getUsername()+" "+user.getUsername());
		User cur_user=userService.userLogin(user);
		Map<String,Object> map=new HashMap<String,Object>();
		if(cur_user!=null) {
			session.setAttribute("user", cur_user);
			map.put("login_msg","success");
		}
		else{
			map.put("login_msg","error");
		}
		return  map;
	}

	//跳转到注册页面
	@RequestMapping(value = "/toregister")
	public  String toRegister(){
		return "user/user_register";
	}

	//注册
	@ResponseBody
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public  Map<String,Object> userRegister(@ModelAttribute User user) throws Exception {
		boolean reg=userService.userRegister(user);
		Map<String,Object> map=new HashMap<String,Object>();
		if(reg){
			map.put("user",user);
			map.put("reg_msg","success");
		}
		else
			map.put("reg_msg","error");
		return map;
	}
	//注销
	@RequestMapping(value = "/logout")
	public  String logout(HttpSession session){
		session.setAttribute("user",null);
		return "redirect:/user/tologin";
	}

	//上传头像
	@RequestMapping(value="/headimage",method=RequestMethod.POST)
	public String headimage(@RequestParam("headimg") MultipartFile filePhoto) throws IOException{
		/**基本配置*/
		  //设置好账号的ACCESS_KEY和SECRET_KEY
		  String ACCESS_KEY = "SFkvPDn6FfkjmKSyGcFJHB-Z63BvzzGjuk81-5KX";
		  String SECRET_KEY = "DkhZrfsLIZayuhAArA05ctQ84zGu5yG5_grBm_jX";
		  //要上传的空间--目前用的测试空间--上线要修改
		  String bucketname = "test";
		  byte[] FilePath=filePhoto.getBytes();


		  /**指定保存到七牛的文件名--同名上传会报错  {"error":"file exists"}*/
		  /** {"hash":"FrQF5eX_kNsNKwgGNeJ4TbBA0Xzr","key":"aa1.jpg"} 正常返回 key为七牛空间地址 http://imagetest.i.haierzhongyou.com/aa1.jpg */
		  //上传到七牛后保存的文件名(用户Id+.jpg)---不指定的话，七牛随机产生-无后缀
		  String key = "1001.jpg";
		  //密钥配置
		  Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
		  //创建上传对象
		  UploadManager uploadManager = new UploadManager();
		  try {
		      //调用put方法上传

		      Response res = uploadManager.put(FilePath, key, auth.uploadToken(bucketname));
		      //打印返回的信息
		      System.out.println(res.bodyString());
		      } catch (QiniuException e) {
		          Response r = e.response;
		          // 请求失败时打印的异常的信息
		          System.out.println(r.toString());
		          try {
		              //响应的文本信息
		            System.out.println(r.bodyString());
		          } catch (QiniuException e1) {
		              //ignore
		          }
		      }
		  return "image";
	}


}
