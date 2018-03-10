package com.cms.Service;

import com.cms.Dao.UserDao;
import com.cms.Entity.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserService {
    private Logger log = Logger.getLogger(this.getClass());
    @Resource
    private UserDao userDao;
    
    public User login(String username, String password){
        log.info("用户登录");
        return userDao.login(username, password);
    }
    
}