package com.cms.Dao;

import com.cms.Entity.Bbs;
import com.cms.Entity.Comment;
import com.cms.Entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BBSDao {
    void newtopic(Bbs bbs);

    List<Bbs> GetTopicByUser(User user);

    List<Bbs> GetOwnTopic(String studentid);
    
    Bbs QueryBBSByIdAndTime(String studentid, String createtime);
    
    void Good(String studentid, String createtime, String goodstudentid);
    
    String QueryIsGood(String topicstudentid, String createtime, String goodstudentid);
    
    void reply(String topicstudentid, String createtime, String reply, String commentstudentid, String studentname, String commenttime);

    List<Comment> GetReply(String topicstudentid, String createtime);
    
    void deletetopic(String topicstudentid, String createtime);
}
