package com.cms.Service;

import com.cms.Dao.CoursetableDao;
import com.cms.Entity.Coursetable;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CourseService {
    private Logger log = Logger.getLogger(this.getClass());
    @Resource
    private CoursetableDao coursetableDao;
    
    public List<Coursetable> QueryCoursetableById(String username){
        log.info("获取课程表");
        return coursetableDao.QueryCoursetableById(username);
    }
}
