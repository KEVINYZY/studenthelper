package com.cms.Controller;

import com.cms.Entity.Examschedule;
import com.cms.Entity.User;
import com.cms.Service.ExamscheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ExamscheduleController {
    
    @Autowired
    private ExamscheduleService examscheduleService;
    
    @RequestMapping("/examschedule")
    public String examschedule(HttpSession session){
        String studentid = ((User)session.getAttribute("user")).getUsername();
        List<Examschedule> examschedules = examscheduleService.QueryExamscheduleById(studentid);
        session.setAttribute("examschedule", examschedules);
        return "/examschedule";
    }
    
    @RequestMapping("/examedit")
    public String addexam(HttpServletRequest request, HttpSession session){
        return "examedit";
    }
    
    @RequestMapping("/submitexam")
    public String submitexam(@RequestParam("date") String date, @RequestParam("examsubject") String examsubject, @RequestParam("place") String place, @RequestParam("remark") String remark, HttpSession session){
        Examschedule examschedule = new Examschedule();
        examschedule.setStudentid(((User)session.getAttribute("user")).getUsername());
        examschedule.setExamname(examsubject);
        examschedule.setExamplace(place);
        examschedule.setExamtime(date.replace("T", " "));
        System.out.println(date);
        examschedule.setRemark(remark);
        examscheduleService.addExam(examschedule);
        return "redirect:" + this.examschedule(session);
    }
    
    @RequestMapping("examdelete")
    public String examdelete(HttpSession session, HttpServletRequest request){
        String deletenum = request.getParameter("delete");
        String studentid = ((User)session.getAttribute("user")).getUsername();
        String examname = ((List<Examschedule>)session.getAttribute("examschedule")).get(Integer.parseInt(deletenum)).getExamname();
        examscheduleService.DeleteExamscheduleByName(examname, studentid);
        return "redirect:" + this.examschedule(session);
    }
}
