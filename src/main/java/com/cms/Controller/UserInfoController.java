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
    public String updateuser(HttpSession session,@RequestParam("name") String name, 
                             @RequestParam("sex") String sex, 
                             @RequestParam("phone") String phone, 
                             @RequestParam("email") String email, 
                             @RequestParam("collage") String collage, 
                             @RequestParam("major") String major, 
                             @RequestParam("grade") int grade, 
                             @RequestParam("classno") int classno){
        User user = (User) session.getAttribute("user");
        User updateuser = new User();
        updateuser.setUsername(user.getUsername());
        updateuser.setPassword(user.getPassword());
        updateuser.setIdentity(user.getIdentity());
        updateuser.setClassno(classno);
        updateuser.setCollage(collage);
        updateuser.setEmail(email);
        updateuser.setPhone(phone);
        updateuser.setSex(sex);
        updateuser.setMajor(major);
        updateuser.setGrade(grade);
        updateuser.setName(name);
        userService.updateUser(updateuser);
        session.setAttribute("user", updateuser);
        return "/personal";
    }

    
    
}
