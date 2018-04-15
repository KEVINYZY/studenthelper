package com.cms.Controller;

import com.cms.Entity.User;
import com.cms.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ClassController {
    @Autowired
    private UserService userService;
    
    @RequestMapping("myclass")
    public String myclass(HttpSession session){
        User user = (User)session.getAttribute("user");
        List<User> classmemberlist = userService.GetUserlistByUser(user);
        session.setAttribute("classmember", classmemberlist);
        return "myclass";
    }
    
    @RequestMapping("memberdetail")
    public String memberdetail(HttpSession session, HttpServletRequest request){
        List<User> classmenber = (List<User>)session.getAttribute("classmember");
        int no = Integer.parseInt(request.getParameter("no"));
        session.setAttribute("detailmember", classmenber.get(no));
        return "memberdetail";
    }
    
    @RequestMapping("newtopic")
    @ResponseBody
    public String newtopic(HttpServletRequest request, HttpSession session){
        return "success";
    }
}
