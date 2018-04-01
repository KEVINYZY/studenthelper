package com.cms.Controller;

import com.cms.Entity.User;
import com.cms.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class RegesterController {
    @Autowired
    private UserService userService;
    
    @RequestMapping("regester")
    public String regester (HttpSession session){
        return "regester";
    }
    
    
    @RequestMapping("checkusername")
    @ResponseBody
    public String checkusername(HttpSession session, @RequestParam("username") String username){
        User user = userService.QueryUserById(username);
        if(user != null){
            return "exist";
        }
        return "success";
    }
}
