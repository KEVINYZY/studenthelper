package com.cms.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testcontroller {
    @RequestMapping("login")
    public String test(){
        return "index";
    }
    
}
