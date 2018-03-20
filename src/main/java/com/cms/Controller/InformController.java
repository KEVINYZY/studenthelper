package com.cms.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class InformController {
    @RequestMapping("/inform")
    public String inform(HttpSession session){
        return  "/inform";
    }
}
