package com.cms.Controller;


import com.cms.Entity.Coursetable;
import com.cms.Entity.User;
import com.cms.Service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller

public class StudentController {
    @Autowired
    private CourseService courseService;
    
    @RequestMapping("/coursetable")
    public String coursetable(HttpSession session){
        String username = ((User)session.getAttribute("user")).getUsername();
        List<Coursetable> coursetables = courseService.QueryCoursetableById(username);
        session.setAttribute("Coursetable", coursetables);
        return "/coursetable";
    }
    
    @RequestMapping("/editcoursetable")
    public String editcoursetable(HttpSession session){
        return "editcoursetable";
    }
    
    @RequestMapping("/submitcoursetable")
    public String submitCoursetable(HttpSession session){
        return this.coursetable(session);
    }
}
