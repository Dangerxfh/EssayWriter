package com.xfh.service.impl;

import com.xfh.dao.IBaseDao;
import com.xfh.model.User;
import com.xfh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Fog on 2017/6/3.
 */
@Service("userService")
public class UserServiceImpl implements UserService{
    @Autowired
    private IBaseDao<User> userDao;
    @Override
    public User userLogin(User user) {
        Map<String ,Object> params=new HashMap<String,Object>();
        params.put("username",user.getUsername());
        params.put("userpass",user.getUserpass());
        List<User> users=userDao.getByParams(1,User.class,params);

        if(!users.isEmpty())
            return users.get(0);
        return  null;
    }

    //注册
    @Override
    public boolean userRegister(User user) throws Exception {
        List<User> users=userDao.getByParam(User.class,"username",user.getUsername());
        if(users.isEmpty()){
            userDao.save(user);
            return true;
        }
        return  false;
    }
}
