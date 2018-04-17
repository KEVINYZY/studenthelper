package com.cms.Service;

import com.cms.Dao.BBSDao;
import com.cms.Entity.Bbs;
import com.cms.Entity.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BBSService {
    private Logger logger = Logger.getLogger(getClass());
    
    @Resource
    private BBSDao bbsDao;
    
    public void newtopic(Bbs bbs){
        logger.info("发表新主题");
        bbsDao.newtopic(bbs);
    }
    
    public List<Bbs> GetTopicByUser(User user){
        logger.info("获取所有主题");
        return bbsDao.GetTopicByUser(user);
    }
}
