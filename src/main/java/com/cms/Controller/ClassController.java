package com.cms.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ClassController {

    @RequestMapping("myclass")
    public String myclass(HttpSession session){
        return "myclass";
    }
}
