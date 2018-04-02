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
    
    public void revisePassword(String studentid, String revisepwd){
        log.info("修改密码");
        userDao.revisePassword(studentid, revisepwd);
    }
    
    public void updateUser(User user){
        log.info("修改个人资料");
        userDao.updateUser(user);
    }
    
    public User QueryUserById(String username){
        return userDao.QueryUserById(username);
    }
    
    public void Regester(User user){
        log.info("注册账号");
        userDao.Regester(user);
    }
    
}