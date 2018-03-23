package com.cms.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MemoController {
    @RequestMapping("/memo")
    public String memo(HttpSession session){
        return "/memo";
    }
}
