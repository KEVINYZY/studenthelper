package com.cms.Dao;

import com.cms.Entity.Bbs;
import com.cms.Entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BBSDao {
    void newtopic(Bbs bbs);

    List<Bbs> GetTopicByUser(User user);
}
