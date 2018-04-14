package com.cms.Controller;

import com.cms.Entity.User;
import com.cms.Service.CourseService;
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
    
    @Autowired
    private CourseService courseService;
    
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
    
    @RequestMapping("regestersubmit")
    public String regestersubmit(HttpSession session,@RequestParam("username") String username, @RequestParam("password") String password,
                                 @RequestParam("name") String name, @RequestParam("phone") String phone, @RequestParam("email") String email,
                                 @RequestParam("collage") String collage,@RequestParam("major") String major,@RequestParam("grade") int grade,
                                 @RequestParam("classno") int classno, @RequestParam("sex") String sex, @RequestParam("isemailsecret") int isemailsecret, @RequestParam("isphonesecret") int isphonesecret){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setClassno(classno);
        user.setCollage(collage);
        user.setEmail(email);
        user.setPhone(phone);
        user.setSex(sex);
        user.setMajor(major);
        user.setGrade(grade);
        user.setName(name);
        user.setIsmailsecret(isemailsecret);
        user.setIsphonesecret(isphonesecret);
        userService.Regester(user);
        courseService.regester(user.getUsername());
        return "/login";
    }
}
