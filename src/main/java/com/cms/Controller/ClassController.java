package com.cms.Controller;

import com.cms.Entity.Bbs;
import com.cms.Entity.User;
import com.cms.Service.BBSService;
import com.cms.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ClassController {
    @Autowired
    private UserService userService;
    
    @Autowired
    private BBSService bbsService;
    
    @RequestMapping("/myclass")
    public String myclass(HttpSession session){
        User user = (User)session.getAttribute("user");
        List<User> classmemberlist = userService.GetUserlistByUser(user);
        session.setAttribute("classmember", classmemberlist);
        List<Bbs> bbsList = bbsService.GetTopicByUser(user);
        session.setAttribute("bbsList", bbsList);
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
    public String newtopic(HttpSession session, @RequestParam("topictitle") String topictitle, @RequestParam("topicdetail") String topicdetail){
        Bbs bbs = new Bbs();
        User user = (User)session.getAttribute("user");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        bbs.setStudentid(user.getUsername());
        bbs.setDetail(topicdetail);
        bbs.setCreatetime(sdf.format(new Date()));
        bbs.setTitle(topictitle);
        bbsService.newtopic(bbs);
        return "success";
    }
    
    
}
