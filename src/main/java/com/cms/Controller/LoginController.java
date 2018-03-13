package com.cms.Controller;

import com.cms.Entity.Coursetable;
import com.cms.Entity.User;
import com.cms.Service.CourseService;
import com.cms.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;
    
    @RequestMapping("/checklogin")
    @ResponseBody
    public String checkLogin(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
        User user = userService.login(username, password);
        if(user != null){
            session.setAttribute("user", user);
            List<String> todayClass = courseService.QueryCoursetableByDay(user.getUsername());
            return "success";
        }
        else{
            return "error";
        }
    }
    
    @RequestMapping("/login")
    public String login(HttpSession session){
        if(session.getAttribute("user") != null){
            return "/welcome";
        }
        else{
            return "/login";
        }
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        session.setMaxInactiveInterval(1);
        return "login";
    }

}
