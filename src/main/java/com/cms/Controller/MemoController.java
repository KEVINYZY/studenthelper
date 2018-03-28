package com.cms.Controller;

import com.cms.Entity.Memo;
import com.cms.Entity.User;
import com.cms.Service.MemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class MemoController {
    @Autowired
    private MemoService memoService;
    
    
    @RequestMapping("/memo")
    public String memo(HttpSession session){
        Object obj = session.getAttribute("user");
        if(obj == null){
            return "redirect:/login";
        }
        String studentid = ((User)session.getAttribute("user")).getUsername();
        List<Memo> memoList = memoService.QueryMemoById(studentid);
        session.setAttribute("memolist", memoList);
        return "/memo";
    }
    
    @RequestMapping("/addmemo")
    public String addmemo(HttpSession session){
        return "/addmemo";
    }
    
    @RequestMapping("submitmemo")
    public String submitmemo(HttpSession session, @RequestParam("title") String title, @RequestParam("detail") String detail){
        Memo memo = new Memo();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        Date date = new Date();
        String studentid = ((User)session.getAttribute("user")).getUsername();
        memo.setDetail(detail);
        memo.setTitle(title);
        memo.setStudentid(studentid);
        memo.setCreatetime(sdf.format(date));
        memo.setHome(0);
        memoService.addMemo(memo);
        return "redirect:" + this.memo(session);
    }
}
