package com.cms.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentController {
    
    @RequestMapping("/coursetable")
    public String coursetable(){
        return "/coursetable";
    }
}
