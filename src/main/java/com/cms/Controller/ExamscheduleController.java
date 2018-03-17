package com.cms.Controller;

import com.cms.Entity.Examschedule;
import com.cms.Entity.User;
import com.cms.Service.ExamscheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String addexam(){
        return "examedit";
    }
    
    @RequestMapping("/submitexam")
    public String submitexam(@RequestParam("date") String date, @RequestParam("examsubject") String examsubject, @RequestParam("place") String place, @RequestParam("remark") String remark, HttpSession session){
        Examschedule examschedule = new Examschedule();
        examschedule.setStudentid(((User)session.getAttribute("user")).getUsername());
        examschedule.setExamname(examsubject);
        examschedule.setExamplace(place);
        examschedule.setExamtime(date.replace("T", " "));
        examschedule.setRemark(remark);
        examscheduleService.addExam(examschedule);
        return this.examschedule(session);
    }
}
