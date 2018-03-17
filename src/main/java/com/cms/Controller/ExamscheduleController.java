package com.cms.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class ExamscheduleController {
    
    @RequestMapping("/examschedule")
    public String examschedule(HttpSession session){
        return "/examschedule";
    }
    
    @RequestMapping("/addexam")
    public String addexam(){
        return "examadd";
    }
    
    @RequestMapping("/submitexam")
    public String submitexam(@RequestParam("date") String date, HttpSession session){
        System.out.println(date);
        return this.examschedule(session);
    }
}
