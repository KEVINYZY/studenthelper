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
public class LoginController {
    @Autowired
    private UserService userService;
    
    @RequestMapping("/checklogin")
    public String checkLogin(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
        System.out.println(username  + "-" + password);
        User user = userService.login(username, password);
        if(user != null){
            return "success";
        }
        else{
            return "error";
        }
    }
}
