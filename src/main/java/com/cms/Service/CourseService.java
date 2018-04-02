package com.cms.Service;

import com.cms.Dao.CoursetableDao;
import com.cms.Entity.Coursetable;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Service
public class CourseService {
    private Logger log = Logger.getLogger(this.getClass());
    
    @Resource
    private CoursetableDao coursetableDao;
    
    public List<Coursetable> QueryCoursetableById(String username){
        log.info("获取课程表");
        return coursetableDao.QueryCoursetableById(username);
    }
    
    public void UpadteCoursetable(Coursetable coursetable){
        log.info("更新课程表");
        coursetableDao.UpadteCoursetable(coursetable);
    }
    
    public List<String> QueryDaytableById(String studentid){
        SimpleDateFormat sdf = new SimpleDateFormat("E", Locale.ENGLISH);
        Date date = new Date();
        String day = sdf.format(date).toLowerCase();
        log.info("获取" + studentid + "-" + day + "课程表");
        return coursetableDao.QueryDaytableById(day, studentid);
    }
    
    public void regester(String studentid){
        log.info("注册账号课程表");
        coursetableDao.regester(studentid);
    }
}
