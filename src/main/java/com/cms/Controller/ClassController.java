package com.cms.Controller;

import com.cms.Entity.Bbs;
import com.cms.Entity.Comment;
import com.cms.Entity.User;
import com.cms.Service.BBSService;
import com.cms.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
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
        List<Bbs> usertopiclist = bbsService.GetOwnTopic(user.getUsername());
        session.setAttribute("usertopiclist", usertopiclist);
        session.setAttribute("bbsList", bbsList);
        return "myclass";
    }
    
    @RequestMapping("memberdetail")
    public String memberdetail(HttpSession session, HttpServletRequest request){
        String id = request.getParameter("id");
        User detailmember = userService.QueryUserById(id);
        session.setAttribute("detailmember", detailmember);
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
    
    @RequestMapping("/BBSdetail")
    public String BBSdetail(HttpSession session, HttpServletRequest request){
        String studentid = request.getParameter("stu");
        String time = request.getParameter("time");
        Bbs bbs = bbsService.QueryBBSByIdAndTime(studentid, time);
        List<Comment> commentList = bbsService.GetReply(studentid, time);
        session.setAttribute("commentList", commentList);
        session.setAttribute("bbs", bbs);
        return "BBSdetail";
    }
    
    @RequestMapping("/good")
    @ResponseBody
    public String good(HttpSession session, HttpServletRequest request){
        String topicstudentid = request.getParameter("topicstudentid");
        String createtime = request.getParameter("createtime");
        String goodstudentid = request.getParameter("goodstudentid");
        String num = request.getParameter("num");
        String response = bbsService.QueryIsGood(topicstudentid, createtime, goodstudentid);
        if(response == null){
            bbsService.Good(topicstudentid, createtime, goodstudentid);
            this.myclass(session);
            return Integer.parseInt(num) + 1 + "";
        }
        else{
            return "exist";
        }
    }
    
    @RequestMapping("reply")
    @ResponseBody
    public String reply (HttpSession session, @RequestParam("reply") String reply, @RequestParam("topicstudentid") String topicstudentid, @RequestParam("createtime") String createtime){
        User user = (User)session.getAttribute("user");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        bbsService.reply(topicstudentid, createtime, reply, user.getUsername(), user.getName(), sdf.format(new Date()));
        return "success";
    }
    
    @RequestMapping("deletetopic")
    public String deletetopic(HttpSession session, HttpServletRequest request){
        String createtime = request.getParameter("time");
        User user = (User)session.getAttribute("user");
        bbsService.deletetopic(user.getUsername(), createtime);
        return this.myclass(session);
    }
    
}
