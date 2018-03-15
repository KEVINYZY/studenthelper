package com.cms.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ExamscheduleController {
    
    @RequestMapping("/examschedule")
    public String countdown(HttpSession session){
        return "examschedule";
    }
}
