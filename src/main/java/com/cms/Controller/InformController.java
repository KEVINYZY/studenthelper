package com.cms.Controller;

import com.cms.Action.InformDigger;
import com.cms.Entity.Inform;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class InformController {
    @RequestMapping("/inform")
    public String inform(HttpSession session){
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
}
