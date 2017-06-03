package com.xfh.controller;

import com.xfh.model.Essay;
import com.xfh.service.EssayService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Fog on 2017/6/3.
 */
@Controller
public class OtherController {
    @Resource
    private EssayService essayService;

    @RequestMapping("/beforeindex")
    public String index(Map<String,Object> map){
        List<Essay> essays=essayService.getAll();
        map.put("essays",essays);
        return  "index";
    }
}
