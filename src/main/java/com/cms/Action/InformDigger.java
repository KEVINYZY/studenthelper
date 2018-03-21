package com.cms.Action;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.cms.Entity.Inform;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;


public class InformDigger {
    public List<Inform> getInform() throws Exception{
        List<Inform> informs = new ArrayList<Inform>();
        Document doc = Jsoup.connect("http://my.dlmu.edu.cn/student/oaxstz.h?pageNo=1").get();
        Elements content = doc.select("table").get(4).select("a");
        for (int i = 0; i < 20; i++) {
            //System.out.println("http://my.dlmu.edu.cn" + content.get(i).attr("href") + " --- " + content.get(i).attr("title"));
            informs.add(this.getInform("http://my.dlmu.edu.cn" + content.get(i).attr("href")));
        }
        return informs;
    }
    
    public Inform getInform(String url) throws Exception{
        Inform inform = new Inform();
        Document doc = Jsoup.connect(url).get();
        Elements title = doc.getElementsByClass("ctitle1");
        Elements info = doc.getElementsByClass("ctitleinfo");
        Elements pbox = doc.getElementsByClass("pbox");
        inform.setTitle(title.text());
        inform.setInfo(info.text());
        inform.setPbox(pbox.text());
        return inform;
    }

}