package com.cms.Controller;


import com.cms.Entity.Coursetable;
import com.cms.Entity.User;
import com.cms.Service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller

public class CoursetableController {
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
    public String submitCoursetable(HttpSession session, HttpServletRequest request){
        Coursetable coursetable = null;
        for (int i = 0; i < 5; i++) {
            coursetable = new Coursetable();
            coursetable.setStudentid(((User)session.getAttribute("user")).getUsername());
            coursetable.setclassNo(i + 1);
            coursetable.setMon(request.getParameter(i + 1 + "Mon"));
            coursetable.setTue(request.getParameter(i + 1 + "Tue"));
            coursetable.setWed(request.getParameter(i + 1 + "Wed"));
            coursetable.setThu(request.getParameter(i + 1 + "Thu"));
            coursetable.setFri(request.getParameter(i + 1 + "Fri"));
            coursetable.setSat(request.getParameter(i + 1 + "Sat"));
            coursetable.setSun(request.getParameter(i + 1 + "Sun"));
            courseService.UpadteCoursetable(coursetable);
        }
        return this.coursetable(session);
    }
}
