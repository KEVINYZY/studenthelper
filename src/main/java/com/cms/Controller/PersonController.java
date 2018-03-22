package com.cms.Controller;


import com.cms.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class PersonController {
    @Autowired 
    private UserService userService;
    
    
    @RequestMapping("/personalInfo")
    public String personInfo(HttpSession session){
        return "/personal";
    }
}
