package com.cms.Controller;

import com.cms.Entity.Memo;
import com.cms.Entity.User;
import com.cms.Service.MemoService;
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
public class MemoController {
    @Autowired
    private MemoService memoService;
    
    
    @RequestMapping("/memo")
    public String memo(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login";
        }
        String studentid = (user.getUsername());
        List<Memo> memoList = memoService.QueryMemoById(studentid);
        List<Memo> homememo = memoService.QueryHomeMemoById(studentid);
        session.setAttribute("memolist", memoList);
        session.setAttribute("homememo", homememo);
        return "/memo";
    }
    
    @RequestMapping("/addmemo")
    public String addmemo(HttpSession session){
        return "/addmemo";
    }
    
    @RequestMapping("submitmemo")
    @ResponseBody
    public String submitmemo(HttpSession session, HttpServletRequest request, @RequestParam("title") String title, @RequestParam("detail") String detail, @RequestParam("select") String select, @RequestParam("home") String home){
        if(select.equals("new")){
            Memo memo = new Memo();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
            Date date = new Date();
            String studentid = ((User)session.getAttribute("user")).getUsername();
            memo.setDetail(detail);
            memo.setTitle(title);
            memo.setStudentid(studentid);
            memo.setCreatetime(sdf.format(date));
            memo.setHome((home.equals("true")) ? 1 : 0);
            memoService.addMemo(memo);
            return "success";
        }
        else{
            List<Memo> memoList = (List<Memo>)session.getAttribute("memolist");
            Memo memo = memoList.get(Integer.parseInt(select));
            memo.setDetail(detail);
            memo.setTitle(title);
            memo.setHome((home.equals("true")) ? 1 : 0);
            memoService.updateMemo(memo);
            return "success";
        }
    }
    
    
    
    @RequestMapping("getselect")
    @ResponseBody
    public String getselect(HttpSession session, HttpServletRequest request){
        String select = request.getParameter("selectnum");
        List<Memo> memoList = (List<Memo>)session.getAttribute("memolist");
        Memo memo = memoList.get(Integer.parseInt(select));
        return  memo.getTitle() + "/*/" + memo.getDetail() + "/*/" + memo.getHome();
    }
    
    @RequestMapping("deletememo")
    @ResponseBody
    public String deletememo(HttpSession session, @RequestParam("select") String select){
        List<Memo> memoList = (List<Memo>)session.getAttribute("memolist");
        Memo memo = memoList.get(Integer.parseInt(select));
        memoService.deleteMemo(memo.getStudentid(), memo.getCreatetime());
        return "success";
    }
    
}
