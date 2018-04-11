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
public class UserInfoController {
    @Autowired
    private UserService userService;
    
    
    @RequestMapping("/revisepassword")
    @ResponseBody
    public String revisepassword(HttpSession session, @RequestParam("old") String old, @RequestParam("newpwd") String newpwd){
        User user = (User) session.getAttribute("user");
        if(!old.equals(user.getPassword())){
            return "errorpassworrd";
        }
        else{
            user.setPassword(newpwd);
            session.setAttribute("user", user);
            userService.revisePassword(user.getUsername(), newpwd);
            return "success";
        }
    }
    
    @RequestMapping("updateuser")
    public String updateuser(HttpSession session, @RequestParam("phone") String phone, @RequestParam("email") String email){
        User user = (User) session.getAttribute("user");
        user.setEmail(email);
        user.setPhone(phone);
        session.setAttribute("user", user);
        return "/personal";
    }

    @RequestMapping("/personalInfo")
    public String personInfo(HttpSession session){
        Object obj = session.getAttribute("user");
        if(obj == null){
            return "redirect:/login";
        }
        return "/personal";
    }
    
    @RequestMapping("introduction")
    @ResponseBody
    public String introduction(HttpSession session, @RequestParam("introduction") String introduction){
        User user = (User) session.getAttribute("user");
        userService.UpdateIntroduction(introduction, user.getUsername());
        user.setIntroduction(introduction);
        session.setAttribute("user",user);
        return "success";
    }
}
 