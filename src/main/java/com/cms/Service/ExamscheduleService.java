package com.cms.Service;

import com.cms.Dao.ExamscheduleDao;
import com.cms.Entity.Examschedule;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ExamscheduleService {
    Logger logger = Logger.getLogger(this.getClass());
    @Resource
    private ExamscheduleDao examscheduleDao;
    
    public void addExam(Examschedule examschedule){
        logger.info("添加考试");
        examscheduleDao.addExamschedule(examschedule);
    }
    
    public List<Examschedule> QueryExamscheduleById(String studentid){
        logger.info("获取考试安排");
        return examscheduleDao.QueryExamscheduleById(studentid);
    }
}
