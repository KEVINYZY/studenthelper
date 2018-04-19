package com.cms.Service;

import com.cms.Dao.BBSDao;
import com.cms.Entity.Bbs;
import com.cms.Entity.Comment;
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
    
    public List<Bbs> GetOwnTopic(String studentid){
        logger.info("获取用户主题");
        return bbsDao.GetOwnTopic(studentid);
    }
    
    public Bbs QueryBBSByIdAndTime(String studentid, String createtime){
        logger.info("获取选中主题");
        return bbsDao.QueryBBSByIdAndTime(studentid, createtime);
    }
    
    public void Good(String studentid, String createtime, String goodstudentid){
        logger.info("点赞");
        bbsDao.Good(studentid, createtime, goodstudentid);
    }
    
    public String QueryIsGood(String topicstudentid, String createtime, String goodstudentid){
        return bbsDao.QueryIsGood(topicstudentid, createtime, goodstudentid);
    }
    
    public void reply(String topicstudentid, String createtime, String reply, String commentstudentid, String studentname, String commenttime){
        bbsDao.reply(topicstudentid, createtime, reply, commentstudentid, studentname, commenttime);
    }
    
    public List<Comment> GetReply(String topicstudentid, String createtime){
        return bbsDao.GetReply(topicstudentid, createtime);
    }
    
    public void deletetopic(String topicstudentid, String createtime){
        bbsDao.deletetopic(topicstudentid, createtime);
    }
}
