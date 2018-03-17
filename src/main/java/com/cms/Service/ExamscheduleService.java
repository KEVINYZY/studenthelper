package com.cms.Service;

import com.cms.Dao.ExamscheduleDao;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ExamscheduleService {
    Logger logger = Logger.getLogger(this.getClass());
    
    @Resource
    private ExamscheduleDao examscheduleDao;
}
