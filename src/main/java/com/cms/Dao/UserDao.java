package com.cms.Dao;


import com.cms.Entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    User login (@Param("username") String username, @Param("password")String password);
    
    void revisePassword(@Param("studentid") String studentid, @Param("revisepwd") String revisepwd);
    
    void updateUser(User user);
}