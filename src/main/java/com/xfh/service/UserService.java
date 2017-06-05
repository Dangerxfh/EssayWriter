package com.xfh.service;

import com.xfh.model.User;

/**
 * Created by Fog on 2017/6/3.
 */
public interface UserService {
    //登陆
    public User userLogin(User user);

    //注册
    public  boolean userRegister(User user) throws Exception;
}
