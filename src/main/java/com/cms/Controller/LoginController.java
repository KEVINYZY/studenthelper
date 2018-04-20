package com.cms.Controller;

import com.cms.Action.InformDigger;
import com.cms.Entity.*;
import com.cms.Service.CourseService;
import com.cms.Service.ExamscheduleService;
import com.cms.Service.MemoService;
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
    @Autowired
    private ExamscheduleService examscheduleService;
    @Autowired
    private MemoService memoService;
    
    @RequestMapping("/checklogin")
    @ResponseBody
    public String checkLogin(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
        User user = userService.login(username, password);
        if(user != null){
            session.setAttribute("user", user);
            List<String> todayClass = courseService.QueryDaytableById(user.getUsername());
            List<Examschedule> examschedules = examscheduleService.QueryExamscheduleById(user.getUsername());
            List<Memo> homememo = memoService.QueryHomeMemoById(user.getUsername());
            InformDigger informDigger = new InformDigger();
            List<Inform> informs = null;
            try {
                informs = informDigger.getInform();
            } catch (Exception e) {
                e.printStackTrace();
            }
            session.setAttribute("homememo", homememo);
            session.setAttribute("informlist", informs);
            session.setAttribute("examschedule", examschedules);
            session.setAttribute("todaytable", todayClass);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日E");
            Date date = new Date();
            String day = sdf.format(date);
            session.setAttribute("today", day);
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
        session.removeAttribute("today");
        session.removeAttribute("Coursetable");
        session.removeAttribute("informlist");
        session.removeAttribute("memolist");
        session.removeAttribute("homememo");
        session.setMaxInactiveInterval(1);
        return "redirect:/login";
    }
    
    @RequestMapping("about")
    public String about(HttpSession session){
        return "about";
    }

}
