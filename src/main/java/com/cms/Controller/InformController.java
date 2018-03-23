package com.cms.Controller;

import com.cms.Action.InformDigger;
import com.cms.Entity.Inform;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class InformController {
    @RequestMapping("/inform")
    public String inform(HttpSession session){
        Object obj = session.getAttribute("user");
        if(obj == null){
            return "redirect:/login";
        }
        InformDigger informDigger = new InformDigger();
        List<Inform> informs = null;
        try {
            informs = informDigger.getInform();
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("informlist", informs);
        return  "/inform";
    }
    
    @RequestMapping("/detail")
    public String  detail(HttpSession session, HttpServletRequest request){
        Object obj = session.getAttribute("user");
        if(obj == null){
            return "redirect:/login";
        }
        int num = Integer.parseInt(request.getParameter("num"));
        List<Inform> informs = (List<Inform>) session.getAttribute("informlist");
        session.setAttribute("detailnum", ((List<Inform>) session.getAttribute("informlist")).get(num));
        return "/informdetail";
    }
}
